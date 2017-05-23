<get:GetAccumulatorResponse xmlns:get="http://www.example.org/GetAccumulator/">
<status>{$festatus}</status>
<description>{$fedesc}</description>
{
	let $a := $body/methodResponse/params/param/value/struct/member[name="accumulatorInformation"]/value/array/data/value
	for $v in $a
	let $id := $v/struct/member[name="accumulatorID"]/value/i4/text()
	return
	fn-bea:inlinedXML(concat("<acc",$id,">",$v/struct/member[name="accumulatorValue"]/value/i4/text(),";",substring($v/struct/member[name="accumulatorStartDate"]/value/dateTime.iso8601/text(),1,8),";",substring($v/struct/member[name="accumulatorEndDate"]/value/dateTime.iso8601/text(),1,8),"</acc",$id,">"))
}
</get:GetAccumulatorResponse>