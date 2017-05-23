<get:GetAccumulatorByIdResponse xmlns:get="http://www.example.org/GetAccumulatorById/">
	<status>{$festatus}</status>
	<description>{$fedesc}</description>
	<acc>{$body/methodResponse/params/param/value/struct/member[name="accumulatorInformation"]/value/array/data/value/struct/member[name="accumulatorValue"]/value/i4/text()};{substring($body/methodResponse/params/param/value/struct/member[name="accumulatorInformation"]/value/array/data/value/struct/member[name="accumulatorStartDate"]/value/dateTime.iso8601/text(),1,8)};{substring($body/methodResponse/params/param/value/struct/member[name="accumulatorInformation"]/value/array/data/value/struct/member[name="accumulatorEndDate"]/value/dateTime.iso8601/text(),1,8)}</acc>
</get:GetAccumulatorByIdResponse>