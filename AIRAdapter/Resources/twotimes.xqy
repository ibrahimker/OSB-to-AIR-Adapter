xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

module namespace local="http://www.w3.org/2005/xquery-local-functions";

declare function local:two-to-the($n as xs:integer) as xs:integer {
  if ($n = 0) then 1 else 2 * local:two-to-the($n - 1)
};