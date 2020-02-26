# frozen_string_literal: true

require 'date'
require_relative 'account'

class Printer
  def initialize(account = Account.new)
    @log = account.log
    @balance = account.balance
  end

  def transactionlist
    @log.reverse.map do |transaction|
      x = transaction.map(&:to_s).join(' || ')
      x.gsub('  ', ' ')
    end
  end

  def printstatement
    print firstline + transactionlist.join("\n")
  end

  private

  def firstline
    "date || credit || debit || balance\n"
  end
end
