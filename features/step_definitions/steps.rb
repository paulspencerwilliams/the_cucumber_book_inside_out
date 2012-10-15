Given /^my account has been credited with (#{CAPTURE_A_NUMBER})$/ do |amount|
	my_account.credit(amount)  
	my_account.balance.should eq(amount)
end

When /^I withdraw (#{CAPTURE_A_NUMBER})/ do |amount|
  teller.withdraw_from(my_account, amount)
end

Then /^(#{CAPTURE_A_NUMBER}) should be dispensed/ do |amount|
  cash_slot.contents.should == amount
end

And /^the balance of my account should be (#{CAPTURE_A_NUMBER})/ do |amount|
  my_account.balance.should eq(amount)
end