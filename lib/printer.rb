class Printer
  STATEMENT_HEADER = "date || credit || debit || balance\n"

  def display
    print STATEMENT_HEADER
    print "#{Time.now.strftime("%d/%m/%Y")} ||  ||  || "
  end
end
