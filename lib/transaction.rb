class Transaction
  attr_reader :amount, :date

  def initialize(data)
    @amount = data[:amount]
    @date = Time.now.strftime("%d/%m/%Y")
  end
end
