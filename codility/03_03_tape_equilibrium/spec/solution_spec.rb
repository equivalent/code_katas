require 'spec_helper'
require 'irb'
module Solution
  extend self

  def solution(a)
    # 0 < P < a.size

    minimum_division = nil
    (1..a.size-1).each do |pp|
      part1 = a[0..(pp-1)]

      part2 = a[pp..(a.size-1)]

      abs_division = (part1.inject(:+).abs - part2.inject(:+).abs).abs
      minimum_division ||= abs_division
      minimum_division = abs_division if abs_division < minimum_division
    end
    minimum_division
  end
end

RSpec.describe Solution do
  let(:res) { described_class.solution(a) }

  context do
    let(:a) { [3, 1, 2, 4, 3] }
    it { expect(res).to eq 1 }
  end

  # my examples
  context do
    let(:a) { (1..5).to_a }
    it { expect(res).to eq 3 }
  end

  context do
    let(:a) { [-3,-2,-1] }
    it { expect(res).to eq 0 }
  end

  context do
    let(:a) { [-4, -3,-2,-1] }
    it { expect(res).to eq 2 }
  end

  context do
    let(:a) { [-8, 2, 3] }
    it { expect(res).to eq 3 }
  end

  context do
    let(:a) { [-10, -8, 2, 3] }
    it { expect(res).to eq 7 }
  end

  context do
    let(:a) { [1,2] }
    it { expect(res).to eq 1 }
  end

  context do
    let(:a) { [1,1] }
    it { expect(res).to eq 0 }
  end

  context do
    let(:a) { (-1000..1000).to_a }
    it { expect(res).to eq 0 }
  end
end
