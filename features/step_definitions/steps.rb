




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
