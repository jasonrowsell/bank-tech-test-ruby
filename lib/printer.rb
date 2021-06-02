require_relative "conversion"

# Proceses a statement of all transactions
class Printer
  include Conversion

  STATEMENT_HEADER = "date || credit || debit || balance"

  def print(transactions)
    puts STATEMENT_HEADER

    transactions.each do |transaction|
      puts create_row(transaction).to_s
    end
  end

  private

  def create_row(transaction)
    [
      transaction.date,
      transaction.credit ? to_pounds(transaction.credit) : nil,
      transaction.debit ? to_pounds(transaction.debit) : nil,
      to_pounds(transaction.balance)
    ].join(" || ")
  end
end
