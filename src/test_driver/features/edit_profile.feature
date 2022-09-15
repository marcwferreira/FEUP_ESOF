Feature: Edit my profile
  Students can edit their profile to keep their information up to date

  Background:
    Given I am logged in
    And I tap the "photoicon" button
    And I wait 2 seconds
    And I swipe down by 100 pixels on the "profile_photo"
    And I tap the "key_info_preview" button

  Scenario: I want to have a simple interface to edit my personal information
    Given I expect the text "Dados Básicos" to be present
    When I tap the "grey_button_Nome" button
    Then I see "edit_window_popup"
    And I see "edit_window_form_text"
    And I see 'edit_window_cancel_button'
    And I expect the text "Cancelar" to be present
    And I see 'edit_window_save_button'
    And I expect the text "Guardar" to be present

  Scenario: I want a chance to cancel my modification request
    Given I see "grey_button_Nome"
    When I tap the "grey_button_Nome" button
    And I fill the "edit_window_form_text" field with "Silvestre da Cunha Azevedo"
    And I tap the "edit_window_cancel_button" button
    And I tap the back button
    And I tap the "key_info_preview" button
    Then I see "grey_button_Nome"
    And I expect the text "Jose Aluno Qualquer" to be present

  Scenario: I want to edit my mother's name
    Given I see "grey_button_Nome da mãe"
    When I tap the "grey_button_Nome da mãe" button
    And I fill the "edit_window_form_text" field with "Gertrudes da Silva Cunha"
    And I tap the "edit_window_save_button" button
    And I tap the back button
    And I tap the "key_info_preview" button
    Then I see "yellow_button_Nome da mãe"
    But I expect the text "Joselina Aluna Qualquer Mãe" to be present

  Scenario: I want to add a nationality in my profile
    Given I swipe down by 200 pixels on the "profile_info_basic"
    And I expect the text "Adicionar nacionalidade" to be present
    When I tap the "Add nationality" button
    Then I see "addNat_window_form"
    When I fill the "addNat_window_form_text" field with "Francês"
    And I tap the "addNat_window_save_button" button
    And I tap the back button
    And I tap the "key_info_preview" button
    And I swipe down by 200 pixels on the "profile_info_basic"
    Then I expect the text "~" to be present
    And I see "yellow_button_nationality_Francês"

  Scenario: I want to have a simple input check
    Given I see "grey_button_Data de Nascimento"
    When I tap the "grey_button_Data de Nascimento" button
    And I fill the "edit_window_form_text" field with "Test"
    And I tap the "edit_window_save_button" button
    Then I expect the text "Alteração inválida" to be present
    When I tap the back button
    And I tap the "key_info_preview" button
    And I see "grey_button_Data de Nascimento"
    And I expect the text "2021-02-30" to be present