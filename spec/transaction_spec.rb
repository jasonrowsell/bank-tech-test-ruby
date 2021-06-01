RSpec.describe Account do
  let(:subject) { Transaction.new(100) }

  it "is initialized with an amount" do
    expect(subject.amount).to eq 100
  end
end