Feature: Profile information page
  Visualize and edit the user profile information

  Background:
    Given I am logged in
    And I tap the "photoicon" button
    And I wait 2 seconds
    And I swipe down by 400 pixels on the "profile_photo"
    And I wait 2 seconds

  Scenario: Access the profile information page
    When I tap the "key_info_preview" button
    Then I see "profileInfo_page_info"

  Scenario: View profile information page
    When I tap the "key_info_preview" button
    And I wait 5 seconds
    Then I expect the text "Dados Básicos" to be present
    And I expect the text "Nacionalidades" to be present