require_relative "exceptions"
require_relative "transaction"
require_relative "printer"

# Handles transaction data, processes desposits or withdrawals, and prints account statements.
class Account
  include Exceptions

  attr_reader :transactions

  def initialize(transaction: Transaction, printer: Printer.new)
    @transaction = transaction
    @printer = printer
    @transactions = []
  end

  def current_balance
    @transactions.inject(0) { |balance, transaction| 
      transaction.credit.nil? ? balance - transaction.debit : balance + transaction.credit
    }
  end

  def deposit(amount)
    create_transaction({ credit: amount })
  end

  def withdraw(amount)
    validate_transaction(amount)
    create_transaction({ debit: amount })
  end

  def print_statement
    @printer.print(@transactions)
  end

  private

  def create_transaction(data)
    new_transaction = @transaction.new(data)
    new_transaction.balance = current_balance
    @transactions.unshift(new_transaction)
  end

  def validate_transaction(amount)
    raise Exceptions::TransactionError, "Insufficient funds" if amount > current_balance
  end
end
