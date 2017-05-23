xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

module namespace local="http://www.w3.org/2005/xquery-local-functions";

declare function local:normaliseDAValueAdjustment($davalue as xs:string , $unittype as xs:integer ) as xs:string
{
    if($unittype = 1) then
    let $results := concat($davalue,"00")
    return xs:string($results)
    else
    let $results := $davalue
    return xs:string($results)
};