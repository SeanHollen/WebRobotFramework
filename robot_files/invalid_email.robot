*** Settings ***
Documentation     Tries to send an email without addressing it
...
...               Uses keywords in resources file
Suite Setup       Open Browser To Login Page
Suite Teardown    Close Browser
Resource          resources.robot

*** Variables ***
${RECIPIENT}   Test12321XXYY@gmail.com
${SUBJECT}   Contradulations
${CONTENTS}   We are pleased to inform you...

*** Test Cases ***
Valid Login
    Input Username    ${VALID USER}
    Next Button
    Input Password    ${VALID PASSWORD}
    Next Button
    
Write Email
    Wait Until Page Contains Element    ${COMPOSEBUTTON}
    Click Element    ${COMPOSEBUTTON}
    Wait Until Page Contains Element    ${SENDBUTTON}
    Click Element    ${SENDBUTTON}

*** Keywords ***
Email Should Have Failed
    Page Should Contain    class:Kj-JD
