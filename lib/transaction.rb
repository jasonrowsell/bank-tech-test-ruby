class Transaction
  attr_reader :amount, :date

  def initialize(amount)
    @amount = amount
    @date = Time.now.strftime("%d/%m/%Y")
  end
end
