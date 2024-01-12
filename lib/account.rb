class Account
	attr_reader :account_number
	attr_accessor :balance

	def self.create_accounts_from_data(accounts_data: load_data)
		accounts_data.map { |account_data| new(account_data['account_number'], account_data['balance']) }
	end

	def self.load_data
		JSON.parse(File.read('data/accounts.json'))
	end

	def initialize(account_number, balance)
		@account_number = account_number
		@balance = balance
	end

	def to_h
		{
			number: account_number,
			balance: balance
		}
	end

end
