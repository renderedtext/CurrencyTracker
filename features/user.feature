Feature: User
  I'm as an new user of CurrencyTracker
  wants to register in the application
  
  Scenario Outline: User Registration
    Given I am not authenticated
    When I go to register
    And I fill in "user_login" with "<login>"
    And I fill in "user_email" with "<email>"
    And I fill in "user_password" with "<password>"
    And I fill in "user_password_confirmation" with "<password>"
    And I press "Sign up"
    Then I should be signed in
    
    Examples:
          | email               | password   | login      |
          | testing@example.net | secretpass | testuser1  |
          | foo@bar.com         | fr33z35    | testuser2  |

  Scenario Outline: User Login
    Given I am a new, authenticated user
    When I go to login page
    And I fill in "user_login" with "<login>"
    And I fill in "user_password" with "<password>"
    Then I should be signed in
    
    Examples:
          | password   | login      |
          | secretpass | testuser1  |
          | fr33z35    | testuser2  |
    