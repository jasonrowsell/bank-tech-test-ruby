RSpec.describe Account do
  it "is initialized with a balance of 0" do
    expect(subject.balance).to be_zero
  end

  describe "#deposit" do
    it "depositing 100 increases balance by 100" do
      expect { subject.deposit(100) }.to change { subject.balance }.from(0).to(100)
    end
    it "depositing 200 increases balance by 200" do
      expect { subject.deposit(200) }.to change { subject.balance }.from(0).to(200)
    end
  end

  describe "#withdraw" do
    context "sufficient funds of 200" do
      before(:each) do
        subject.deposit(200)
      end

      it "withdrawing 100 decreases balance by 100" do
        expect { subject.withdraw(100) }.to change { subject.balance }.from(200).to(100)
      end
      it "withdrawing 200 decreases balance by 200" do
        expect { subject.withdraw(200) }.to change { subject.balance }.from(200).to(0)
      end
    end

    context "insufficient funds" do
      it "raises an error when attempting to withdraw" do
        expect { subject.withdraw(100) }.to raise_error("Insufficient funds")
      end
    end
  end
end
