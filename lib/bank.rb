require 'date'

class ATM
  attr_reader :balance, :log
  def initialize
    @balance = 0
    @log = []
  end

  def deposit(amount)
    @balance += amount
    @log << [Time.now.strftime("%d/%m/%Y"),"",amount,@balance]
  end

  def withdraw(amount)
    @balance -= amount
    @log << [Time.now.strftime("%d/%m/%Y"),amount,"",@balance]
  end

  def firstline
    'date || credit || debit || balance'
  end
end
