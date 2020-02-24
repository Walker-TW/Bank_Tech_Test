require 'bank.rb'
require 'date'

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
      expect(subject.firstline).to eq('date || credit || debit || balance')
    end
  end
end
