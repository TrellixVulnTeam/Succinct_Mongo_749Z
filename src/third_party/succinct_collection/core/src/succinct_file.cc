#include "succinct_file.h"

SuccinctFile::SuccinctFile(std::string filename, SuccinctMode s_mode,
                           uint32_t sa_sampling_rate,
                           uint32_t isa_sampling_rate,
                           uint32_t npa_sampling_rate,
                           SamplingScheme sa_sampling_scheme,
                           SamplingScheme isa_sampling_scheme,
                           NPA::NPAEncodingScheme npa_encoding_scheme,
                           uint32_t context_len, uint32_t sampling_range)
    : SuccinctCore(filename.c_str(), s_mode, sa_sampling_rate,
                   isa_sampling_rate, npa_sampling_rate, context_len,
                   sa_sampling_scheme, isa_sampling_scheme, npa_encoding_scheme,
                   sampling_range) {
}

uint64_t SuccinctFile::ComputeContextValue(const char *p, uint64_t i) {
  uint64_t val = 0;
  for (uint64_t t = i; t < i + npa_->GetContextLength(); t++) {
    val = val * alphabet_size_ + alphabet_map_[p[t]].second;
  }

  return val;
}

std::pair<int64_t, int64_t> SuccinctFile::GetRange(const char *p,
                                                   uint64_t len) {
  std::pair<int64_t, int64_t> range(0, -1);
  int64_t left, right, c1, c2;

  if (alphabet_map_.find(p[len - 1]) != alphabet_map_.end()) {
    left = (alphabet_map_[p[len - 1]]).first;
    right = alphabet_map_[alphabet_[alphabet_map_[p[len - 1]].second + 1]].first
        - 1;
  } else {
    return range;
  }

  for (int64_t i = len - 2; i >= 0; i--) {
    if (alphabet_map_.find(p[i]) != alphabet_map_.end()) {
      c1 = alphabet_map_[p[i]].first;
      c2 = alphabet_map_[alphabet_[alphabet_map_[p[i]].second + 1]].first - 1;
    } else
      return range;

    if (c2 < c1) {
      return range;
    }

    left = npa_->BinarySearch(left, c1, c2, false);
    right = npa_->BinarySearch(right, left, c2, true);

    if (left > right) {
      return range;
    }
  }

  range.first = left;
  range.second = right;
  return range;
}

/*
std::pair<int64_t, int64_t> SuccinctFile::GetRange(const char *p,
                                                   uint64_t len) {
  uint64_t m = strlen(p);

  if (m <= npa_->GetContextLength()) {
    return GetRangeSlow(p, len);
  }

  typedef std::pair<int64_t, int64_t> Range;

  Range range(0, -1);
  uint32_t sigma_id;
  int64_t left, right, c1, c2;
  uint64_t start_off;
  uint64_t context_val, context_id;

  // Get the sigma_id and context_id corresponding to the last
  // context and sigma

  // Get sigma_id:
  if (alphabet_map_.find(p[m - npa_->GetContextLength() - 1])
      == alphabet_map_.end())
    return range;
  sigma_id = alphabet_map_[p[m - npa_->GetContextLength() - 1]].second;

  // Get context_id:
  context_val = ComputeContextValue(p, m - npa_->GetContextLength());
  if (npa_->contexts_.find(context_val) == npa_->contexts_.end())
    return range;
  context_id = npa_->contexts_[context_val];

  // Get start offset:
  start_off = GetRank1(&(npa_->col_nec_[sigma_id]), context_id) - 1;

  // Get left boundary:
  left = npa_->col_offsets_[sigma_id]
      + npa_->cell_offsets_[sigma_id][start_off];

  // Get right boundary:
  if (start_off + 1 < npa_->cell_offsets_[sigma_id].size()) {
    right = npa_->col_offsets_[sigma_id]
        + npa_->cell_offsets_[sigma_id][start_off + 1] - 1;
  } else if ((sigma_id + 1) < alphabet_size_) {
    right = npa_->col_offsets_[sigma_id + 1] - 1;
  } else {
    right = input_size_ - 1;
  }

  if (left > right)
    return range;

  for (int64_t i = m - npa_->GetContextLength() - 2; i >= 0; i--) {
    // Get sigma_id:
    if (alphabet_map_.find(p[i]) == alphabet_map_.end())
      return range;
    sigma_id = alphabet_map_[p[i]].second;

    // Get context_id:
    context_val = ComputeContextValue(p, i + 1);
    if (npa_->contexts_.find(context_val) == npa_->contexts_.end())
      return range;
    context_id = npa_->contexts_[context_val];

    // Get start offset:
    start_off = GetRank1(&(npa_->col_nec_[sigma_id]), context_id) - 1;

    // Get left boundary:
    c1 = npa_->col_offsets_[sigma_id]
        + npa_->cell_offsets_[sigma_id][start_off];

    // Get right boundary:
    if (start_off + 1 < npa_->cell_offsets_[sigma_id].size()) {
      c2 = npa_->col_offsets_[sigma_id]
          + npa_->cell_offsets_[sigma_id][start_off + 1] - 1;
    } else if ((sigma_id + 1) < alphabet_size_) {
      c2 = npa_->col_offsets_[sigma_id + 1] - 1;
    } else {
      c2 = input_size_ - 1;
    }
    if (c2 < c1)
      return range;

    left = npa_->BinarySearch(left, c1, c2, false);
    right = npa_->BinarySearch(right, left, c2, true);

    if (left > right)
      return range;
  }

  range.first = left;
  range.second = right;

  return range;
}
*/

void SuccinctFile::Extract(std::string& result, uint64_t offset, uint64_t len) {
  result.resize(len);
  uint64_t idx = LookupISA(offset);
  for (uint64_t k = 0; k < len; k++) {
    result[k] = alphabet_[LookupC(idx)];
    idx = LookupNPA(idx);
  }
}

uint64_t SuccinctFile::Count(const std::string& str) {
  std::pair<int64_t, int64_t> range = GetRange(str.c_str(), str.length());
  return range.second - range.first + 1;
}

void SuccinctFile::Search(std::vector<int64_t>& result, const std::string& str) {
  std::pair<int64_t, int64_t> range = GetRange(str.c_str(), str.length());
  if (range.first > range.second)
    return;
  result.resize((uint64_t) (range.second - range.first + 1));
  for (int64_t i = range.first; i <= range.second; i++) {
    result[i - range.first] = ((int64_t) LookupSA(i));
  }
}

void SuccinctFile::RegexSearch(std::set<std::pair<size_t, size_t>>& results,
                               const std::string& query) {
  SRegEx re(query, this, true);
  re.Execute();
  re.GetResults(results);
}
