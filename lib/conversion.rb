module Conversion
  def to_pounds(amount)
    "£#{sprintf("%.2f", amount.to_f)}"
  end
end
