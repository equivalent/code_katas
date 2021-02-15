require 'irb'
require 'spec_helper'


#Write a function:
#
#   def solution(n)
#
#that, given a positive integer N, returns the length of its longest binary gap. The function should return 0 if N doesn't contain a binary gap.
#
#N is an integer within the range [1..2,147,483,647].

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

  # as Codity is interested mainly on performance and not on code elegance this code is ugly but satisies
  # Codity performance benchmarks
  #
  # Notable other more pretty Ruby solutions may involve:
  #
  #   binary.scan(/0+/).max.size
  #
  # or
  #
  #  binary.split('1') # and counting longest occurance of zeros (Of course remove 0 sufixes and prefixes first from str
end



RSpec.describe Solution do
  include Solution

  let(:res) { solution(n)  }

  context do
    let(:n) { 9 } # 1001
    it { expect(res).to eq 2 }
  end

  context do
    let(:n) { 529 } # 1000010001
    it { expect(res).to eq 4 }
  end

  context do
    let(:n) { 20 } # 10100
    it { expect(res).to eq 1 }
  end

  context do
    let(:n) { 15 } # 1111
    it { expect(res).to eq 0 }
  end

  context do
    let(:n) { 32 } # 100000
    it { expect(res).to eq 0 }
  end

  # my examples

  context do
    let(:n) { 93209 } # 10110110000011001
    it { expect(res).to eq 5 }
  end

  context do
    let(:n) { 2_147_483_647 } # 1111111111111111111111111111111
    it { expect(res).to eq 0 }
  end

  context do
    let(:n) { 0 }
    it { expect(res).to eq 0 }
  end

  context do
    let(:n) { 1 }
    it { expect(res).to eq 0 }
  end

  context do
    let(:n) { 2_147_000_647 } # 1111111111110001010000101000111
    it { expect(res).to eq 4 }
  end
end
