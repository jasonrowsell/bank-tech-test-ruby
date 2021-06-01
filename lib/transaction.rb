class Transaction
  attr_reader :date, :amount, :credit, :debit

  def initialize(data)
    @date = Time.now.strftime("%d/%m/%Y")
    @amount = data[:amount]
    @credit = data[:credit]
    @debit = data[:debit]
  end
end
