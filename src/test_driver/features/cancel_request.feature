Feature: Feature: Cancel Edit request
  Users can cancel modifications that have not yet been approved

  Background:
    Given I am logged in
    And I tap the "photoicon" button
    And I wait 2 seconds
    And I swipe down by 100 pixels on the "profile_photo"
    And I tap the "key_info_preview" button

  Scenario: I want to cancel pending modifications
    Given I tap the "yellow_button_Sexo" button
    And I see "pending_window_popup"
    When I tap the "pending_window_cancel_button" button
    And I tap the back button
    And I tap the "key_info_preview" button
    Then I do not see "yellow_button_Sexo"
    But I see "grey_button_Sexo"

  Scenario: I want to delete a certain nationality
    Given I swipe down by 200 pixels on the "profile_info_basic"
    When I tap the "Add nationality" button
    And I fill the "addNat_window_form_text" field with "Francês"
    And I tap the "addNat_window_save_button" button
    And I tap the back button
    And I tap the "key_info_preview" button
    And I swipe down by 250 pixels on the "profile_info_basic"
    Then I see "yellow_button_3"
    When I tap the "yellow_button_3" button
    And I expect the text "Cancelar alteração" to be present
    And I tap the "pending_window_cancel_button" button
    And I tap the back button
    And I tap the "key_info_preview" button
    And I swipe down by 200 pixels on the "profile_info_basic"
    Then Then I do not see "yellow_button_3"