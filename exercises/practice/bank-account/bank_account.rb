=begin
Write your code for the 'Bank Account' exercise in this file. Make the tests in
`bank_account_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/bank-account` directory.
=end

class BankAccount
  def initialize
    @balance = nil
    @status = false
  end

  def open
    if @status
      raise ArgumentError, "You can't open an already opened account"
    end

    @balance = 0
    @status = true
  end

  def balance
    unless @status
      raise ArgumentError, "You can't check the balance of a closed account"
    end

    @balance
  end

  def close
    unless @status
      raise ArgumentError, "You can't close a closed account"
    end

    @balance = 0
    @status = false
  end

  def deposit(amount)
    if amount.negative?
      raise ArgumentError, "You can't deposit negative amount"
    elsif !@status
      raise ArgumentError, "You can't deposit to a closed account"
    end

    @balance += amount
  end

  def withdraw(amount)
    if amount.negative?
      raise ArgumentError, "You can't withdraw a negative amount"
    elsif !@status
      raise ArgumentError, "You can't withdraw from a closed account"
    elsif @balance < amount
      raise ArgumentError, "insufficient fund for withdrawal"
    end

    @balance -= amount
  end

end