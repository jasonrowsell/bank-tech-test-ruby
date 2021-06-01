module Conversion
  def to_pounds(amount)
    "£#{format("%.2f", amount.to_f)}"
  end
end
