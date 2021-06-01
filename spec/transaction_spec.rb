RSpec.describe Transaction do
  let(:current_date) { Time.now.strftime("%d/%m/%Y") }

  it "is initialized with an amount" do
    subject = described_class.new({amount: 1000})
    expect(subject.amount).to eq 1000
  end

  it "is initialized with the current date" do
    subject = described_class.new({})
    expect(subject.date).to eq current_date
  end
end
