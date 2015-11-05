require 'minitest/autorun'

class Foo
  ExceededMaximum = Class.new(StandardError)

  attr_reader :maximum

  def initialize(maximum = 1_000_000_000)
    @maximum = maximum
  end

  def solution(a, b)
    Array
      .new(a > b ? a : b)
      .zip(a.to_s.chars,b.to_s.chars)
      .flatten
      .compact
      .join
      .to_i
      .tap { |number| raise ExceededMaximum if number > maximum }
    rescue ExceededMaximum
      -1
  end
end

describe Foo do
  let(:subject) { Foo.new }

  it do
    subject.solution(12,56).must_equal 1526
  end

  it do
    subject.solution(56,12).must_equal 5162
  end

  it do
    subject.solution(12345,678).must_equal 16273845
  end

  it do
    subject.solution(123,67890).must_equal 16273890
  end

  it do
    subject.solution(1234,0).must_equal 10234
  end

  describe 'given maximum set' do
    # if you pass here number 1_000_000_000 it's a huge iteration,
    # this will ensure test run faster
    let(:subject) { Foo.new(109_999) }

    it do
      subject.solution(100,100).must_equal -1
    end
  end
end
