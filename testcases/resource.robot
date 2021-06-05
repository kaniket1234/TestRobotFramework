*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
Library           SeleniumLibrary
Library           String

*** Variables ***
${BROWSER}        Firefox
${DELAY}          1sec
${APP URL}      https://en.wikipedia.org/wiki/Metis_(mythology)
${NIKE XPATH}    xpath=//td[contains(@class,"sidebar-content")]/div/ul/li/a[contains(text(), "Nike")]
${POPUP TEXT}      In ancient Greek civilization, Nike was a goddess who personified victory. Her Roman equivalent was Victoria.

*** Keywords ***
Open Browser To Metis Page
    Open Browser    ${APP URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Web Page Should Be Open

Web Page Should Be Open
    Title Should Be    Metis (mythology) - Wikipedia

Scroll To Element
    [Arguments]    ${locator}
    ${x}=    Get Horizontal Position    ${locator}
    ${y}=    Get Vertical Position    ${locator}
    Execute Javascript    window.scrollTo(${x}, ${y})
    ${element}  Get Element  ${locator}
    [Return]  ${element}

Get Element
    [Arguments]    ${locator}
    ${element}  Get WebElement  ${locator}
    [Return]  ${element}

Find Personified Concepts
    ${element}  Scroll To Element    xpath=//th[contains(text(),"Personified concepts")]
    [Return]  ${element}

Verify PopUp Text
    Set Focus To Element    ${NIKE XPATH}
    Mouse Over    ${NIKE XPATH}
    Sleep    2
    Get WebElement    xpath=//p[contains(.,'${POPUP TEXT}')]
