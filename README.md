# Bank Tech Test

[![Maintainability](https://api.codeclimate.com/v1/badges/146f596069f5d606335f/maintainability)](https://codeclimate.com/github/jasonrowsell/bank-tech-test/maintainability) [![Build Status](https://travis-ci.com/jasonrowsell/bank-tech-test.svg?branch=main)](https://travis-ci.com/jasonrowsell/bank-tech-test) [![codecov](https://codecov.io/gh/jasonrowsell/bank-tech-test/branch/main/graph/badge.svg?token=0IO5IXRL0t)](https://codecov.io/gh/jasonrowsell/bank-tech-test) [![BCH compliance](https://bettercodehub.com/edge/badge/jasonrowsell/bank-tech-test?branch=main)](https://bettercodehub.com/) [![Ruby Style Guide](https://img.shields.io/badge/code_style-rubocop-brightgreen.svg)](https://github.com/rubocop-hq/rubocop)

[Specification](#specification) | [Getting Started](#getting-started) | [User Stories](#user-stories) | [CRC Cards](#crc-cards) | [Sequence Diagrams](#sequence-diagrams) | [Methodology](#methodology)

A sample tech test to practice writing high-quality code, demonstrate TDD and apply OOP/D.

## Getting Started

### Development

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
require './lib/account.rb'
account = Account.new
```

### Usage

A demonstration of how to use the program.

```sh
> irb -r './lib/account.rb'

> account = Account.new

> account.deposit(1000)

> account.print_statement
date || credit || debit || balance
02/06/2021 || £1000.00 || || £1000.00

> account.deposit(2000)

> account.print_statement
date || credit || debit || balance
04/06/2021 || £2000.00 || || £3000.00
02/06/2021 || £100.00 || || £100.00

> account.withdraw(500)

> account.print_statement
date || credit || debit || balance
06/06/2021 || || £500.00 || £2500.00
04/06/2021 || £2000.00 || || £3000.00
02/06/2021 || £100.00 || || £100.00
```

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
date  || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
```

| date       | credit  | debit  | balance |
| ---------- | ------- | ------ | ------- |
| 14/01/2012 |         | 500.00 | 2500.00 |
| 13/01/2012 | 2000.00 |        | 3000.00 |
| 10/01/2012 | 1000.00 |        | 1000.00 |

## Design

### Classes

<strong>Account</strong>

- The `Account` class maintains the operational data of previous transactions. A transaction is
  made by calling `withdraw`/`deposit`, which instantiates an instance of the `Transaction` class. The method `current_balance` is called to calculate and store the updated balance in the current transaction. The private method `store_transaction` is exposed for adding the transaction to a sequential list of previously recorded transactions. Printing a statement is
  called with the method `print_statement` which prints a table using `print`
  that is derived from the `Print` class. A user would instantiate an `Account`
  object, use `deposit(amount)` accordingly to deposit funds, then use `print_statement` to construct a visual bank statement.

### Methodology

<strong>SOLID Principles of OOP</strong>

- Dependency Injection and DIP

![DIP](./images/DIP.png)

In this case of dependency injection, `Account` should refrain from a hard dependency on `Transaction` and `Printer`, but can function without it. Furthermore, if we wish to replace dependent classes with a third, we need to modify `Account`, which is a violation of the Open Closed Principle.

This implementation of dependency injection adheres to the SOLID principles of OOD. In this case mostly the Dependency Inversion Principle.

## Planning

### User Stories

```
As a client,
So that I can keep funds secure,
I would like to make a deposit.
```

```
As a client,
So that I can access my funds,
I would like to make a withdrawal.
```

```
As a client,
So that I can keep a record of my finances,
I would like to request a bank statement.
```

```
As a client,
So that I can reference my prior transactions,
I would like my statement to display the date, transaction amount, type, and new balance.
```

```
As a Bank Manager,
In order to maintain a structured business model,
I want withdrawals accessible only if sufficient funds are present.
```

### CRC Cards

| Class                     | Account          |
| ------------------------- | ---------------- |
| Responsibilties           | Collaborators    |
| ------------------------- | ---------------- |
| Knows transaction records | Transaction      |
| Deposit amount            | Printer          |
| Withdraw amount           |                  |
| Print bank statement      |                  |

| Class                     | Transaction      |
| ------------------------- | ---------------- |
| Responsibilties           | Collaborators    |
| ------------------------- | ---------------- |
| Knows date                |                  |
| Knows credit amount       |                  |
| Knows debit amount        |                  |
| Knows balance             |                  |

| Class                       | Printer          |
| --------------------------- | ---------------- |
| Responsibilties             | Collaborators    |
| -------------------------   | ---------------- |
| Render a string output      |                  |
| Format integers to currency |                  |

### Sequence Diagrams

<strong>Depositing Funds</strong>
![Depositing funds](./images/deposit.png)

<strong>Printing Statement</strong>
![Printing Statement](./images/print.png)

## Evaluation

<strong>Struct / OpenStruct</strong>
![Struct](./lib/struct.png)

I have considered converting my Transaction class structure to a Struct/OpenStruct.
