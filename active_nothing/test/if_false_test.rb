require 'minitest/autorun'
require_relative '../lib/object_extensions'

describe Object do
  before do
    @mock = MiniTest::Mock.new
  end

  describe '#if_false' do
    it 'should not call block on true' do
      true
        .if_false { @mock.call_stuff  }
        .must_equal true
      @mock.verify
    end

    it 'should not call block on string value' do
      'bubla'
        .if_false { @mock.call_stuff  }
        .must_equal 'bubla'
      @mock.verify
    end

    it 'should call block on false' do
      @mock.expect :call_stuff, 'return_value_not_important'
      false
        .if_false { @mock.call_stuff  }
        .must_equal false
      @mock.verify
    end

    it 'should call block on false' do
      @mock.expect :call_stuff, 'return_value_not_important'
      nil
        .if_false { @mock.call_stuff  }
        .must_equal nil
      @mock.verify
    end
  end
end
