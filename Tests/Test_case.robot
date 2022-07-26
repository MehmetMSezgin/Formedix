*** Settings ***
#These resource files has been created to implement Page Object Model
Resource    ../Resources/Common.robot
Resource    ../Resources/PO/SignIn.robot
Resource    ../Resources/PO/Dashboard.robot

#It sets up browser and driver and closes the browser at the end of test
Suite Setup    Common.Begin web test
Suite Teardown    Common.End web test


*** Test Cases ***
End to end web test
    [Documentation]    Each step has been defined in Resources file
    Login to the application using the credentials
    Navigate to Repository->Studies and perform the following actions
    Confirm the options on the Tech Study menu
    Enter the tech test study view
    Enter the Data acquisition asset group view
    Select to view Forms
    Select to edit the form by adding a Description property to the form
    ${description} =    generate random string    8
    ${locale} =    generate random string    2
    Enter description and locale    ${description}    ${locale}
    Save the change
    Confirm the user update has been preserved on the property panel, and on the main form view    ${description}
    Logout of the application

#Test report has been generated in Results file