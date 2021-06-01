RSpec.describe Printer do
  let(:current_date) { Time.now.strftime("%d/%m/%Y") }
  let(:deposit) { double(:transaction, date: current_date, credit: 2000, debit: nil, balance: 3000) }
  let(:withdrawal) { double(:transaction, date: current_date, credit: 500, debit: nil, balance: 2500) }

  describe "#print" do
    it "prints the header for a transaction" do
      expect { self.print }.to output(/date || credit || debit || balance\n/).to_stdout
    end
    it "prints the date of a transaction" do
      expect { self.print }.to output(/#{current_date} ||  ||  || \n/).to_stdout
    end
    it "prints the credit of a transaction" do
      expect { self.print(deposit) }.to output(/#{current_date} || #{2000} ||  || #{3000}\n/).to_stdout
    end
    it "prints the debit of a transaction" do
      expect { self.print(deposit) }.to output(/#{current_date} ||  || #{500} || #{2500}\n/).to_stdout
    end
  end
end
