# frozen_string_literal: true

require 'date.rb'
require 'account'

describe Account do
  describe '#Init' do
    it 'Returns a balance value at 0 when initalized' do
      expect(subject.balance).to eq(0)
    end
    it 'On creation returns an array' do
      test = Account.new
      expect(test.log[0]).to be(nil)
    end
  end
  describe '#deposit' do
    it 'Allows the balance instance varaible to be increased by the amount inputed (100)' do
      subject.deposit(100)
      expect(subject.balance).to eq(100)
    end
    it 'returns a 2D array containing todays date, current balance  how much was deposited' do
      subject.deposit(100)
      expect(subject.log[0]).to eq([Time.now.strftime('%d/%m/%Y'),
                                    '100.00', '', '100.00'])
    end
    it 'pushes another deposit into the array in reverse chronological order' do
      subject.deposit(100)
      subject.deposit(300)
      expect(subject.log[1]).to eq([Time.now.strftime('%d/%m/%Y'),
                                    '300.00', '', '400.00'])
    end
  end

  describe '#withdraw' do
    it 'Allows the balance instance variable to be subtracted by the amount inputed (100)' do
      subject.withdraw(100)
      expect(subject.log[0]).to eq([Time.now.strftime('%d/%m/%Y'), '',
                                    '100.00', '-100.00'])
    end
    it 'pushes a second amount into the array in reverse chronological order' do
      subject.deposit(100)
      subject.withdraw(300)
      expect(subject.log[1]).to eq([Time.now.strftime('%d/%m/%Y'), '',
                                    '300.00', '-200.00'])
    end
  end
end
