RSpec.describe Account do
  let(:subject) { described_class.new }
  let(:transaction) { class_double(Transaction).as_stubbed_const }
  let(:printer) { class_double(Printer).as_stubbed_const }

  describe "#current_balance" do
    it "is initialized with a balance of 0" do
      expect(subject.current_balance).to be_zero
    end

    context "after a series of transactions" do
      before(:each) do
        subject.deposit(1000)
        subject.deposit(2000)
        subject.withdraw(500)
      end

      it "calculates running balance" do
        expect(subject.current_balance).to eq 2500
      end
    end
  end

  describe "#deposit" do
    it "depositing 100 increases current_balance by 1000" do
      expect { subject.deposit(1000) }.to change { subject.current_balance }.from(0).to(1000)
    end
    it "depositing 200 increases current_balance by 2000" do
      expect { subject.deposit(2000) }.to change { subject.current_balance }.from(0).to(2000)
    end

    context "invalid input" do
      it "raises error with negative amount" do
        expect { subject.deposit(-500) }.to raise_error("Invalid input")
      end
      it "raises error with non-integer" do
        expect { subject.deposit("foo") }.to raise_error("Invalid input")
      end
    end
  end

  describe "#withdraw" do
    context "sufficient funds of 2000" do
      before(:each) do
        subject.deposit(1000)
      end

      it "withdrawing 100 decreases current_balance by 100" do
        expect { subject.withdraw(500) }.to change { subject.current_balance }.from(1000).to(500)
      end
      it "withdrawing 200 decreases current_balance by 200" do
        expect { subject.withdraw(1000) }.to change { subject.current_balance }.from(1000).to(0)
      end
    end

    context "insufficient funds" do
      it "raises error when attempting to withdraw" do
        expect { subject.withdraw(500) }.to raise_error("Insufficient funds")
      end
    end
  end
end
