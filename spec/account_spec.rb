RSpec.describe Account do
  let(:subject) { described_class.new }
  let(:transaction) { class_double(Transaction).as_stubbed_const }
  let(:printer) { class_double(Printer).as_stubbed_const }

  it "is initialized with a balance of 0" do
    expect(subject.balance).to be_zero
  end

  describe "#deposit" do
    it "depositing 100 increases balance by 1000" do
      expect { subject.deposit(1000) }.to change { subject.balance }.from(0).to(1000)
    end
    it "depositing 200 increases balance by 2000" do
      expect { subject.deposit(2000) }.to change { subject.balance }.from(0).to(2000)
    end
    it "calls new to transaction" do
      expect(transaction).to receive(:new).with(:credit => 2000)
      subject.deposit(2000)
    end
  end

  describe "#withdraw" do
    context "sufficient funds of 2000" do
      before(:each) do
        subject.deposit(2000)
      end

      it "withdrawing 100 decreases balance by 100" do
        expect { subject.withdraw(1000) }.to change { subject.balance }.from(2000).to(1000)
      end
      it "withdrawing 200 decreases balance by 200" do
        expect { subject.withdraw(2000) }.to change { subject.balance }.from(2000).to(0)
      end
    end

    context "insufficient funds" do
      it "raises an error when attempting to withdraw" do
        expect { subject.withdraw(500) }.to raise_error("Insufficient funds")
      end
    end
  end

  describe "#print_statement" do
    it "calls display function to printer" do
      expect(printer).to receive(:print)
      subject.print_statement
    end
  end
end
