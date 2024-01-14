class Register
	attr_accessor :bills

	def initialize
		@bills = load_register_data
	end

	def display_balance
		puts "Register Balance:"
		display_bills
	end

	def deduct_bills(amount)
		remaining_amount = amount

		sorted_bill_values.each do |bill_value|
			bill_count = @bills[bill_value]
			next if bill_count.zero?

			num_bills = calculate_num_bills(remaining_amount, bill_value, bill_count)
			deduct_bills_from_register(remaining_amount, bill_value, num_bills)

			break if remaining_amount.zero?
		end
	end

	private

	def load_register_data
		register_data = JSON.parse(File.read('data/register.json'))
		register_data.transform_keys(&:to_s)
	end

	def display_bills
		@bills.each do |bill_value, bill_count|
			puts "$#{bill_value} Bills: #{bill_count} bills"
		end
	end

	def sorted_bill_values
		@bills.keys.sort.reverse
	end

	def calculate_num_bills(remaining_amount, bill_value, bill_count)
		num_bills = remaining_amount / bill_value.to_i
		[num_bills, bill_count].min
	end

	def deduct_bills_from_register(remaining_amount, bill_value, num_bills)
		remaining_amount -= num_bills * bill_value.to_i
		@bills[bill_value] -= num_bills
	end
end
