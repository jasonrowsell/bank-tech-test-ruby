require_relative "exceptions"
require_relative "transaction"
require_relative "printer"

class Account
  include Exceptions

  INITIAL_BALANCE = 0

  attr_reader :balance, :transactions

  def initialize(transaction: Transaction, printer: Printer)
    @balance = INITIAL_BALANCE
    @transaction = transaction
    @printer = printer
    @transactions = []
  end

  def deposit(amount)
    create_transaction({ credit: amount })
    @balance += amount
  end

  def withdraw(amount)
    raise Exceptions::TransactionError, "Insufficient funds" if amount > @balance

    create_transaction({ debit: amount })
    @balance -= amount
  end

  def print_statement
    @printer.new.print(@transactions)
  end

  private

  def create_transaction(data)
    new_transaction = @transaction.new(data)
    @transactions.unshift(new_transaction)
  end
end
