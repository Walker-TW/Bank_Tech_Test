# frozen_string_literal: true

require 'printer.rb'
require 'timecop'

describe Printer do
  describe '#print' do
    it 'Will return a statement printout after a deposit has been entered' do
      print = Printer.new
      test = Account.new(print)
      test.deposit(100)
      test.withdraw(50)
      expect { test.print }.to output("date || credit || debit || balance\n#{Time.now.strftime('%d/%m/%Y')} || || 50.00 || 50.00\n#{Time.now.strftime('%d/%m/%Y')} || 100.00 || || 100.00").to_stdout
    end
    it 'Will return the required acceptance criteria' do
      print = Printer.new
      test = Account.new(print)
      Timecop.freeze(Time.local(2012, 1, 10))
      test.deposit(1000)
      Timecop.freeze(Time.local(2012, 1, 13))
      test.deposit(2000)
      Timecop.freeze(Time.local(2012, 1, 14))
      test.withdraw(500)
      expect { test.print }.to output("date || credit || debit || balance\n14/01/2012 || || 500.00 || 2500.00\n13/01/2012 || 2000.00 || || 3000.00\n10/01/2012 || 1000.00 || || 1000.00").to_stdout
    end
  end

  # describe '#transactionlist' do
  #   it 'Returns each element in the log array as a puts statement' do
  #     subject = Printer.new
  #     test = Account.new(subject)
  #     test.deposit(100)
  #     test.deposit(200)
  #     expect(subject.transactionlist).to eq(["#{Time.now.strftime('%d/%m/%Y')} || 200.00 || || 300.00",
  #                                            "#{Time.now.strftime('%d/%m/%Y')} || 100.00 || || 100.00"])
  #   end
  # end
end
