module Solution
  def solution(n)
    binary = n.to_s(2)
    start_counting = false
    top_gap_count = 0
    current_gap_count = 0
    binary.chars.each do |ch|
      if ch == '1'
        start_counting = true
        top_gap_count = current_gap_count if current_gap_count > top_gap_count
        current_gap_count = 0
      else # ch == 0
        current_gap_count += 1 if start_counting
      end
    end
    top_gap_count
  end
end
