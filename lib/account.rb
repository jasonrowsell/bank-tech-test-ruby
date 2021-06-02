require_relative "exceptions"
require_relative "transaction"
require_relative "printer"

class Account
  include Exceptions

  attr_reader :transactions

  def initialize(transaction: Transaction, printer: Printer)
    @transaction = transaction
    @printer = printer
    @transactions = []
  end

  def current_balance
    @transactions.inject(0) { |sum, transaction| 
      transaction.credit.nil? ? sum - transaction.debit : sum + transaction.credit
    }
  end

  def deposit(amount)
    create_transaction({ credit: amount })
  end

  def withdraw(amount)
    raise Exceptions::TransactionError, "Insufficient funds" if amount > current_balance

    create_transaction({ debit: amount })
  end

  def print_statement
    @printer.new.print(@transactions)
  end

  private

  def create_transaction(data)
    new_transaction = @transaction.new(data)
    new_transaction.balance = current_balance
    @transactions.unshift(new_transaction)
  end
end
