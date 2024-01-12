require 'spec_helper'

describe AutomatedTellerMachine do
	subject(:atm) { described_class.new(register: register, accounts: [account]) }
	let(:register) { instance_double(Register, display_balance: "balance") }
	let(:account) { instance_double(Account, account_number: '12345', balance: 1000) }

	describe '#display_register_balance' do
		it 'returns the register balance' do
			atm.display_register_balance
			expect(register).to have_received(:display_balance)
		end
	end

	describe '#find_account' do
		it 'finds the account by account number' do
			expect(atm.find_account('12345')).to eq(account)
		end

		it 'returns nil if account not found' do
			expect(atm.find_account('99999')).to be_nil
		end
	end
end
