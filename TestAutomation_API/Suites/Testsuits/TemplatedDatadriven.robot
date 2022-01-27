*** Settings ***
Library    String
Library    DataDriver  file=Datadriven-virta.xlsx
Library    String
Library    REST           https://api-energy-k8s.test.virtaglobal.com          ssl_verify=false
Test Template    setValues Posetive
Resource	../../Resources/Config/config.robot
#************** Libraries & Resource files*********************

#################******************************************###################################
Documentation     This test-set covers Tests/User-stories of important Api features
...               like GetVersion, get interval and set values Api
...               suite usases RF JsonLibrary and Builtin functions & user defined keywords
...               Cli >robot --outputdir ./Results  ./*.robot
#################******************************************###################################
#Suite Setup       Random Global Variable
#Suite Teardown    Close Browsers
#Test Setup        Select Browser & login
#Test Teardown     Logout & Close Application
#################******************************************###################################
*** Test Cases ***
01.Setvalues Posetive  for valid   ${stationIdP}  0000
   



























































*** Keywords ***

setValues Posetive
  [Arguments]  ${stationIdP}
  POST        v1/tests/${stationIdP}                   ${jsonReq4}
  Integer     response status           200
  String      response reason           OK
  Output      response headers Date