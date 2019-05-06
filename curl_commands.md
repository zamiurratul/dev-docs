## Resource 1:
https://dasunhegoda.com/make-soap-request-command-line-curl/596/

## Resource 2:
https://hi.service-now.com/kb_view.do?sysparm_article=KB0690780



## Starter:
##### See the Protocol:
curl --trace-ascii debugdump.txt http://www.google.com

##### See the timing:
curl --trace-ascii d.txt --trace-time http://www.google.com/

##### Bring the whole web page:
curl http://www.google.com



## SOAP request using CURL - Example 1:

##### Pattern:
curl --header "Content-Type: text/xml;charset=UTF-8" --header "SOAPAction: ACTION_YOU_WANT_TO_CALL" --data @FILE_NAME URL_OF_THE_SOAP_WEB_SERVICE_ENDPOINT

##### Example:
curl --header "Content-Type: text/xml;charset=UTF-8" --header "SOAPAction:urn:GetVehicleLimitedInfo" --data @request.xml http://11.22.33.231:9080/VehicleInfoQueryService.asmx



## SOAP request using CURL - Example 2:

##### Pattern:
curl --username:password --header "Content-Type: text/xml;charset=UTF-8" --header "SOAPAction: ACTION_YOU_WANT_TO_CALL" --data @FILE_NAME URL_OF_THE_SOAP_WEB_SERVICE_ENDPOINT

##### Example 1: If you are consuming the WSDL from an Instance
curl --user xyz:abc123 --header "Content-Type: text/xml;charset=UTF-8" --header "SOAPAction:Get" --data @test.xml https://<instance_name>.service-now.com/incident.do?SOAP

##### Example 2: If you are consuming the WSDL from a Node
curl --user xyz:abc123 --header "Content-Type: text/xml;charset=UTF-8" --header "SOAPAction:Get" --data @test.xml https://<noce_name>.service-now.com:<Port_Number>/incident.do?SOAP 

##### Example of the curl command with verbose:
curl --user xyz:abc123 --header "Content-Type: text/xml;charset=UTF-8" --header "SOAPAction:Get" --data @test.xml https://<instance_name>.service-now.com/incident.do?SOAP -v


## Utilities:

##### How to save output from curl to a file
curl --header "Content-Type: text/xml;charset=UTF-8" --header "SOAPAction: TEST_SOAP" --data @request.xml http://demo7129263.mockable.io/ -o output.txt 

##### How to create mock web service-now
- www.mockable.io
- www.mocky.io


## Exceptions:

##### How to specify a certificate:
--cert path_to_cert \
--key path_to_private_key \



##### Escape Special Character:
You must escape the " character like this \"
"SoapAction=\"\""


## Common issue you might face:

##### 1.The file containing the request is not readable

Error:                

<SOAP-ENV:Envelope xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/">
<SOAP-ENV:Header/>
<SOAP-ENV:Body>
<SOAP-ENV:Fault>
<faultcode>SOAP-ENV:Server</faultcode>
<faultstring>Unable to parse SOAP document</faultstring>
<detail>Error completing SOAP request</detail>
</SOAP-ENV:Fault>
</SOAP-ENV:Body>
</SOAP-ENV:Envelope>
 
Solution: Check the content and format of the file that contains the SOAP Request 
 
 
##### 2. The credential of the user specified is wrong or user is not authorized to access the WSDL
 
Error:
 
...
...
< HTTP/1.1 401 Unauthorized
< Set-Cookie: JSESSIONID=5C48D05E518DC37DA6502440F2FD8361; Path=/; HttpOnly;Secure
* Authentication problem. Ignoring this.
...
...
Solution : Check the user credential and if there is any ACL blocking the user from accessing the record

 

##### 3. The WSDL is incorrect/wrong

Error:

* Could not resolve host: <URL_OF_THE_SOAP_WEB_SERVICE_ENDPOINT>
* Closing connection 0
curl: (6) Could not resolve host: URL_OF_THE_SOAP_WEB_SERVICE_ENDPOINT
 
Solution: Check if the correct URL is specified in the curl command.