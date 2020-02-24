require 'bank.rb'

describe ATM do
  describe '#Init' do
    it 'Returns a balance value at 0 when initalized' do
      expect(subject.balance).to eq(0)
    end
  end

  describe '#deposit' do
    it 'Allows the balance instance varaible to be increased by the amount inputed (100)' do
      subject.deposit(100)
      expect(subject.balance).to eq(100)
    end
  end

  describe '#withdraw' do
    it 'Allows the balance instance variable to be subtracted by the amount inputed (100)' do
      subject.withdraw(100)
      expect(subject.balance).to eq(-100)
    end
  end

  describe '#firstline' do
    it 'Will return a premade string that will go at the top of the balance printout' do
      expect(subject.firstline).to eq('date || credit || debit || balance')
    end
  end
  
end
