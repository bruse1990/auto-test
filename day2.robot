*** Settings ***
Library           Selenium2Library
Library           RequestsLibrary
Library           Collections
Library           MyLibrary

*** Test Cases ***
set variable
    [Setup]    start
    ${a}    set variable    a
    ${b}    set variable    b
    ${c}    set variable    c
    log    ${a}
    log    ${b}
    log    ${c}
    [Teardown]    end

create list
    [Setup]    start
    ${list}    create list    xian    fang
    log    ${list}
    [Teardown]    end

catenate
    ${cat}    catenate    hello    world
    log    ${cat}

get time_sleep
    ${time1}    get time
    log    ${time1}
    sleep    5
    ${time2}    get time
    log    ${time2}

for_in range
    : FOR    ${i}    IN RANGE    10
    \    log    ${i}

run keyword if
    ${abc}    set variable    20
    run keyword if    ${abc}>=90    log    优秀    Else if    ${abc}>=70    log
    ...    良好    Else if    ${abc}>=60    log    及格    Else
    ...    log    不及格

evaluate
    ${evaluate}    evaluate    random.randint(1000,9999)    random
    log    ${evaluate}
    ${time}    evaluate    time.time()    time
    log    ${time}
    ${time1}    evaluate    time.ctime()    time
    log    ${time1}

baidu
    open browser    https://www.baidu.com/    chrome
    input text    id=kw    xianfang
    click button    id=su
    sleep    3
    ${title}    get title
    should contain    ${title}    xianfang_百度搜索
    close browser

get
    ${load}=    create dictionary    TBOX-ID=10000000000001    TBOX-LOGIN-TOKEN=e2a9f3bc22884a30b3bdd5298532cf68    Accept=application/json    Content-Type=application/json
    create session    baidu    http://36.152.36.5:9100/api.tbox/v1/message/azureIoTDeviceManage/getConnectString
    ${r}=    get request    baidu    /    headers=${load}
    log    ${r.status_code}
    should be equal as strings    ${r.status_code}    200
    log    ${r.json()}
    ${dict}    set variable    ${r.json()}
    ${code}    get from dictionary    ${dict}    code
    ${intCode}    evaluate    int(27002)
    should be equal    ${code}    ${intCode}
    ${message}    get from dictionary    ${dict}    message
    should be equal    ${message}    tbox data is error

post
    Create Session    htp    http://36.152.36.5:9100/api.tbox/v1/message/tbox/messageList
    ${headers}=    Create Dictionary    Content-Type=application/json    Accept=application/json    TBOX-LOGIN-TOKEN=e2a9f3bc22884a30b3bdd5298532cf68    TBOX-ID=10000000000001
    ${userId}    Evaluate    int(10000000000157)
    ${pageNum}    Evaluate    int(1)
    ${pageSize}    Evaluate    int(20)
    ${data}=    Create Dictionary    userId=${userId}    messageGroup=TRAVEL    pageNum=${pageNum}    pageSize=${pageSize}
    ${r}=    Post Request    htp    /    data=${data}    headers=${headers}
    Should Be Equal As Strings    ${r.status_code}    200
    log    ${r.json()}
    ${dict}    Set Variable    ${r.json()}
    ${code}    Get From Dictionary    ${dict}    code

myaddsub
    ${add}    add    1    2
    log    ${add}
    ${sub}    sub    9    2
    log    ${sub}

create dictionary
    ${abc}    create dictionary    a=1    b=1
    log    ${abc.a}

*** Keywords ***
start
    log    用例开始

end
    log    用例结束
