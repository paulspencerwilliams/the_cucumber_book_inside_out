Feature: Cash Withdrawal
	Scenario: Successful withdrawal from an account in credit
	Given i have deposited $100 in my account
	When I withdraw $20
	Then $20 should be dispensed