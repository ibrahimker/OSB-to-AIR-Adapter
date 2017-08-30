<inc:INCheckCurrentSubsriptionProcessResponse xmlns:inc="http://xmlns.oracle.com/INCheckCurrentSubsription">
<inc:result>{$festatus}</inc:result>
<inc:description>{$fedesc}</inc:description>
<inc:FAFs>
{
	let $a := $body/methodResponse/params/param/value/struct/member[name="fafInformationList"]/value/array/data/value
	for $v at $pos in $a
	return
	if($pos eq count($a)) then
	$v/struct/member[name="fafNumber"]/value/string/text()
	else concat($v/struct/member[name="fafNumber"]/value/string/text(),';')
}
</inc:FAFs>
</inc:INCheckCurrentSubsriptionProcessResponse>