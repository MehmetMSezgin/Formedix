*** Settings ***
Library    SeleniumLibrary
Library    String


*** Variables ***
${REPOSITORY} =    xpath=//*[@id="menuMdb"]/fdx-main-nav-item/div/p[2]
${STUDIES} =    xpath=(//span[@class="fdx-sub-nav-menu-item-label"])[2]
${UPDATED} =    xpath=//strong[@id='fdxMdbContainerListItem0StoredLabel']
${STATUS} =    id=fdxMdbContainerListItem0StateLabel
${VERSION} =    xpath=//*[text()='Version']
${Tech_Study_Bar} =    id=fdxMdbContainerListItem0MenuToggle
${View_button} =    id=fdxMdbContainerListItem0View
${Data_Acquisition} =    id=dataAcquisitionName
${Data_Acquisition_Headbar} =    xpath=//span[@title='Data acquisition'][1]
${FORMS} =    id=FORMTypeView
${Medical_History} =    xpath=//*[text()='Medical History']
${EDIT_FORM} =    id=switchEditMode
${Add_description} =    id=editPropsAddEntrydescription
${Description_area} =    xpath=(//textarea[@id='assetLocaleEditTextTextareadescription'])[1]
${Locale_area} =    xpath=(//input[@id='localeInputdescription'])[1]
${VALIDATE_UPDATE} =    id=saveAsset
${LOG_OUT_MODULE} =    xpath=//p[text()='testteamtechtest']
${LOG_OUT_BUTTON} =    xpath=//p[text()='Sign out of ryze']


*** Keywords ***
Navigate to Repository->Studies and perform the following actions
    wait until page contains    Dashboard    5s
    mouse over    ${REPOSITORY}
    click element    ${STUDIES}

Confirm the options on the Tech Study menu
    sleep    3s
    wait until page contains    Updated
    element text should be    ${UPDATED}    Updated
    element text should be    ${STATUS}    Status
    element text should be    ${VERSION}    Version

Enter the tech test study view
    click element    ${Tech_Study_Bar}
    wait until page contains    View    5s
    click element    ${View_button}

Enter the Data acquisition asset group view
    wait until page contains    Asset groups
    sleep    3s
    click element    ${Data_Acquisition}
    wait until page contains element    ${Data_Acquisition_Headbar}

Select to view Forms
    wait until page contains element    ${FORMS}
    click element    ${FORMS}
    wait until page contains    Medical History
    click element    ${Medical_History}

Select to edit the form by adding a Description property to the form
    wait until element is enabled    ${EDIT_FORM}    10s
    wait until page does not contain    Asset loaded
    click element    ${EDIT_FORM}
    wait until page contains element    ${Add_description}
    click element    ${Add_description}
    sleep    3s

Enter description and locale
    [Arguments]    ${description}    ${locale}
    input text    ${Description_area}    ${description}
    input text    ${Locale_area}    ${locale}
    sleep    5s

Save the change
    wait until page contains    Validate & Update
    click element    ${VALIDATE_UPDATE}
    sleep    5s

Confirm the user update has been preserved on the property panel, and on the main form view
    [Arguments]    ${description}
    ${actual_result} =    get text    id=formDescription
    should be equal    ${actual_result}    ${description}

Logout of the application
    mouse over    ${LOG_OUT_MODULE}
    wait until element is visible    ${LOG_OUT_BUTTON}
    click element    ${LOG_OUT_BUTTON}
    wait until page contains    You have signed out.







