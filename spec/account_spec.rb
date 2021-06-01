RSpec.describe Account do
  it "is initialized with a balance of 0" do
    expect(subject.balance).to be_zero
  end
end
