require "json"
require_relative "lib/account"
require_relative "lib/register"
require_relative "lib/automated_teller_machine"

atm = AutomatedTellerMachine.new

loop do
  puts "What's your account number?"

  account_number = gets.strip

  break if account_number.eql?("exit")

  if account_number.downcase == 'admin'
    # Admin access
    atm.display_register_balance
  else
    # User access
    account = atm.find_account(account_number)

    if account
      loop do
        puts "1. Show Balance"
        puts "2. Withdraw Cash"
        puts "3. Exit"

        command = gets.strip

        case command
        when "1"
          puts "Your current balance is: $#{account.balance}"
        when "2"
            atm.withdraw_cash(account)
        when "3"
          break
        else
          puts "Invalid command '#{command}'!"
        end
      end
    else
      puts "Could not find account for '#{account_number}'!"
    end
  end
end
