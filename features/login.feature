Feature: Login


Scenario: View Positions after registering
	When a User has registered
	And the User has created a profile
	And there are positions
	And the user visits the Dashboard
	Then the dashboard will display open positions
	And the dashboard will display available job seekers
	And the User will log out