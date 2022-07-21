*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL} =    https://ryze-staging.formedix.com/sign-in
${BROWSER} =    chrome

*** Keywords ***
Begin web test
    open browser    ${URL}    ${BROWSER}
    maximize browser window
    sleep    2s
    Accept cookies

End web test
    close browser

Accept cookies
    click element    xpath=//button[@data-translate='app.ok']