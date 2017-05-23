xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

module namespace local="http://www.w3.org/2005/xquery-local-functions";

declare function local:decimalToBinary ($d as xs:integer) as xs:string {   
    if ($d > 0)
    then concat(local:decimalToBinary(xs:integer(floor($d div 2))),xs:integer($d mod 2))
    else ""
};