


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
