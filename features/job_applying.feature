Feature: Apply for Job


Scenario: Applying for Jobs
Given a User has registered
And there are positions
When the User applies for the first unapplied position
Then the position is not listed in the unapplied positions
And the position is listed in the applied positions