require 'minitest/autorun'

class Foo
  class << self
    define_method :my_class_method do
      'bar'
    end
  end

  define_method :my_instance_method do
    'foo'
  end
end

describe Foo do
  it 'my meta class method must be defined' do
    expect(Foo).must_respond_to :my_class_method
  end

  it 'my meta instance method must be defined' do
    expect(Foo.new).must_respond_to :my_instance_method
  end
end
