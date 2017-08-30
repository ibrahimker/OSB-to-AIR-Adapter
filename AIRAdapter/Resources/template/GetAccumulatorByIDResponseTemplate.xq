<get:GetAccumulatorByIdResponse xmlns:get="http://www.example.org/GetAccumulatorById/">
	<status>{$festatus}</status>
	<description>{$fedesc}</description>
	<acc>
	{
	if($bestatus='127')
	then(fn:concat('0;',fn:substring(fn:replace(string(fn:current-dateTime()),'-',''),1,8),';99991231'))
	else(fn:concat($body/methodResponse/params/param/value/struct/member[name="accumulatorInformation"]/value/array/data/value/struct/member[name="accumulatorValue"]/value/i4/text(),';',substring($body/methodResponse/params/param/value/struct/member[name="accumulatorInformation"]/value/array/data/value/struct/member[name="accumulatorStartDate"]/value/dateTime.iso8601/text(),1,8),';',substring($body/methodResponse/params/param/value/struct/member[name="accumulatorInformation"]/value/array/data/value/struct/member[name="accumulatorEndDate"]/value/dateTime.iso8601/text(),1,8)))
	}
	</acc>
</get:GetAccumulatorByIdResponse>