*** Settings ***
Library           Selenium2Library

*** Test Cases ***
test2

test1
    [Setup]
    ${ab}    set variable    123456
    log    1234
    ${abc}    create dictionary    a=1    b=1
    log    ${abc.a}
