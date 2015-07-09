require 'spec_helper'

class Gear
  attr_reader :chainring, :cog

  def initialize(chainring, cog)
    @chainring = chainring
    @cog       = cog
  end

  def ratio
    chainring / cog.to_f
  end
end

RSpec.describe Gear do
  it do
    expect(Gear.new(52, 11).ratio).to be_within(0.01).of(4.72)
  end

  it do
    expect(Gear.new(30, 27).ratio).to be_within(0.01).of(1.11)
  end
end
