# Bank Tech Test

[![Build Status](https://travis-ci.com/jasonrowsell/bank-tech-test.svg?branch=main)](https://travis-ci.com/jasonrowsell/bank-tech-test) [![codecov](https://codecov.io/gh/jasonrowsell/bank-tech-test/branch/main/graph/badge.svg?token=0IO5IXRL0t)](https://codecov.io/gh/jasonrowsell/bank-tech-test)

[Requirements](#requirements) | [Acceptance Criteria](#acceptance-criteria) | [Installation](#installation) | [Usage](#usage) | [Development](#development) | [User Stories](#user-stories)

A sample tech test to write high code quality and demonstrate test driven development process and object oriented design principles.

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

## Plan

### User Stories

```
As a customer,
So that I can keep money funds secure,
I would like to make a deposit.
```

```
As a customer,
So that I can access my funds,
I would like to make a withdrawal.
```

```
As a customer,
So that I can keep a record of my finances,
I would like to request a bank statement.
```

```
As a customer,
So that I can reference my prior transactions,
I would like my statement to display the date, transaction amount, type, and new balance.
```

```
As a Bank Manager,
In order to maintain a structured business model,
I want withdrawals accessible only if sufficient funds are present.
```
