# frozen_string_literal: true

require 'date'

class ATM

  def initialize(log,balance)
    @log = log
    @balance = balance
  end

  def transactionlist
    @log.reverse.map do |transaction|
      x = transaction.map(&:to_s).join(' || ')
      x.gsub('  ', ' ')
    end
  end

  def print
    puts firstline + transactionlist.join("\n")
  end

  private

  def firstline
    "date || credit || debit || balance\n"
  end
end

class Client
  attr_accessor :balance, :log
  def initialize
    @balance = 0
    @log = []
  end

  def deposit(amount)
    @balance += amount
    @log << [Time.now.strftime('%d/%m/%Y'), amount.to_s + '.00', '',
             @balance.to_s + '.00']
  end

  def withdraw(amount)
    @balance -= amount
    @log << [Time.now.strftime('%d/%m/%Y'), '', amount.to_s + '.00',
             balance.to_s + '.00']
  end
end
