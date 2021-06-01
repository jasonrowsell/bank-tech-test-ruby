class Transaction
  attr_reader :date, :credit, :debit, :balance

  def initialize(data)
    @date = Time.now.strftime("%d/%m/%Y")
    @credit = data[:credit]
    @debit = data[:debit]
    @balance = data[:balance]
  end
end
