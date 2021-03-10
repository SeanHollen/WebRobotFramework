*** Settings ***
Documentation     Reusable keywords and variables
...
...               Utilizes keywords provided SeleniumLibrary
Library           SeleniumLibrary

*** Variables ***
${BROWSER}        firefox
${DELAY}          0.2
${LOGIN URL}      https://accounts.google.com/signin/v2/identifier?continue=https%3A%2F%2Fmail.google.com%2Fmail%2F&service=mail&sacu=1&rip=1&flowName=GlifWebSignIn&flowEntry=ServiceLogin
${VALID USER}   Test12321XXYY
${VALID PASSWORD}   Test12321#XXYY#
${INBOX URL}    https://mail.google.com/mail/u/0/
${COMPOSEBUTTON}    xpath://*[@class="oo"]/div/div/div/div
${SENDBUTTON}    class:aoO

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Login Page Should Be Open

Login Page Should Be Open
    Title Should Be    Gmail

Go To Login Page
    Go To    ${LOGIN URL}
    Login Page Should Be Open

Input Username
    [Arguments]    ${username}
    Input Text    name:identifier    ${username}

Input Password
    [Arguments]    ${password}
    Wait Until Page Contains Element    name:password
    Input Text    name:password    ${password}

Next Button
    Click Button    class:nCP5yc

Email page should be open
    Location Should Be    ${INBOX URL}
