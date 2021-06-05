*** Settings ***
Documentation     A test suite with test cases to verify pop up text and navigating to next page via hyperlink
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          resource.robot

*** Test Cases ***
Verify popup text for Nike under Personified Concepts
    Open Browser To Metis Page
    ${element}  Find Personified Concepts
    Wait Until Page Contains Element    ${element}
    Set Focus To Element    xpath=//td[contains(@class,"sidebar-content")]/div/ul/li/a[contains(text(), "Nike")]
    Mouse Over    xpath=//td[contains(@class,"sidebar-content")]/div/ul/li/a[contains(text(), "Nike")]
    Sleep    2
    Get WebElement    xpath=//p[contains(.,'In ancient Greek civilization, Nike was a goddess who personified victory. Her Roman equivalent was Victoria.')]
    [Teardown]    Close Browser    # Close the browser used for testing

Verify Family Tree Page for Nike
    Open Browser To Metis Page
    ${element}  Find Personified Concepts
    Wait Until Page Contains Element    ${element}
    Click Link    xpath=//td[contains(@class,"sidebar-content")]/div/ul/li/a[contains(text(), "Nike")]
    Scroll To Element    xpath=//span[contains(@id,"Family_tree")]
    [Teardown]    Close Browser    # Close the browser used for testing

