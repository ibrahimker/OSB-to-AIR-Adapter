<com:CommunityCheckProcessResponse xmlns:com="http://xmlns.oracle.com/CommunityCheck">
	<com:result>{$festatus}</com:result>
	<description>{$fedesc}</description>
	<com:communityID>
		{
		let $a := $body/methodResponse/params/param/value/struct/member[name="communityInformationCurrent"]/value/array/data/value
		for $v at $pos in $a
		return
		if($pos eq count($a)) then
		$v/struct/member[name="communityID"]/value/i4/text()
		else concat($v/struct/member[name="communityID"]/value/i4/text(),';')
		}
	</com:communityID>
</com:CommunityCheckProcessResponse>