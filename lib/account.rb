require_relative "exceptions"

class Account
  include Exceptions

  attr_reader :balance

  INITIAL_BALANCE = 0

  def initialize
    @balance = INITIAL_BALANCE
  end

  def deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    raise Exceptions::TransactionError, "Insufficient funds" if amount > @balance

    @balance -= amount
  end
end
