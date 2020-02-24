require 'bank.rb'

describe ATM do
  describe '#Init' do
    it 'Returns a balance value at 0 when initalized' do
      expect(subject.balance).to eq(0)
    end
  end

  describe '#deposit' do
    it 'Allows the balance instance varaible to be changed by the amount inputed (100)' do
      subject.deposit(100)
      expect(subject.balance).to eq(100)
    end
  end
end
