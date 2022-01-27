*** Variables ***
@{Interval}         1  10  11  12  13  14  15  20  21  60
${Base_url}         https://api-energy-k8s.test.virtaglobal.com
@{payloadP}         3  3  4  5  6  7  8  9  10
@{stationIdP}       3  2  3  3  4  5  1
@{payloadN}         12  12  15  17
@{stationIdN}       0  1  6  8  19
${jsonReq3}         { "command": "setValues", "payload": 3 }
${jsonReq1}         { "command": "getVersion" }
${jsonReq2}         { "command": "getInterval" }
${payloadv}          3
${stationv}          1
${payloadn}          13
${stationn}          6
${jsonReq4}         { "command": "setValues", "payload": 1 }