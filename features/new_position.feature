Feature: Create new position


Scenario: Create Position after registering
	Given a User has registered
	And the User has created a profile
	And there are positions
	And the user visits the Dashboard
	When the User creates a Position
	Then the Position is listed in the Users Positions