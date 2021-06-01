RSpec.describe Printer do
  let(:subject) { described_class.new }
  let(:current_date) { Time.now.strftime("%d/%m/%Y") }

  describe "#display" do
    it "prints the header for a transaction" do
      expect { subject.display }.to output(/date || credit || debit || balance\n/).to_stdout
    end
    it "prints the date of a transaction" do
      expect { subject.display }.to output(/#{current_date} ||  ||  || \n/).to_stdout
    end
  end
end
