Feature: Manage countries
  In order to manage his travel itinerary 
  User
  wants to manage the countries he has visited.
  
  Background: 
    Given I am signed in as an user
    And the following countries exist:
      |name         |code |
      |CountryOne   |c1   |
      |CountryTwo   |c2   |
      |CountryThree |c3   |
      |CountryFour  |c4   |
      |CountryFive  |c5   |
      |CntryOne     |cc1  |
      |CntryTwo     |cc2  |
      |CntryThree   |cc3  |
    And the following currencies exists:
      |name         | code    | country_id  |
      |CurrencyOne  | cu1     | c1          |
      |CurrencyTwo  | cu2     | c2          |
      |CurrencyThree| cu3     | c3          |
      |CurrencyFour | cu4     | c4          |
      |CurrencyFive | cu5     | c5          |
      |CrncyOne     | cuc1    | cc1         |
      |CrncyTwo     | cuc2    | cc2         |
      |CrncyThree   | cuc3    | cc3         |
    And the following visited or collected data:
      |country_id   | currency_id | visited   |
      | c1          | cu1         | true      |
      | c3          | cu3         | true      |
  
  @javascript
  Scenario: List Countries    
    Given I am on the countries page
    Then I should see the following table:
      | Name          | Code  | Status      |
      | CountryOne    | c1    | Visited     |
      | CountryTwo    | c2    | Not Visited |
      | CountryThree  | c3    | Visited     |
      | CountryFour   | c4    | Not Visited |
      | CountryFive   | c5    | Not Visited |
      | CntryOne      | cc1   | Not Visited |
      | CntryTwo      | cc2   | Not Visited |
      | CntryThree    | cc3   | Not Visited |
  
  @javascript
  Scenario: Visit Countries
    Given I am on the countries page
    When I check "country_code_c2"
    And I check "country_code_c4"
    And I press "Visit"
    Then I should see the following checked fields:
      | country_id  |
      | c2          |
      | c4          |
  
  @javascript
  Scenario: List Currencies
    Given I am on the currencies page
    Then I should see the following table:
      | Name          | Code | Status        |
      | CurrencyOne   | cu1  | Collected     |
      | CurrencyTwo   | cu2  | Not Collected |
      | CurrencyThree | cu3  | Collected     |
      | CurrencyFour  | cu4  | Not Collected |
      | CurrencyFive  | cu5  | Not Collected |
      | CrncyOne      | cuc1 | Not Collected |
      | CrncyTwo      | cuc2 | Not Collected |
      | CrncyThree    | cuc3 | Not Collected |
  
  @javascript
  Scenario: Collect Currencies
    Given I am on the currencies page
    When I check "currency_code_cu2"
    And I check "currency_code_cu4"
    And I check "currency_code_cu5"
    And I press "Collect"
    Then I should see the following checked fields:
      | currency_id  |
      | cu2          |
      | cu4          |
      | cu5          |
  
  @javascript
  Scenario: Filter Countries
    Given I am on the countries page
    When I fill in "q" with "Cntry"
    And I submit the form "0"
    And I wait 2 seconds
    Then I should see the following table:
      | Name          | Code  | Status      |
      | CntryOne      | cc1   | Not Visited |
      | CntryTwo      | cc2   | Not Visited |
      | CntryThree    | cc3   | Not Visited |
      
  @javascript
  Scenario: Filter Currencies
    Given I am on the currencies page
    When I fill in "q" with "Crncy"
    And I submit the form "0"
    And I wait 2 seconds
    Then I should see the following table:
      | Name          | Code  | Status        |
      | CrncyOne      | cuc1  | Not Collected |
      | CrncyTwo      | cuc2  | Not Collected |
      | CrncyThree    | cuc3  | Not Collected |