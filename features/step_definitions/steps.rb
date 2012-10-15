
class Account
	def deposit(amount)
		@balance = amount
	end

	def balance
		@balance
	end
end

class Teller
	def initialize(cash_slot)
		@cash_slot = cash_slot
	end
	def withdraw_from(account, amount)
		@cash_slot.dispense(amount)
	end
end

class CashSlot
	def dispense(amount)
		@contents = amount
	end
	def contents
		@contents or raise("I'm empty")
	end
end

module KnowsTheDomain
	def my_account
		@my_account ||= Account.new
	end
	def cash_slot
		@cash_slot ||= CashSlot.new
	end
	def teller
		@teller = Teller.new(cash_slot)
	end
end

World(KnowsTheDomain)

CAPTURE_A_NUMBER = Transform /^\$(\d+)$/ do | number |
	number.to_i
end
Given /^i have deposited (#{CAPTURE_A_NUMBER}) in my account$/ do |amount|
	my_account.deposit(amount)  
	my_account.balance.should eq(amount)
end

When /^I withdraw (#{CAPTURE_A_NUMBER})/ do |amount|
  teller.withdraw_from(my_account, amount)
end

Then /^(#{CAPTURE_A_NUMBER}) should be dispensed/ do |amount|
  cash_slot.contents.should == amount

end
