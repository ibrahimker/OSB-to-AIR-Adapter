<methodCall>
<methodName>GetOffers</methodName>
<params>
<param>
<value>
<struct>
<member>
<name>originNodeType</name>
<value>
<string>EXT</string>
</value>
</member>
<member>
<name>originHostName</name>
<value>
<string>{$OSBHostname}</string>
</value>
</member>
<member>
<name>originTransactionID</name>
<value>
<string>{$orderID}</string>
</value>
</member>
<member>
<name>originTimeStamp</name>
<value>
<dateTime.iso8601>{local:formatDateTime($startreqbe)}</dateTime.iso8601>
</value>
</member>
<member>
<name>subscriberNumberNAI</name>
<value>
<i4>1</i4>
</value>
</member>
<member>
<name>subscriberNumber</name>
<value>
<string>{$msisdn}</string>
</value>
</member>
</struct>
</value>
</param>
</params>
</methodCall>