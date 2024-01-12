require "json"
require 'spec_helper'

describe Account do
	let(:account_data) { [{ 'account_number' => '12345', 'balance' => 1000 }] }

	describe '.load_data' do
		it 'returns an array of Account instances' do
			allow(JSON).to receive(:parse)
			described_class.load_data
			expect(JSON).to have_received(:parse)
		end
	end

	describe '.create_accounts_from_data' do
		let(:accounts_data) do
			[
				{
					"account_number" => 1,
					"balance" => 100,
				}
			]
		end

		it 'creates a list of accounts' do
			expect(
				described_class.create_accounts_from_data(accounts_data: accounts_data).map(&:to_h)).to eql([{number: 1, balance: 100}])
		end


		context 'when missing data' do
			let(:accounts_data) do
				[
					{}
				]
			end

			it 'creates a list of empty accounts' do
				expect(
					described_class.create_accounts_from_data(accounts_data: accounts_data).map(&:to_h)
				).to eql([{balance: nil, number: nil}])

			end


		end

	end
end
