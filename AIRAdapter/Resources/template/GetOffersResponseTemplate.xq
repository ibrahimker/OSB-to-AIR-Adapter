<get:GetOffersResponse xmlns:get="http://www.example.org/GetOffers/">
<status>{$festatus}</status>
<description>{$fedesc}</description>
<Offers>
{
	(: Loop for getting offer information :)
	let $a := $body/methodResponse/params/param/value/struct/member[name="offerInformation"]/value/array/data/value
	for $v in $a
	return
	<Offer>{$v/struct/member[name="offerID"]/value/i4/text()};{substring($v/struct/member[name="startDate"]/value/dateTime.iso8601/text(),1,8)};{substring($v/struct/member[name="expiryDate"]/value/dateTime.iso8601/text(),1,8)};{$v/struct/member[name="offerType"]/value/i4/text()}</Offer>
}
</Offers>
</get:GetOffersResponse>