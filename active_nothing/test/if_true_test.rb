require 'minitest/autorun'
require_relative '../lib/object_extensions'

describe Object do
  before do
    @mock = MiniTest::Mock.new
  end

  describe '#if_true' do
    it 'should call block on true' do
      @mock.expect :call_stuff, 'return_value_not_important'
      true
        .if_true { @mock.call_stuff  }
        .must_equal true
      @mock.verify
    end

    it 'should call block on string value' do
      @mock.expect :call_stuff, 'return_value_not_important'
      'bubla'
        .if_true { @mock.call_stuff  }
        .must_equal 'bubla'
      @mock.verify
    end

    it 'should not call block on false' do
      false
        .if_true { @mock.call_stuff  }
        .must_equal false
      @mock.verify
    end

    it 'should not call block on false' do
      nil
        .if_true { @mock.call_stuff  }
        .must_equal nil
      @mock.verify
    end
  end
end
