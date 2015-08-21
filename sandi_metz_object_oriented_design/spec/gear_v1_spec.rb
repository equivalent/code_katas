require 'spec_helper'

class Gear
  attr_reader :chainring, :cog, :wheel

  def initialize(chainring, cog, wheel)
    @chainring = chainring
    @cog       = cog
    @wheel     = wheel
  end

  def ratio
    chainring / cog.to_f
  end

  def gear_inches
    ratio * wheel.diameter
  end
end

class Wheel
  attr_reader :rim, :tire

  def initialize(rim, tire)
    @rim  = rim
    @tire = tire
  end

  def diameter
    rim + (tire * 2)
  end

  def circumference
    diameter * Math::PI
  end
end

module GearWrapper
  def self.gear(args)
    Gear.new(args[:chainring], args[:cog], args[:wheel])
  end
end

RSpec.describe Gear do
  let(:wheel) { Wheel.new(26, 1.5) }

  it do
    expect(Gear.new(52, 11, wheel).ratio).to be_within(0.01).of(4.72)
  end

  it do
    expect(Gear.new(30, 27, wheel).ratio).to be_within(0.01).of(1.11)
  end
end

RSpec.describe GearWrapper do
  subject(:gear_wrapper) { described_class.gear cog: 4, wheel: wheel, chainring: 11 }
  let(:wheel) { instance_double Wheel }

  it 'initialize Gear object with expected cog' do
    expect(subject.cog).to be 4
  end

  it 'initialize Gear object with expected wheel' do
    expect(subject.wheel).to be wheel
  end

  it 'initialize Gear object with expected chainring' do
    expect(subject.chainring).to be 11
  end
end
