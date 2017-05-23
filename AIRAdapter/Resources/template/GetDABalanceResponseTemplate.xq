<get:GetINDABalanceResponse xmlns:get="http://www.example.org/GetINDABalance/">
<status>{$festatus}</status>
<description>{$fedesc}</description>
<daBalance>
{
  if(fn:exists($body/methodResponse/params/param/value/struct/member[name="dedicatedAccountInformation"]/value/array/data/value/struct/member[name="dedicatedAccountUnitType"]/value/i4/text())) then
	let $davalue := $body/methodResponse/params/param/value/struct/member[name="dedicatedAccountInformation"]/value/array/data/value/struct/member[name="dedicatedAccountValue1"]/value/string/text()
	let $daUnitType := $body/methodResponse/params/param/value/struct/member[name="dedicatedAccountInformation"]/value/array/data/value/struct/member[name="dedicatedAccountUnitType"]/value/i4/text()
	let $expiryDate := $body/methodResponse/params/param/value/struct/member[name="dedicatedAccountInformation"]/value/array/data/value/struct/member[name="expiryDate"]/value/dateTime.iso8601/text()
	let $startDate := $body/methodResponse/params/param/value/struct/member[name="dedicatedAccountInformation"]/value/array/data/value/struct/member[name="startDate"]/value/dateTime.iso8601/text()
        return concat(local:normaliseDAValue(xs:integer($davalue),xs:integer($daUnitType)),";",substring($expiryDate,1,8),";",substring($startDate,1,8))
      else
         "0;99991231;00000101"
}
</daBalance>
</get:GetINDABalanceResponse>