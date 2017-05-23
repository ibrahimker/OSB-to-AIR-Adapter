<methodCall>
<methodName>UpdateBalanceAndDate</methodName>
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
<member>
<name>transactionCurrency</name>
<value>
<string>RUP</string>
</value>
</member>
<member>
<name>dedicatedAccountUpdateInformation</name>
<value>
<array>
<data>
{
	let $a := $body/inad:INAdjustmentMultiDARequest/dedicatedAccountUpdateInfo
	for $v in $a
	return
	<value>
	<struct>
	<member>
	<name>dedicatedAccountID</name>
	<value>
	<i4>{$v/dedicatedAccountID/text()}</i4>
	</value>
	</member>
        {
          	if(fn:exists($v/adjustmentAmountRelative/text()) and fn:exists($v/dedicatedAccountUnitType/text())) then
	            <member>
	            <name>adjustmentAmountRelative</name>
	            <value>
	            <string>{local:normaliseDAValueAdjustment($v/adjustmentAmountRelative/text(),xs:integer($v/dedicatedAccountUnitType/text()))}</string>
	            </value>
	            </member>
	        else if(fn:exists($v/adjustmentAmountRelative/text()) and not(fn:exists($v/dedicatedAccountUnitType/text()))) then
	            <member>
	            <name>adjustmentAmountRelative</name>
	            <value>
	            <string>{local:normaliseDAValueAdjustment($v/adjustmentAmountRelative/text(),1)}</string>
	            </value>
	            </member>
           	else if(fn:exists($v/dedicatedAccountValueNew/text()) and fn:exists($v/dedicatedAccountUnitType/text())) then
              	<member>
	            <name>dedicatedAccountValueNew</name>
	            <value>
	            <string>{local:normaliseDAValueAdjustment($v/dedicatedAccountValueNew/text(),xs:integer($v/dedicatedAccountUnitType/text()))}</string>
	            </value>
	            </member>
	        else if(fn:exists($v/dedicatedAccountValueNew/text()) and not(fn:exists($v/dedicatedAccountUnitType/text()))) then
              	<member>
	            <name>dedicatedAccountValueNew</name>
	            <value>
	            <string>{local:normaliseDAValueAdjustment($v/dedicatedAccountValueNew/text(),1)}</string>
	            </value>
	            </member>
           	else
           	''
        }
        {
          	if(fn:exists($v/adjustmentDateRelative/text())) then
	            <member>
	            <name>adjustmentDateRelative</name>
	            <value>
	            <i4>{$v/adjustmentDateRelative/text()}</i4>
	            </value>
	            </member>
           	else if(fn:exists($v/expiryDate/text())) then
              	<member>
				<name>expiryDate</name>
				<value>
				<dateTime.iso8601>{fn:concat($v/expiryDate/text(),"T12:00:00+0000")}</dateTime.iso8601>
				</value>
				</member>
           	else
           	''
        }
        {
          	if(fn:exists($v/dedicatedAccountUnitType/text())) then
	            <member>
				<name>dedicatedAccountUnitType</name>
				<value>
				<i4>{$v/dedicatedAccountUnitType/text()}</i4>
				</value>
				</member>
           	else
           		<member>
				<name>dedicatedAccountUnitType</name>
				<value>
				<i4>1</i4>
				</value>
				</member>
        }
        </struct>
		</value>
}
</data>
</array>
</value>
</member>
<member>
<name>externalData1</name>
<value>
<string>
{
	if(fn:exists($body/inad:INAdjustmentMultiDARequest/serviceId/text())) then
	$body/inad:INAdjustmentMultiDARequest/serviceId/text()
	else 111111
}
</string>
</value>
</member>
</struct>
</value>
</param>
</params>
</methodCall>