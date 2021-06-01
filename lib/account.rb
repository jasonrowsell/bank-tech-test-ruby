require_relative 'exceptions'

class Account
  include Exceptions

  attr_reader :balance

  def initialize
    @balance = 0
  end

  def deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    raise Exceptions::TransactionError.new("Insufficient funds") if amount > @balance
    @balance -= amount
  end
end
