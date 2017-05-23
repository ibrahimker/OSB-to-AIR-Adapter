xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

module namespace local="http://www.w3.org/2005/xquery-local-functions";

declare function local:normaliseDAValue($davalue as xs:integer , $unittype as xs:integer ) as xs:integer
{
    if($unittype = 1) then
    let $results := $davalue div 100
    return xs:integer(floor($results))
    else
    let $results := $davalue
    return xs:integer($results)
};