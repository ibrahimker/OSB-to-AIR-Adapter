<get:GetUsageThresholdsAndCountersResponse xmlns:get="http://www.example.org/GetUsageThresholdsAndCounters/">
 <status>{$festatus}</status>
 <description>{$fedesc}</description>
 <usageThresholdsAndCounters>
 	{
	let $a := $body/methodResponse/params/param/value/struct/member[name="usageCounterUsageThresholdInformation"]/value/array/data/value
	for $v in $a
	let $usageCounterID := $v/struct/member[name="usageCounterID"]/value/i4/text()
	let $usageCounterValue := $v/struct/member[name="usageCounterValue"]/value/string/text()
	let $usageThresholdInformation := $v/struct/member[name="usageThresholdInformation"]/value/array/data/value
	let $usageThresholdID := $usageThresholdInformation/struct/member[name="usageThresholdID"]/value/i4/text()
	let $usageThresholdSource := $usageThresholdInformation/struct/member[name="usageThresholdSource"]/value/i4/text()
	let $usageThresholdValue := $usageThresholdInformation/struct/member[name="usageThresholdValue"]/value/string/text()
	return
	fn-bea:inlinedXML(concat("<usageThresholdAndCounter>",$usageCounterID,";",$usageCounterValue,";",";",";",$usageThresholdID,";",$usageThresholdValue,";",";",";",$usageThresholdSource,";","</usageThresholdAndCounter>"))
	}
 </usageThresholdsAndCounters>
</get:GetUsageThresholdsAndCountersResponse>









<usageThresholdsAndCounters>
<usageThresholdAndCounter>20235030;0;;;20235030;1024;;;1;</usageThresholdAndCounter>
</usageThresholdsAndCounters>
