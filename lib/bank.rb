class ATM
  attr_reader :balance, :log
  def initialize
    @balance = 0
    @log = []
  end

  def deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    @balance -= amount
  end

  def firstline
    'date || credit || debit || balance'
  end
end
