class BankAccount

  attr_accessor :balance, :status
  attr_reader :name

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end

  def name
    @name
  end

  def deposit(money)
    self.balance += money
    self.balance
  end

  def withdraw(money)
    self.balance -= money
    self.balance
  end

  def display_balance
    "Your balance is $#{self.balance}."
  end

  def valid?(*args)
    (self.status == "open" && self.balance > 0) ? true : false
  end

  def close_account
    @status = "closed"
  end

end
