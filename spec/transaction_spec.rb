RSpec.describe Transaction do
  let(:subject) { described_class.new(amount = 100) }
  let(:current_date) { Time.now.strftime("%d/%m/%Y") }

  it "is initialized with an amount" do
    expect(subject.amount).to eq 100
  end

  it "is initialized with the current date" do
    expect(subject.date).to eq current_date
  end
end
