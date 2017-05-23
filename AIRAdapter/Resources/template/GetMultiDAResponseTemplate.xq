<GetDedicatedAccountsResponse>
<status>{$festatus}</status>
<description>{$fedesc}</description>
<DedicatedAccountCollection>
{
	let $a := $body/methodResponse/params/param/value/struct/member[name="dedicatedAccountInformation"]/value/array/data/value[contains($AllDedicatedAccounts,concat('|',struct/member[name="dedicatedAccountID"]/value/i4/text(),'|'))]
	for $v in $a
	return
	<DedicatedAccountData>
	<id>{$v/struct/member[name="dedicatedAccountID"]/value/i4/text()}</id>
	<activeValue>{local:normaliseDAValue(xs:integer($v/struct/member[name="dedicatedAccountActiveValue1"]/value/string/text()),xs:integer($v/struct/member[name="dedicatedAccountUnitType"]/value/i4/text()))}</activeValue>
	<value>{local:normaliseDAValue(xs:integer($v/struct/member[name="dedicatedAccountValue1"]/value/string/text()),xs:integer($v/struct/member[name="dedicatedAccountUnitType"]/value/i4/text()))}</value>
	<unitType>{$v/struct/member[name="dedicatedAccountUnitType"]/value/i4/text()}</unitType>
	<startDate>
	{
		(:Convert Date Time format :)
		let $raw := $v/struct/member[name="startDate"]/value/dateTime.iso8601/text()
		let $year := substring($raw,1,4)
		let $month := substring($raw,5,2)
		let $day := substring ($raw,7,2)
		let $time := substring ($raw,9,9)
		return concat($year,"-",$month,"-",$day,$time)
	}
	</startDate>
	<expiryDate>
	{
		(:Convert Date Time format:)
		let $raw := $v/struct/member[name="expiryDate"]/value/dateTime.iso8601/text()
		let $year := substring($raw,1,4)
		let $month := substring($raw,5,2)
		let $day := substring ($raw,7,2)
		let $time := substring ($raw,9,9)
		return concat($year,"-",$month,"-",$day,$time)
	}
	</expiryDate>
	</DedicatedAccountData>
}
</DedicatedAccountCollection>
</GetDedicatedAccountsResponse>