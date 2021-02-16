require 'spec_helper'
require 'irb'
module Solution
  extend self

  def solution(a)
    return 1 if a.empty?
    (1..(a.size + 1)) .inject(:+) - a.inject(:+)
  end
end

RSpec.describe Solution do
  let(:res) { described_class.solution(a) }

  context do
    let(:a) { [2, 3, 1, 5] }

    it { expect(res).to eq 4 }
  end

  # my scenarios
  context do
    let(:a) { [2, 3, 1, 5, 6] }

    it { expect(res).to eq 4 }
  end

  context do
    let(:a) { [] }

    it { expect(res).to eq 1 }
  end

  context do
    let(:a) { [1,3] }

    it { expect(res).to eq 2 }
  end

  context do
    let(:a) { [1,2] }

    it { expect(res).to eq 3 }
  end

  context do
    let(:a) { [1] }

    it { expect(res).to eq 2 }
  end

  context do
    let(:a) { (1..100_000).to_a - [517] }

    it { expect(res).to eq 517 }
  end


  xcontext do  # this will never happen !!!
    let(:a) { [3, 6, 4] }

    it { expect(res).to eq 5 }
  end


end
