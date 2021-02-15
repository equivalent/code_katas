require 'spec_helper'

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
