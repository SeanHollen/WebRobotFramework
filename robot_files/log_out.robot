*** Settings ***
Documentation     Logs in and logs out
...
...               Uses keywords in resources file
Suite Setup       Open Browser To Login Page
Suite Teardown    Close Browser
Resource          resources.robot

*** Keywords ***
Account Options
    Wait Until Page Contains Element    class:gb_D
    Click Element    class:gb_Na

Logout
    Click Element    id:gb_71

*** Test Cases ***
Valid Login
    Login Page Should Be Open
    Input Username    ${VALID USER}
    Next Button
    Input Password    ${VALID PASSWORD}
    Next Button
    Account Options
    Logout
    Login Page Should Be Open

