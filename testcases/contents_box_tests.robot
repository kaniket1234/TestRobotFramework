*** Settings ***
Documentation     A test suite with test cases to verify items in contents section of the page
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          resource.robot

*** Test Cases ***
Verify headings in Contents box
    Open Browser To Metis Page
    ${AllLinksCount}=    Get Element Count    xpath=//div[contains(@id, "toc")]/ul/li/a
    # Log the count of links
    Log    ${AllLinksCount}
    # Create a list to store the link texts
    @{LinkItems}    Create List
    # Loop through all links and store links value that has length more than 1 character
    FOR    ${count}    IN RANGE    1    ${AllLinksCount}+1
        ${lintext}=    Get Text    xpath=//div[contains(@id, "toc")]/ul/li[contains(@class, "toclevel-1 tocsection-${count}")]/a/span[2]
        ${hreftext}=    Get Element Attribute    xpath=//div[contains(@id, "toc")]/ul/li[contains(@class, "toclevel-1 tocsection-${count}")]/a    href
        ${href}=    Remove String    ${hreftext}    ${APP URLL}
        ${lintext}=    Replace String    ${lintext}    ${space}    _
        ${link}=    Catenate    SEPARATOR=    \#    ${lintext}
        Should Match    ${href}    ${link}
    END
    [Teardown]    Close Browser    # Close the browser used for testing


Verify hyperlinks in Contents box
    Open Browser To Metis Page
    ${AllLinksCount}=    Get Element Count    xpath=//div[contains(@id, "toc")]/ul/li/a
    # Create a list to store the link texts
    @{LinkItems}    Create List
    # Loop through all links and store links value that has length more than 1 character
    FOR    ${count}    IN RANGE    1    ${AllLinksCount}+1
        ${lintext}=    Get Text    xpath=//div[contains(@id, "toc")]/ul/li[contains(@class, "toclevel-1 tocsection-${count}")]/a/span[2]
        Click Link    xpath=//div[contains(@id, "toc")]/ul/li[contains(@class, "toclevel-1 tocsection-${count}")]/a
        ${text}=    Execute Javascript    return window.getSelection().anchorNode.parentNode.innerHTML;
        Log    ${text}
        Scroll To Element    xpath=//div[contains(@id, "toc")]/ul/li/a
    END
    [Teardown]    Close Browser    # Close the browser used for testing
