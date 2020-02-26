# frozen_string_literal: true

class Account
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
