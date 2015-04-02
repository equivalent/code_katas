# original taken from Avdi Grimm Ruby Tapas episode 292
class BankAccount
  attr_reader :number, :balance_cents

  def initialize(number)
    @number        = number
    @balance_cents = 0
  end

  def deposit(amount)
    @balance_cents += amount
  end

  def withdraw(amount)
    @balance_cents -= amount
  end

  def inspect
    "#<%s %s ($%0.2f)>" %
      [self.class, @number, @balance_cents / 100.0]
  end
  alias_method :to_s, :inspect
end

