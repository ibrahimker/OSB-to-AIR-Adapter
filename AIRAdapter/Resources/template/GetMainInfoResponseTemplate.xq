<get:GetINMainInfoResponse xmlns:get="http://www.example.org/GetINMainInfo/">
<status>{$festatus}</status>
<description>{$fedesc}</description>
<maBalance>{xs:int(floor($body/methodResponse/params/param/value/struct/member[name="accountValue1"]/value/string/text() div 100))}</maBalance>
<expiredDate>{substring($body/methodResponse/params/param/value/struct/member[name="supervisionExpiryDate"]/value/dateTime.iso8601/text(),1,8)}</expiredDate>
<terminateDate>{substring($body/methodResponse/params/param/value/struct/member[name="serviceFeeExpiryDate"]/value/dateTime.iso8601/text(),1,8)}</terminateDate>
<serviceClass>{$body/methodResponse/params/param/value/struct/member[name="serviceClassCurrent"]/value/i4/text()}</serviceClass>
</get:GetINMainInfoResponse>