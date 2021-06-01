require_relative "exceptions"

class Account
  include Exceptions

  INITIAL_BALANCE = 0

  attr_reader :balance

  def initialize(transaction: Transaction, printer: Printer)
    @transaction = transaction
    @printer = printer
    @balance = INITIAL_BALANCE
    @transactions = []
  end

  def deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    raise Exceptions::TransactionError, "Insufficient funds" if amount > @balance

    @balance -= amount
  end

  def print_statement
    @printer.print
  end
end
