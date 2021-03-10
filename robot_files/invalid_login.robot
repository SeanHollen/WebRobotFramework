*** Settings ***
Documentation     Fails to log in, incorrect password
...
...               Uses keywords in resources file
Suite Setup       Open Browser To Login Page
Suite Teardown    Close Browser
Resource          resources.robot

*** Keywords ***
Login Should Have Failed
    Location Should Contain    challenge

*** Test Cases ***
Valid Login
    Login Page Should Be Open
    Input Username    ${VALID USER}
    Next Button
    Input Password    ¡wrong_password!
    Next Button
    Login Should Have Failed
