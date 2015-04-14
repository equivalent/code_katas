module PositiveBlockCalls
  def if_true
    yield
    self
  end

  def if_false
    self
  end
end

module NegativeBlockCalls
  def if_true
    self
  end

  def if_false
    yield
    self
  end
end

Object.send(:include, PositiveBlockCalls)
FalseClass.send(:include, NegativeBlockCalls)
NilClass.send(:include, NegativeBlockCalls)
