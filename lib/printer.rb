class Printer
  STATEMENT_HEADER = "date || credit || debit || balance"

  def self.print
    puts STATEMENT_HEADER
    puts "#{Time.now.strftime("%d/%m/%Y")} ||  ||  || "
  end
end
