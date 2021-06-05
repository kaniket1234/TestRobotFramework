*** Settings ***
Documentation     A test suite with a single Gherkin style test.
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          resource.robot
Test Teardown     Close Browser

*** Test Cases ***
Verify Nike Family Tree
    Given browser is opened to Metis Mythology
    When Nike is available under Personified Concepts
    Then Navigate to Nike Family Tree

*** Keywords ***
browser is opened to Metis Mythology
    Open Browser To Metis Page

Nike is available under Personified Concepts
    ${element}  Find Personified Concepts
    Wait Until Page Contains Element    ${element}
    Set Focus To Element    xpath=//td[contains(@class,"sidebar-content")]/div/ul/li/a[contains(text(), "Nike")]

Navigate to Nike Family Tree
    Click Link    xpath=//td[contains(@class,"sidebar-content")]/div/ul/li/a[contains(text(), "Nike")]
    Scroll To Element    xpath=//span[contains(@id,"Family_tree")]
