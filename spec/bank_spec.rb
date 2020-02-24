# frozen_string_literal: true

require 'bank.rb'
require 'date'
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

describe Client do
  describe '#Init' do
    it 'Returns a balance value at 0 when initalized' do
      expect(subject.balance).to eq(0)
    end
    it 'On creation returns an array' do
      test = Client.new
      expect(test.log[0]).to be(nil)
    end
  end
  describe '#deposit' do
    it 'Allows the balance instance varaible to be increased by the amount inputed (100)' do
      subject.deposit(100)
      expect(subject.balance).to eq(100)
    end
    it 'returns an array within an array with todays date and the current balance as well as how much was deposited' do
      subject.deposit(100)
      expect(subject.log[0]).to eq([Time.now.strftime('%d/%m/%Y'), '100.00', '', '100.00'])
    end
    it 'pushes another deposit into the array in reverse chronological order' do
      subject.deposit(100)
      subject.deposit(300)
      expect(subject.log[1]).to eq([Time.now.strftime('%d/%m/%Y'), '300.00', '', '400.00'])
    end
  end

  describe '#withdraw' do
    it 'Allows the balance instance variable to be subtracted by the amount inputed (100)' do
      subject.withdraw(100)
      expect(subject.log[0]).to eq([Time.now.strftime('%d/%m/%Y'), '', '100.00', '-100.00'])
    end
    it 'pushes another withdrawn amount into the array in reverse chronological order' do
      subject.deposit(100)
      subject.withdraw(300)
      expect(subject.log[1]).to eq([Time.now.strftime('%d/%m/%Y'), '', '300.00', '-200.00'])
    end
  end
end
