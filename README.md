# Bank Tech Test

[Requirements](#requirements) | [Acceptance Criteria](#acceptance-criteria) | [Installation](#installation) | [Usage](#usage) | [Development](#development)

## Specification

### Requirements

- You should be able to interact with your code via a REPL like IRB or the JavaScript console. (You don't need to implement a command line interface that takes input from STDIN.)
- Deposits, withdrawal.
- Account statement (date, amount, balance) printing.
- Data can be kept in memory (it doesn't need to be stored to a database or anything).

### Acceptance criteria

**Given** a client makes a deposit of 1000 on 10-01-2012  
**And** a deposit of 2000 on 13-01-2012  
**And** a withdrawal of 500 on 14-01-2012  
**When** she prints her bank statement  
**Then** she would see

```
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
```

## Usage

TODO: Write usage instructions here

## Development

Clone this repo.
To install dependencies:

```shell
bundle
```

Run test suites with:

```shell
rspec
```

For an interactive prompt that will allow you to experiment:

Run IRB:

```shell
irb
```

Once in IRB:

```irb
require './lib/CHANGE.rb'
CHANGE = CHANGE.new
```
