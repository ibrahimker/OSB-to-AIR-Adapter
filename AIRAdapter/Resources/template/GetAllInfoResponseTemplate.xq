<get:GetINAllInfoResponse  xmlns:get="http://www.example.org/GetINAllInfo/">
<status>{$festatus}</status>
<description>{$fedesc}</description>
<maBalance>{xs:int(floor($body/methodResponse/params/param/value/struct/member[name="accountValue1"]/value/string/text() div 100))}</maBalance>
<serviceClass>{$body/methodResponse/params/param/value/struct/member[name="serviceClassCurrent"]/value/i4/text()}</serviceClass>
<expiredDate>{substring($body/methodResponse/params/param/value/struct/member[name="supervisionExpiryDate"]/value/dateTime.iso8601/text(),1,8)}</expiredDate>
<terminateDate>{substring($body/methodResponse/params/param/value/struct/member[name="serviceFeeExpiryDate"]/value/dateTime.iso8601/text(),1,8)}</terminateDate>
{
	let $a := $body/methodResponse/params/param/value/struct/member[name="dedicatedAccountInformation"]/value/array/data/value
	for $v in $a
	let $id := $v/struct/member[name="dedicatedAccountID"]/value/i4/text()
	return
	fn-bea:inlinedXML(concat("<da",$id,">",local:normaliseDAValue(xs:integer($v/struct/member[name="dedicatedAccountValue1"]/value/string/text()),xs:integer($v/struct/member[name="dedicatedAccountUnitType"]/value/i4/text())),";",substring($v/struct/member[name="expiryDate"]/value/dateTime.iso8601/text(),1,8),";",substring($v/struct/member[name="startDate"]/value/dateTime.iso8601/text(),1,8),"</da",$id,">"))
}
<Offers>
{
	(: Loop for getting offer information :)
	let $a := $body/methodResponse/params/param/value/struct/member[name="offerInformationList"]/value/array/data/value
	for $v in $a
	return
	<Offer>{$v/struct/member[name="offerID"]/value/i4/text()};{substring($v/struct/member[name="startDate"]/value/dateTime.iso8601/text(),1,8)};{substring($v/struct/member[name="expiryDate"]/value/dateTime.iso8601/text(),1,8)};{$v/struct/member[name="offerType"]/value/i4/text()}</Offer>
}
</Offers>
</get:GetINAllInfoResponse>