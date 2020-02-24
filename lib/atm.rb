# frozen_string_literal: true

require 'date'
require_relative 'client'

class ATM
  def initialize(client = Client.new)
    @log = client.log
    @balance = client.balance
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