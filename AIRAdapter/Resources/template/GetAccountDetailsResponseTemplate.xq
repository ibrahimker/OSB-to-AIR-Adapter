<get:GetAccountDetails xmlns:get="http://indosatooredoo.com/ngssp/schemas/GetAccountDetails/">
<status>{$festatus}</status>
<description>{$fedesc}</description>
<maBalance>{xs:int(floor($body/methodResponse/params/param/value/struct/member[name="accountValue1"]/value/string/text() div 100))}</maBalance>
<serviceClass>{$body/methodResponse/params/param/value/struct/member[name="serviceClassCurrent"]/value/i4/text()}</serviceClass>
<expiredDate>{substring($body/methodResponse/params/param/value/struct/member[name="supervisionExpiryDate"]/value/dateTime.iso8601/text(),1,8)}</expiredDate>
<activationDate>{substring($body/methodResponse/params/param/value/struct/member[name="activationDate"]/value/dateTime.iso8601/text(),1,8)}</activationDate>
<terminateDate>{substring($body/methodResponse/params/param/value/struct/member[name="serviceFeeExpiryDate"]/value/dateTime.iso8601/text(),1,8)}</terminateDate>
{
	let $a := $body/methodResponse/params/param/value/struct/member[name="dedicatedAccountInformation"]/value/array/data/value
	for $v in $a
	let $id := $v/struct/member[name="dedicatedAccountID"]/value/i4/text()
	return
	fn-bea:inlinedXML(concat("<da",$id,">",$v/struct/member[name="dedicatedAccountValue1"]/value/string/text(),";",substring($v/struct/member[name="expiryDate"]/value/dateTime.iso8601/text(),1,8),";",substring($v/struct/member[name="startDate"]/value/dateTime.iso8601/text(),1,8),"</da",$id,">"))
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
<accountGroupID>{$body/methodResponse/params/param/value/struct/member[name="accountGroupID"]/value/i4/text()}</accountGroupID>
<serviceOffering>{$sum}</serviceOffering>
<bitmap>{$bitmap}</bitmap>
<communityID>
{
	let $a := $body/methodResponse/params/param/value/struct/member[name="communityInformationCurrent"]/value/array/data/value
	for $v at $pos in $a
	return
	if($pos eq count($a)) then
	$v/struct/member[name="communityID"]/value/i4/text()
    else concat($v/struct/member[name="communityID"]/value/i4/text(),';')
}
</communityID>
</get:GetAccountDetails>