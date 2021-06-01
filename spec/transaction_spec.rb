RSpec.describe Transaction do
  let(:subject) { described_class.new(amount = 100) }

  it "is initialized with an amount" do
    expect(subject.amount).to eq 100
  end
end