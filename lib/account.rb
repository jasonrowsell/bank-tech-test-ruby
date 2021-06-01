require_relative "exceptions"
require_relative "transaction"
require_relative "printer"

class Account
  include Exceptions

  attr_reader :balance, :transactions

  def initialize(transaction: Transaction, printer: Printer)
    @transaction = transaction
    @printer = printer
    @transactions = []
  end

  def balance
    @transactions.inject(0) { |sum, i| !i.credit.nil? ? sum + i.credit : sum - i.debit }
  end

  def deposit(amount)
    create_transaction({ credit: amount })
  end

  def withdraw(amount)
    raise Exceptions::TransactionError, "Insufficient funds" if amount > balance

    create_transaction({ debit: amount })
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
