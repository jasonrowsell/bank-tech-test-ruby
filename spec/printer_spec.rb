RSpec.describe Printer do
  let(:subject) { described_class.new }

  describe "#display" do
    it "prints a header" do
      expect { subject.display }.to output(/date || credit || debit || balance\n/).to_stdout
    end
  end
end
