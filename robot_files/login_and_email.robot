*** Settings ***
Documentation     Logs in, composes an email, sends it, clicks on email
...
...               Uses keywords in resources file
Suite Setup       Open Browser To Login Page
Suite Teardown    Close Browser
Resource          resources.robot

*** Variables ***
${RECIPIENT}   Test12321XXYY@gmail.com
${SUBJECT}   Contradulations
${CONTENTS}   We are pleased to inform you...
${PATHTOEMAIL}    xpath://*[@id=":2d"]/tbody/tr[1]

*** Test Cases ***
Valid Login
    Login Page Should Be Open
    Input Username    ${VALID USER}
    Next Button
    Input Password    ${VALID PASSWORD}
    Next Button
    
Write Email
    Wait Until Page Contains Element    ${COMPOSEBUTTON}
    Click Element    ${COMPOSEBUTTON}
    Fill out email
    Wait Until Page Contains Element    ${SENDBUTTON}
    Click Element    ${SENDBUTTON}

Open Email
    Click Element     ${PATHTOEMAIL}

*** Keywords ***
Fill Out Email
    Wait Until Element is Visible    class:vO
    Input Text    class:vO    ${RECIPIENT}
    Input Text    name:subjectbox    ${SUBJECT}
    Input Text    class:Am    ${CONTENTS}

