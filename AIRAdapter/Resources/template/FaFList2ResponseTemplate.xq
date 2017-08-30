<List>
{
let $a := $body/methodResponse/params/param/value/struct/member[name="fafInformationList"]/value/array/data/value
for $v in $a
return
<Member>
<ID>{$v/struct/member[name="fafIndicator"]/value/i4/text()}</ID>
<Msisdn>{$v/struct/member[name="fafNumber"]/value/string/text()}</Msisdn>
</Member>
}
</List>

<inc:INCheckCurrentSubsription2ProcessResponse xmlns:inc="http://xmlns.oracle.com/INCheckCurrentSubsription2">
<inc:result>{$festatus}</inc:result>
<inc:description>{$fedesc}</inc:description>
<inc:FAFs>
{
for $d in distinct-values($list//ID) return
<inc:Group>
<inc:ID>{$d}</inc:ID>
<inc:Members>
{ for $v in $list//Member[ID = $d] return
<inc:Msisdn>{$v/Msisdn/text()}</inc:Msisdn>
}
</inc:Members>
</inc:Group>
}
</inc:FAFs>
</inc:INCheckCurrentSubsription2ProcessResponse>