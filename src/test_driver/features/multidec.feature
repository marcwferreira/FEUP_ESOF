Feature: Multideclaration
  Issue Multipurpose Declaration

  Background:
    Given I am logged in
    And I open the drawer
    And I tap the "key_Declaração Multiusos" button

  Scenario: Access the "Multideclaration" page
    Then I expect the text "Declaração Multiusos" to be present
    And I expect the text "Salvar como PDF" to be present

  Scenario: "Multideclaration" page shows preview
    And I wait 5 seconds
    Then I see "pdf_preview"

  Scenario: "Multideclaration" page have an option to download file
    Then I see "multiDec_download_button"