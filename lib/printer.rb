class Printer
  STATEMENT_HEADER = "date || credit || debit || balance"

  def self.print(transactions)
    puts STATEMENT_HEADER
    
    transactions.each do |transaction|
      puts "#{transaction.date} || #{transaction.credit} || #{transaction.debit} || #{transaction.balance}"
    end
  end

end
