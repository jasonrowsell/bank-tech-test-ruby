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
    context "depositing funds" do
      let(:subject) { described_class.new({ credit: 1000 }) }

      it "returns the credit amount" do
        expect(subject.credit).to eq 1000
      end
    end

    context "withdrawing funds" do
      let(:subject) { described_class.new({ debit: 500 }) }
      
      it "returns nil" do
        expect(subject.credit).to be_nil
      end
    end
  end

  describe "#debit" do
    context "depositing funds" do
      let(:subject) { described_class.new({ credit: 1000 }) }

      it "returns nil" do
        expect(subject.debit).to be_nil
      end
    end

    context "withdrawing funds" do
      let(:subject) { described_class.new({ debit: 500 }) }
      
      it "returns the debit amount" do
        expect(subject.debit).to eq 500
      end
    end
  end

end
