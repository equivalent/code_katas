require 'spec_helper'
module Solution
  extend self

  def solution(x,y,d)
    return 0 if x == y
    count = 0
    begin
      count += 1
      x = x + d
    end while x < y
    count
  end
end


# given three integers X, Y and D, returns the minimal number of jumps from position X to a position equal to or greater than Y.
#
# X, Y and D are integers within the range [1..1,000,000,000];
# X ≤ Y.

RSpec.describe Solution do
  let(:res) { described_class.solution(x,y,d) }

  context do
    let(:x) { 10 }
    let(:y) { 85 }
    let(:d) { 30 }

    it { expect(res).to eq 3 }
  end

  # my scenarios

  context do
    let(:x) { 10 }
    let(:y) { 70 }
    let(:d) { 30 }

    it { expect(res).to eq 2 }
  end

  context do
    let(:x) { 1 }
    let(:y) { 1 }
    let(:d) { 1 }

    it { expect(res).to eq 0 }
  end

  context do
    let(:x) { 1 }
    let(:y) { 2 }
    let(:d) { 1 }

    it { expect(res).to eq 1 }
  end

  context do
    let(:x) { 1 }
    let(:y) { 2 }
    let(:d) { 1_000_000 }

    it { expect(res).to eq 1 }
  end

  xcontext do
    let(:x) { 1 }
    let(:y) { 1_000_000_000 }
    let(:d) { 1 }

    it { expect(res).to eq 1 }
  end
end
