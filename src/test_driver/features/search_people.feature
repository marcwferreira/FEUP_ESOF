Feature: Search for profiles
  Search page functionality, search widget and more information page

  Background:
    Given I am logged in
    And I open the drawer
    And I tap the "key_Pesquisar Pessoal" button

  Scenario: I want to access the "Search People" page
    Then I expect the text "Pesquisar Pessoal" to be present
    And I expect the text "Sem Resultados" to be present
    And I see "key_search_button"

  Scenario: I want to have a simple interface to search people
    When I tap the "key_search_button" button
    Then I see "search_people_popup"
    And I expect the text "Pesquisa" to be present
    And I see "search_window_form_text"
    And I see "search_window_cancel_button"
    And I see "search_window_search_button"

  Scenario: I shouldn't find someone who doesn't exist
    Given I tap the "key_search_button" button
    And I fill the "search_window_form_text" field with "Test"
    When I tap the "search_window_search_button" button
    And I wait 2 seconds
    Then I expect the text "Sem Resultados" to be present

  Scenario: I want to find someone who exists
    Given I tap the "key_search_button" button
    And I fill the "search_window_form_text" field with "jose"
    When I tap the "search_window_search_button" button
    And I open the drawer
    And I tap the "key_Declaração Multiusos" button
    And I open the drawer
    And I tap the "key_Pesquisar Pessoal" button
    Then I expect the text "Jose Aluno Junior" to be present
    And I see "searchTile_206969699"

  Scenario: I want to see details about someone who exists
    Given I tap the "key_search_button" button
    And I fill the "search_window_form_text" field with "jose"
    When I tap the "search_window_search_button" button
    And I open the drawer
    And I tap the "key_Declaração Multiusos" button
    And I open the drawer
    And I tap the "key_Pesquisar Pessoal" button
    And I tap the "searchTile_202069697" button
    Then I expect the text "Jose Aluno Junior" to be present
    And I expect the text "curso:" to be present
    And I expect the text "LEIC" to be present
    And I expect the text "ano:" to be present
    And I expect the text "2" to be present