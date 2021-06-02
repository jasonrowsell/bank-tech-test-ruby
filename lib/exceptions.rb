module Exceptions
  # Error in conjuction with making transactions
  class TransactionError < StandardError; end

  # Error in conjuction with entering amounts
  class InputError < StandardError; end
end
