require "account"
require "exceptions"
require "printer"
require "transaction"

require "codecov"
require "simplecov"
require "simplecov-console"

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new(
  SimpleCov::Formatter::Console
)
SimpleCov.start

RSpec.configure do |config|
  config.example_status_persistence_file_path = ".rspec_status"
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
end
