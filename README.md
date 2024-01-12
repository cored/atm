## Automated Teller Machine - ATM

We've embarked on the journey to create a speculative new bank, and our mission is to implement a simple ATM machine. The ATM comprises two crucial components:

1. **Register**: Keeps track of the physical cash on hand within the ATM machine.
2. **Terminal**: Enables customers to access their account, view their balance, and withdraw cash.

### Your Mission

The initial parts of the terminal UI prompt for a customer's account number. Once entered and found, we'd like to provide three options to the customer:

1. **Show Balance**: Displays the current balance for the customer.
2. **Withdraw Cash**: Prompts for the amount they wish to withdraw, following certain rules.
3. **Exit**: Returns the UI to the main terminal.

We need your help to complete the functionality of our ATM machine.

### Rules

1. Do not allow withdrawals exceeding $500 at a time.
2. Do not permit withdrawals exceeding the available balance in the account.
3. Manage remaining bills in the register – if a customer requests $200 and only one $100 bill remains, they should receive that $100 and smaller bills for the remaining balance.
4. Alert the customer if there's insufficient money in the register or in their account for the withdrawal.

### Admin Access

For added security, bank tellers can access super-secret internal account details by entering `admin` into the account number prompt. This grants access to the overall balance of the register, including the number of each respective bill.

The possible bills in the register are $1, $5, $10, $20, $50, and $100.

### Running the ATM

To run the ATM, execute the following command in your terminal:

```bash
ruby atm.rb
```

### Running the Tests

To run the tests, execute the following command in your terminal:

```bash
rspec
```

### Implementation and Architecture

The implementation follows a modular structure with distinct classes for the Account, Register, and AutomatedTellerMachine. The ATM relies on user input to navigate through account details, display balances, and facilitate cash withdrawals.

### Trade-offs and Potential Improvements

1. **User Experience**: Enhancements in the user interface and experience could be implemented for a more intuitive interaction.
2. **Error Handling**: Implement more detailed error messages to guide users in case of invalid inputs.
3. **Code Refactoring**: Continuously refactor code to adhere to best practices and improve maintainability.
