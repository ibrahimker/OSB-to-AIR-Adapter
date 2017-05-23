xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

module namespace local="http://www.w3.org/2005/xquery-local-functions";

declare function local:getOrderID ($msisdn as xs:string, $currdatetime as xs:string) as xs:string {   
    concat(substring($msisdn,3,11),replace(substring($currdatetime,12,8),':',''),substring($currdatetime,21,3))
};