# frozen_string_literal: true

require 'date'
require 'client'

class ATM
  def initialize(log, balance)
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
