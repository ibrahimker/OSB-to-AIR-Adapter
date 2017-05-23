<get:GetActDateResponse xmlns:get="http://www.example.org/GetActDate/">
<tid>{$transID}</tid>
<status>{$festatus}</status>
<description>{$fedesc}</description>
<activeDate>{substring($body/methodResponse/params/param/value/struct/member[name="activationDate"]/value/dateTime.iso8601/text(),1,8)}</activeDate>
</get:GetActDateResponse>