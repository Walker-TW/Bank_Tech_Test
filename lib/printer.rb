# frozen_string_literal: true

require 'date'
require_relative 'account'

class Printer

  def printstatement(log)
    print firstline + transactionlist(log).join("\n")
  end

  private

  def transactionlist(log)
    log.reverse.map do |transaction|
      x = transaction.map(&:to_s).join(' || ')
      x.gsub('  ', ' ')
    end
  end

  def firstline
    "date || credit || debit || balance\n"
  end
end
