require 'spec_helper'

module Solution
  def solution(a, k)
    return a if a.size < 2
    k.times do
      a.unshift(a.pop)
    end
    a
  end
end

RSpec.describe Solution do
  include Solution

  let(:res) { solution(a, k) }

  context do
    let(:a) { [3, 8, 9, 7, 6] }
    let(:k) { 3 }

    it { expect(res).to eq [9, 7, 6, 3, 8] }
  end

  context do
    let(:a) { [0, 0, 0] }
    let(:k) { 1 }

    it { expect(res).to eq [0, 0, 0] }
  end

  context do
    let(:a) { [1,2,3,4] }
    let(:k) { 4 }

    it { expect(res).to eq [1,2,3,4] }
  end

  # my examples

  context do
    let(:a) { [-2, -1000, 1, 3, 1000] }

    context do
      let(:k) { 1 }
      it { expect(res).to eq [1000, -2, -1000, 1, 3] }
    end

    context do
      let(:k) { 3 }
      it { expect(res).to eq [1, 3, 1000, -2, -1000] }
    end
  end

  context do
    let(:a) { [] }
    let(:k) { 5 }

    it { expect(res).to eq [] }
  end

  context do
    let(:a) { [1] }
    let(:k) { 100 }

    it { expect(res).to eq [1] }
  end
end
