RSpec.describe Transaction do
  let(:current_date) { Time.now.strftime("%d/%m/%Y") }

  describe "#amount" do
    it "returns the amount" do
      subject = described_class.new({ amount: 1000 })
      expect(subject.amount).to eq 1000
    end
  end

  describe "#date" do
    it "is initialized with the current date" do
      subject = described_class.new({})
      expect(subject.date).to eq current_date
    end
  end

  describe "#credit" do
    it "returns the credit amount" do
      subject = described_class.new({ credit: 1000 })
      expect(subject.credit).to eq 1000
    end
  end

  describe "#debit" do
    it "returns the debit amount" do
      subject = described_class.new({ debit: 500 })
      expect(subject.debit).to eq 500
    end
  end
end
