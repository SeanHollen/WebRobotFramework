*** Settings ***
Documentation     A single test for a log in and checking if logged in
...
...               Uses keywords in resources file
Suite Setup       Open Browser To Login Page
Suite Teardown    Close Browser
Resource          resources.robot

*** Test Cases ***
Valid Login
    Login Page Should Be Open
    Input Username    ${VALID USER}
    Next Button
    Input Password    ${VALID PASSWORD}
    Next Button
    Email page should be open