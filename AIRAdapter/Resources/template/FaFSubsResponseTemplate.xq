<inf:INFafSubsProcessResponse xmlns:inf="http://xmlns.oracle.com/INFafSubs">
<inf:result>{$festatus}</inf:result>
<inf:description>{$fedesc}</inf:description>
<inf:FAFs>
{
for $d in distinct-values($list//ID) return
<inf:Group>
<inf:ID>{$d}</inf:ID>
<inf:Members>
{ for $v in $list//Member[ID = $d] return
<inf:Msisdn>{$v/Msisdn/text()}</inf:Msisdn>
}
</inf:Members>
</inf:Group>
}
</inf:FAFs>
</inf:INFafSubsProcessResponse>
