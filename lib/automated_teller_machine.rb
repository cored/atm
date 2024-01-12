CAS_LIMIT_WITHDRAW = 500

class AutomatedTellerMachine
	def initialize(register: Register.new, accounts: Account.load_data)
		@register = register
		@accounts = accounts
	end

	def display_register_balance
		@register.display_balance
	end

	def find_account(account_number)
		@accounts.find { |account| account.account_number == account_number }
	end

	def withdraw_cash(account)
		amount = prompt_for_withdrawal_amount

		if invalid_withdrawal_amount?(amount) || insufficient_funds?(account, amount)
			display_invalid_withdrawal_message(account, amount)
		else
			perform_withdrawal(account, amount)
		end
	end

	private

	def prompt_for_withdrawal_amount
		print "Enter the amount you want to withdraw: $"
		gets.chomp.to_f
	end

	def invalid_withdrawal_amount?(amount)
		amount <= 0 || amount > CASH_LIMIT_WITHDRAW
	end

	def insufficient_funds?(account, amount)
		amount > account.balance
	end

	def display_invalid_withdrawal_message(account, amount)
		if invalid_withdrawal_amount?(amount)
			puts "Invalid withdrawal amount. Please enter an amount between $1 and $500."
		elsif insufficient_funds?(account, amount)
			puts "Insufficient funds. Your current balance is $#{account.balance}."
		end
	end

	def perform_withdrawal(account, amount)
		if not_enough_money_in_atm?(amount)
			puts "Sorry, not enough money in the ATM. Please try a smaller amount."
		else
			deduct_money_from_register(amount)
			update_account_balance(account, amount)
			display_successful_withdrawal(account, amount)
		end
	end

	def not_enough_money_in_atm?(amount)
		@register.bills.values.sum < amount
	end

	def deduct_money_from_register(amount)
		@register.deduct_bills(amount)
	end

	def update_account_balance(account, amount)
		account.balance -= amount
	end

	def display_successful_withdrawal(account, amount)
		puts "Withdrawal successful! You have withdrawn $#{amount}."
		puts "Remaining balance: $#{account.balance}"
	end
end
