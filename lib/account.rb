# frozen_string_literal: true

class Account
  attr_accessor :balance, :log
  def initialize(printer = Printer.new)
    @balance = 0
    @log = []
    @printer = printer
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

  def print
    @printer.printstatement(@log)
  end
end
