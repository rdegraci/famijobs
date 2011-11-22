Feature: Apply for Job


Scenario: Applying for Jobs
Given a User has registered
When the User selects a position
And applies for the position
Then the position is removed from the open positions
And the position is added to the applied positions