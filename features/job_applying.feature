Feature: Apply for Job

Scenario: Applying for Jobs
	Given a User has registered
	And the User has created a profile
	And there are positions
	And the user visits the Dashboard
	When the User applies for the first unapplied position
	Then the position is not listed in the unapplied positions
	And the position is listed in the applied positions
	And the User will log out