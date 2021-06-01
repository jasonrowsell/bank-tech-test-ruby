class Transaction
  attr_reader :date, :amount, :credit, :debit, :balance

  def initialize(data)
    @date = Time.now.strftime("%d/%m/%Y")
    @amount = data[:amount]
    @credit = data[:credit]
    @debit = data[:debit]
    @balance = data[:balance]
  end
end
