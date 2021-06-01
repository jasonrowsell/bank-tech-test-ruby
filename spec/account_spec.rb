RSpec.describe Account do
  it "is initialized with a balance of 0" do
    expect(subject.balance).to be_zero
  end

  describe '#deposit' do
    it 'increases balance by given amount' do
      expect{subject.deposit(100)}.to change { subject.balance }.by 100
      expect{subject.deposit(200)}.to change { subject.balance }.by 200
    end
  end
end
