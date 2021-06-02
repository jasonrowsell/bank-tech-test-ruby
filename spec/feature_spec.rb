RSpec.describe 'Feature' do
  let(:subject) { Account.new }
  let(:table) { [
    "date || credit || debit || balance\n",
    "14/01/2012 ||  || £500.00 || £2500.00\n",
    "13/01/2012 || £2000.00 ||  || £3000.00\n",
    "10/01/2012 || £1000.00 ||  || £1000.00\n",
  ].join }

  before do
    time_one = Time.new(2012, 1, 10)
    time_two = Time.new(2012, 1, 13)
    time_three = Time.new(2012, 1, 14)

    allow(Time).to receive(:now).and_return(time_one, time_two, time_three)
  end

  it 'meets the acceptance critera' do
    subject.deposit(1000)
    subject.deposit(2000)
    subject.withdraw(500)

    expect { subject.print_statement }.to output(table).to_stdout
  end
end
