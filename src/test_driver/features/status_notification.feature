Feature: Visualize Attributes approval status
  Some profile attributes needs the Academic Services' approval to complete the change.

  Background:
    Given I am logged in
    And I tap the "photoicon" button
    And I wait 2 seconds
    And I swipe down by 100 pixels on the "profile_photo"
    And I tap the "key_info_preview" button

  Scenario: I want to see approval of modifications
    Given I see "green_button_Nome do pai"
    And I expect the text "Firmino Alves das Alturas" to be present
    When I tap the "green_button_Nome do pai" button
    Then I see "status_window_popup"
    And I expect the text "Jose Aluno Qualquer Pai" to be present
    And I expect the text "Firmino Alves das Alturas" to be present
    And I expect the text "Aceite" to be present
    And I see "alteration_window_dismiss_button"

  Scenario: I want to see pending modifications
    Given I see "yellow_button_Sexo"
    When I tap the "yellow_button_Sexo" button
    And I see "pending_window_popup"
    And I expect the text "Valor a mudar: " to be present
    And I expect the text "Masculino" to be present
    And I expect the text "Novo valor: " to be present
    And I expect the text "Feminino" to be present
    And I expect the text "Pendente" to be present
    And I see "pending_window_cancel_button"
    And I see "pending_window_return_button"

  Scenario: I want to see rejected modifications
    Given I see "red_button_Estado civil"
    And I expect the text "Solteiro" to be present
    When I tap the "red_button_Estado civil" button
    Then I see "status_window_popup"
    And I expect the text "Rejeitado" to be present
    And I do not see "Casado"
    But I see "alteration_window_dismiss_button"

  Scenario: I want to delete notifications
    Given I see "red_button_Estado civil"
    And I tap the "red_button_Estado civil" button
    And I see "alteration_window_dismiss_button"
    When I tap the "alteration_window_dismiss_button" button
    And I tap the back button
    And I tap the "key_info_preview" button
    Then I see "grey_button_Estado civil"
    But I do not see "red_button_Estado civil"
    And I wait 5 seconds
    When I see "green_button_Nome do pai"
    And I tap the "green_button_Nome do pai" button
    And I see "alteration_window_dismiss_button"
    When I tap the "alteration_window_dismiss_button" button
    And I tap the back button
    And I tap the "key_info_preview" button
    Then I see "grey_button_Nome do pai"
    But I do not see "green_button_Nome do pai"