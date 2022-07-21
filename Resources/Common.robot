*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL} =    https://ryze-staging.formedix.com/sign-in
${BROWSER} =    chrome

*** Keywords ***
Begin web test
    [Documentation]    Test suite set up
    open browser    ${URL}    ${BROWSER}
    maximize browser window
    sleep    2s
    Accept cookies

End web test
    [Documentation]    Test suite tear down
    close browser

Accept cookies
    [Documentation]    it is used in begin web test
    click element    xpath=//button[@data-translate='app.ok']