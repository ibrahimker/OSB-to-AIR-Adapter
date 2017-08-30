<methodCall>
<methodName>UpdateUsageThresholdsAndCounters</methodName>
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
{
	if(fn:exists($body/upd1:UpdateUsageCounterRequest/updateUsageCounterForMultiUser/text())) then
	<member>
	<name>updateUsageCounterForMultiUser</name>
	<value>
	<i4>{$body/upd1:UpdateUsageCounterRequest/updateUsageCounterForMultiUser/text()}</i4>
	</value>
	</member>
	else
	''
}
<member>
<name>usageCounterUpdateInformation</name>
<value>
<array>
<data>
<value>
<struct>
<member>
<name>usageCounterID</name>
<value>
<i4>{$body/upd1:UpdateUsageCounterRequest/counterId/text()}</i4>
</value>
</member>
<member>
<name>usageCounterValueNew</name>
<value>
<string>{$body/upd1:UpdateUsageCounterRequest/newCounterValue/text()}</string>
</value>
</member>
{
	if(fn:exists($body/upd1:UpdateUsageCounterRequest/associatedPartyId/text())) then
	<member>
	<name>associatedPartyID</name>
	<value>
	<string>{$body/upd1:UpdateUsageCounterRequest/associatedPartyId/text()}</string>
	</value>
	</member>
	else
	''
}
{
	if(fn:exists($body/upd1:UpdateUsageCounterRequest/productId/text())) then
	<member>
	<name>productID</name>
	<value>
	<i4>{$body/upd1:UpdateUsageCounterRequest/productId/text()}</i4>
	</value>
	</member>
	else
	''
}
</struct>
</value>
</data>
</array>
</value>
</member>
</struct>
</value>
</param>
</params>
</methodCall>