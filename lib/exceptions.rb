module Exceptions
  # Error in conjuction with making transactions
  class TransactionError < StandardError; end

  class InputError < StandardError; end
end
