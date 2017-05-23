xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

module namespace local="http://www.w3.org/2005/xquery-local-functions";

declare function local:formatDateTime ($currdate as xs:string) as xs:string {
  concat(replace(substring($currdate,0,11),'-',''),substring($currdate,11,9),"+0700")
};