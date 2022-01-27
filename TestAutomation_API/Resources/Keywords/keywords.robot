*** Keywords ***
KW_01 Get the version of Valid Stations
   FOR    ${station}    IN   @{stationIdP}
    log    ${station}
    Create Session   mysession   ${Base_url}
    ${headers}=    Create Dictionary    Content-Type    application/json
    &{data}=       Create Dictionary    command=getVersion
    ${response}=    post request    mysession      v1/tests/${station}    headers=${headers}   json=${data}
    ${json_object}=    to json  ${response.content}
    ${result_value}=   get value from json  ${json_object}   $.result
    ${json_status_code}=  Convert To String    ${response.status_code}
    Should Be Equal    ${json_status_code}    200
    log                ${result_value}
    ${Version_OK}=  Convert To Number   ${result_value[0]}
    log  ${Version_OK}
    Run Keyword If  ${Version_OK} == 1.6
    ...  Run Keywords  Continue For Loop
    ...  AND  Fail  "Do not meet Error Validation Criteria"
    ...  ELSE
    ...  Run keyword And Continue On Failure  Should Be True    ${result_value[0]} > 1.6
    END
KW_02 Get the interval of Valid Stations
   FOR    ${station}    IN   @{stationIdP}
    log    ${station}
    Create Session   mysession   ${Base_url}
    ${headers}=    Create Dictionary    Content-Type    application/json
    &{data}=       Create Dictionary    command=getInterval
    ${response}=    post request    mysession      v1/tests/${station}    headers=${headers}   json=${data}
    ${json_object}=    to json  ${response.content}
    ${result_value}=   get value from json  ${json_object}   $.result
    ${json_status_code}=  Convert To String    ${response.status_code}
    Should Be Equal    ${json_status_code}    200
    ${result_value}=  Convert To String   ${result_value}
    log                ${result_value}
    Should Contain Any    ${result_value}   @{Interval}
    END
KW_03 setValues With diffrent Valid Stations & with Valid Payload
  FOR    ${station}    IN   @{stationIdP}
    log    ${station}
    Create Session   mysession   ${Base_url}
    ${headers}=    Create Dictionary    Content-Type    application/json
    &{data}=       Create Dictionary    command=setValues    payload=${payloadv}
    ${response}=    post request    mysession      v1/tests/${station}    headers=${headers}   json=${data}
    ${json_object}=    to json  ${response.content}
    ${result_value}=   get value from json  ${json_object}   $.result
    ${json_status_code}=  Convert To String    ${response.status_code}
    Should Be Equal    ${json_status_code}    200
    log                ${result_value}
    ${String_OK}=  Convert To String   ${result_value[0]}
    Run Keyword If  '${result_value[0]}' != 'OK'  Continue For Loop
    Should Be Equal    ${result_value[0]}    	OK
    END

KW_04 setValues With diffrent Valid Input Payload & Valid Station
  FOR    ${robot}    IN   @{payloadP}
    log    ${robot}
    Create Session   mysession   ${Base_url}
    ${headers}=    Create Dictionary    Content-Type    application/json
    &{data}=       Create Dictionary    command=setValues    payload=${robot}
    ${response}=    post request    mysession      v1/tests/${stationv}    headers=${headers}   json=${data}
    ${json_object}=    to json  ${response.content}
    ${result_value}=   get value from json  ${json_object}   $.result
    ${json_status_code}=  Convert To String    ${response.status_code}
    Should Be Equal    ${json_status_code}    200
    log                ${result_value}
    ${String_OK}=  Convert To String   ${result_value[0]}
    Run Keyword If  '${result_value[0]}' != 'OK'  Continue For Loop
    Should Be Equal    ${result_value[0]}    	OK
    END


KW_05 setValues With diffrent Invalid Stations & with Valid Payload
  FOR    ${station}    IN   @{stationIdN}
    log    ${station}
    Create Session   mysession   ${Base_url}
    ${headers}=    Create Dictionary    Content-Type    application/json
    &{data}=       Create Dictionary    command=setValues    payload=${payloadv}
    ${response}=    post request    mysession      v1/tests/${station}    headers=${headers}   json=${data}
    ${json_object}=    to json  ${response.content}
    ${result_value}=   get value from json  ${json_object}   $.result
    ${json_status_code}=  Convert To String    ${response.status_code}
    Should Be Equal    ${json_status_code}    200
    log                ${result_value}
    ${String_null}=  Convert To String   ${result_value}
    Should not Be Equal    ${result_value}   ok
    END

KW_06 setValues With diffrent InValid Input Payload & Valid Station
  FOR    ${robot}    IN   @{payloadN}
    log    ${robot}
    Create Session   mysession   ${Base_url}
    ${headers}=    Create Dictionary    Content-Type    application/json
    &{data}=       Create Dictionary    command=setValues    payload=${robot}
    ${response}=    post request    mysession      v1/tests/${stationv}    headers=${headers}   json=${data}
    ${json_status_code}=  Convert To String    ${response.status_code}
    Should Be Equal    ${json_status_code}    200
    ${json_object}=    to json  ${response.content}
    ${result_value}=   get value from json  ${json_object}   $.result
    log                ${result_value}
    ${String_OK}=  Convert To String   ${result_value[0]}
    Run Keyword If  '${result_value[0]}' != 'FAILED'
    ...  Run Keywords  Continue For Loop
    ...  AND  Fail  "Do not meet Error Validation Criteria"
    ...  ELSE
    ...  Run keyword And Continue On Failure  Should Be Equal    ${result_value[0]}    	FAILED

    END
KW_07 setValues With single InValid Input Payload & diffrent Valid Station
    FOR    ${station}    IN   @{stationIdP}
    log    ${station}
    Create Session   mysession   ${Base_url}
    ${headers}=    Create Dictionary    Content-Type    application/json
    &{data}=       Create Dictionary    command=setValues    payload=${payloadn}
    ${response}=    post request    mysession      v1/tests/${station}    headers=${headers}   json=${data}
    ${json_object}=    to json  ${response.content}
    ${result_value}=   get value from json  ${json_object}   $.result
    ${json_status_code}=  Convert To String    ${response.status_code}
    Should Be Equal    ${json_status_code}    200
    log                ${result_value}
    ${String_OK}=  Convert To String   ${result_value[0]}
    Run Keyword If  '${result_value[0]}' != 'FAILED'
    ...  Run Keywords  Continue For Loop
    ...  AND  Fail  "Do not meet Error Validation Criteria"
    ...  ELSE
    ...  Run keyword And Continue On Failure  Should Be Equal    ${result_value[0]}    	FAILED
    END
