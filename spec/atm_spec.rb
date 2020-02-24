# frozen_string_literal: true

require 'atm.rb'
require 'timecop'

describe ATM do
  describe '#print' do
    it 'Will return a statement printout after a deposit has been entered' do
      test = Client.new
      subject = ATM.new(test)
      test.deposit(100)
      test.withdraw(50)
      expect { subject.print }.to output("date || credit || debit || balance\n#{Time.now.strftime('%d/%m/%Y')} || || 50.00 || 50.00\n#{Time.now.strftime('%d/%m/%Y')} || 100.00 || || 100.00\n").to_stdout
    end
    it 'Will return the required acceptance criteria' do
      test = Client.new
      subject = ATM.new(test)
      Timecop.freeze(Time.local(2012, 1, 10))
      test.deposit(1000)
      Timecop.freeze(Time.local(2012, 1, 13))
      test.deposit(2000)
      Timecop.freeze(Time.local(2012, 1, 14))
      test.withdraw(500)
      expect { subject.print }.to output("date || credit || debit || balance\n14/01/2012 || || 500.00 || 2500.00\n13/01/2012 || 2000.00 || || 3000.00\n10/01/2012 || 1000.00 || || 1000.00\n").to_stdout
    end
  end

  describe '#transactionlist' do
    it 'Returns each element in the log array as a puts statement' do
      test = Client.new
      subject = ATM.new(test)
      test.deposit(100)
      test.deposit(200)
      expect(subject.transactionlist).to eq(["#{Time.now.strftime('%d/%m/%Y')} || 200.00 || || 300.00", "#{Time.now.strftime('%d/%m/%Y')} || 100.00 || || 100.00"])
    end
  end
end
