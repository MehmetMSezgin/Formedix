*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${USERNAME} =    testteamtechtest
${PASSWORD} =    T3st3rT3ch
${USERNAME_BOX} =    id=username
${PASSWORD_BOX} =    id=password
${SIGNIN_BUTTON} =    id=btnSubmit

*** Keywords ***
Login to the application using the credentials
    input text    ${USERNAME_BOX}    ${USERNAME}
    input text    ${PASSWORD_BOX}    ${PASSWORD}
    wait until element is enabled    ${SIGNIN_BUTTON}    5s
    click element    ${SIGNIN_BUTTON}