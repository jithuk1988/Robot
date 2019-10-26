***Settings***
Resource	../GenericConfiguration/ImportFile.robot

*** Test Cases ***
Test1
    Create Session	URL   ${API_url}
    ${Response}    GET Request    URL    /users
    ${Response_string}    Convert To String    ${Response.content}
    Log Many    ${Response_string}
    Should Contain	${Response_string}	website
    Log To Console    ${Response.status_code}
    Should Be Equal As Strings    ${Response.status_code}    200        
    
Test 2
    Create Session	URL   ${API_url}
    ${json_body}    Get Binary File    ${create}
    ${Response}    POST Request    URL    /users    data=${json_body}
    ${Response_string}    Convert To String    ${Response.content}
    Log Many    ${Response_string}
    Should Contain	${Response_string}	id
    Log To Console    ${Response.status_code}    
    Should Be Equal As Strings    ${Response.status_code}    201  