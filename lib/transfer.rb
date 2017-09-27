class Transfer
  # your code here

  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?(*args)
    # binding.pry
    account = BankAccount.new(args)
    # binding.pry
    account.valid?
    self.sender.valid?
    self.receiver.valid?
    #LOOK INTO THIS: see if this is the best possible way to test
  end

  def execute_transaction
    # binding.pry
    sender_acct = self.sender
    receiver_acct = self.receiver
    # binding.pry
    if self.valid?(sender_acct, receiver_acct) && (sender_acct.balance > self.amount) && (self.status == "pending")
      # binding.pry
      receiver_acct.deposit(self.amount)
      sender_acct.withdraw(self.amount)
      self.status = "complete"
      # binding.pry
      # binding.pry
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete"
      # binding.pry
      self.receiver.withdraw(self.amount)
      self.sender.deposit(self.amount)
      self.status = "reversed"
    end
  end

end
