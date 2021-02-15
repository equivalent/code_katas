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
  end
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
    it { expect(res).to eq 4 }
  end

  context do
    let(:n) { 15 } # 1111
    it { expect(res).to eq 0 }
  end

  context do
    let(:n) { 32 } # 100000
    it { expect(res).to eq 0 }
  end
end
