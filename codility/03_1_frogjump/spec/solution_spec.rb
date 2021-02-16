require 'spec_helper'
require 'irb'
module Solution
  extend self

  def solution(x,y,d)
    return 0 if x == y
    return 0 if x > y
    count = (y-x) / d.to_f
    count.ceil
  end
end

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

  context do
    let(:x) { 1 }
    let(:y) { 1_000_000_000 }
    let(:d) { 1 }

    it { expect(res).to eq 999_999_999 }
  end

  context do
    let(:x) {   900 }
    let(:y) { 1_000 }
    let(:d) { 17 }

    it { expect(res).to eq 6 }
  end

  context do
    let(:x) { 9 }
    let(:y) { 8 }
    let(:d) { 1 }

    it { expect(res).to eq 0 }
  end

  context do
    let(:x) { 2 }
    let(:y) { 9 }
    let(:d) { 1_000 }

    it { expect(res).to eq 1 }
  end
end
