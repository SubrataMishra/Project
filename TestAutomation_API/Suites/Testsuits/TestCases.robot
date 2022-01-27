*** Settings ***
Library    String
Library    JSONLibrary
Library     RequestsLibrary
Library    String
#************** Libraries & Resource files*********************
Resource	../../Resources/Config/config.robot
#################******************************************###################################
Documentation     This test-set covers Tests/User-stories of important Api features
...               like GetVersion, get interval and set values Api
...               suite usases RF JsonLibrary and Builtin functions & user defined keywords
...               Cli >robot --outputdir ./Results -i SMOKE ./*.robot
#################******************************************###################################
*** Test Cases ***
TC_01.0.0 Test GetVersion Api
   [Documentation]  This testcase Tests GetVersion Api end point with Diffrent
   ...            Valid  Stations in a loop
   ...           Inorder to verify if the Defined Acceeptance criteria is met.
   KW_01 Get the version of Valid Stations
   [Tags]    Smoke
   [Teardown]  Delete All Sessions
TC_02.0.0 Test GetInterval Api
   [Documentation]  This testcase Tests GetInterval Api end point with Diffrent
   ...            Valid  Stations in a loop
   ...           Inorder to verify if the Defined Acceeptance criteria is met.
   KW_02 Get the interval of Valid Stations
   [Tags]    Smoke
   [Teardown]  Delete All Sessions

TC_03.0.0 Test Setvalues Api
   [Documentation]  This testcase Tests SetValues Api end point with Diffrent
   ...            Valid  Stations in a loop
   ...           Inorder to verify if the Defined Acceeptance criteria is met.
   KW_03 setValues With diffrent Valid Stations & with Valid Payload
   #KW_04 setValues With diffrent Valid Input Payload & Valid Station
   [Tags]    Smoke
   [Teardown]  Delete All Sessions


TC_03.1.0 Test Setvalues Api
   [Documentation]  This testcase Tests SetValues Api end point with single
   ...            Valid  Station and with digffrent valid  payload Input
   ...           Inorder to verify if the Defined Acceeptance criteria is met & error handeling is proper.
   KW_04 setValues With diffrent Valid Input Payload & Valid Station
   [Tags]    Smoke
   [Teardown]  Delete All Sessions


TC_03.1.1 Test Setvalues Api Error case
   [Documentation]  This testcase Tests SetValues Api end point with single
   ...            Valid  input payload  and with digffrent invalid  Stations
   ...           Inorder to verify if the Defined Acceeptance criteria is met & error handeling is proper.
  KW_05 setValues With diffrent Invalid Stations & with Valid Payload
   [Tags]    Smoke
   [Teardown]  Delete All Sessions

TC_03.1.2 Test Setvalues Api Error case
   [Documentation]  This testcase Tests SetValues Api end point with single
   ...            Valid  Station   and with digffrent invalid  Payload
   ...           Inorder to verify if the Defined Acceeptance criteria is met & error handeling is proper.
  KW_06 setValues With diffrent InValid Input Payload & Valid Station
   [Tags]    Smoke
   [Teardown]  Delete All Sessions
TC_03.1.3 Test Setvalues Api Error case
   [Documentation]  This testcase Tests SetValues Api end point with single
   ...            inValid  input   and with digffrent valid  stations
   ...           Inorder to verify if the Defined Acceeptance criteria is met & error handeling is proper.
  KW_07 setValues With single InValid Input Payload & diffrent Valid Station
   [Tags]    Smoke
   [Teardown]  Delete All Sessions