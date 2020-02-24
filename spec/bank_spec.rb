require 'bank.rb'
require 'date'
require 'timecop'

describe ATM do
  describe '#Init' do
    it 'Returns a balance value at 0 when initalized' do
      expect(subject.balance).to eq(0)
    end
    it 'On creation returns an array' do
      lloyds = ATM.new
      expect(lloyds.log[0]).to be(nil)
    end
  end

  describe '#deposit' do
    it 'Allows the balance instance varaible to be increased by the amount inputed (100)' do
      subject.deposit(100)
      expect(subject.balance).to eq(100)
    end
    it 'returns an array within an array with todays date and the current balance as well as how much was deposited'do
      subject.deposit(100)
      expect(subject.log[0]).to eq([Time.now.strftime("%d/%m/%Y"),"",100,100])
    end
    it 'pushes another deposit into the array in reverse chronological order' do
      subject.deposit(100)
      subject.deposit(300)
      expect(subject.log[1]).to eq([Time.now.strftime("%d/%m/%Y"),"",300,400])
    end
  end

  describe '#withdraw' do
    it 'Allows the balance instance variable to be subtracted by the amount inputed (100)' do
      subject.withdraw(100)
      expect(subject.log[0]).to eq([Time.now.strftime("%d/%m/%Y"),100,"",-100])
    end
    it 'pushes another withdrawn amount into the array in reverse chronological order' do
      subject.deposit(100)
      subject.withdraw(300)
      expect(subject.log[1]).to eq([Time.now.strftime("%d/%m/%Y"),300,"",-200])
    end
  end

  describe '#firstline' do
    it 'Will return a premade string that will go at the top of the balance printout' do
      expect(subject.firstline).to eq("date || credit || debit || balance\n")
    end
  end

  describe '#print' do
    it 'Will return a statement printout after a deposit has been entered' do
      subject.deposit(100)
      subject.withdraw(50)
      expect{subject.print}.to output("date || credit || debit || balance\n#{Time.now.strftime("%d/%m/%Y")} ||  || 50 || 50\n#{Time.now.strftime("%d/%m/%Y")} || 100 ||  || 100\n").to_stdout
    end
    it 'Will return the required acceptance criteria' do
      Timecop.freeze(Time.local(2012,1,10))
      subject.deposit(1000)
      Timecop.freeze(Time.local(2012,1,13))
      subject.deposit(2000)
      Timecop.freeze(Time.local(2012,1,14))
      subject.withdraw(500)
      expect{subject.print}.to output("date || credit || debit || balance
        14/01/2012 || || 500.00 || 2500.00
        13/01/2012 || 2000.00 || || 3000.00
        10/01/2012 || 1000.00 || || 1000.00").to_stdout
    end
  end

  describe '#transactionlist' do
    it 'Returns each element in the log array as a puts statement' do
      subject.deposit(100)
      subject.deposit(200)
      expect(subject.transactionlist).to eq(["#{Time.now.strftime("%d/%m/%Y")} ||  || 200 || 300", "#{Time.now.strftime("%d/%m/%Y")} ||  || 100 || 100"])
    end
  end
end
