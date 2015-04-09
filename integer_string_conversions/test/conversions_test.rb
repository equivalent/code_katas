# based on Avdi Grims Ruby Tapas episode 293
#
require 'minitest/autorun'

describe Integer do

  describe 'using "conversion function"' do
    it 'should convert string to integer' do
      Integer("42").must_be_kind_of Integer
      Integer("42").must_equal 42
    end

    it 'should convert binary string to integer' do
      Integer("101010", 2).must_be_kind_of Integer
      Integer("101010", 2).must_equal 42
    end

    it 'should convert binary string to integer' do
      Integer("52", 8).must_be_kind_of Integer
      Integer("52", 8).must_equal 42
    end

    it 'should convert hex string to integer' do
      Integer("2A", 16).must_be_kind_of Integer
      Integer("2A", 16).must_equal 42
    end

    it 'should raise exception when trying to parse incorect value' do
      ->{ Integer("2A", 8) }.must_raise ArgumentError
    end
  end

  describe 'using to_i methond' do
    it 'should convert string to integer' do
      "42".to_i.must_be_kind_of Integer
      "42".to_i.must_equal 42
    end

    it 'should convert binary string to integer in dec' do
      "101010".to_i(2).must_be_kind_of Integer
      "101010".to_i(2).must_equal 42
    end

    it 'should convert binary string to integer in octal' do
      "52".to_i(8).must_be_kind_of Integer
      "52".to_i(8).must_equal 42
    end

    it 'should convert hex string to integer' do
      "2A".to_i(16).must_be_kind_of Integer
      "2A".to_i(16).must_equal 42
    end

    it 'will convert first integer to value ' do
      "2A".to_i(8).must_equal 2
    end
  end
end
