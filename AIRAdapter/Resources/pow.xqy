xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

module namespace local="http://www.w3.org/2005/xquery-local-functions";

declare function local:pow($x as xs:double , $n as xs:integer ) as xs:double
{
  if($n eq 0)
   then 1
   else
    (let $h := $n idiv 2,
         $halfResult := local:pow($x, $h)
      return
            if($n mod 2 eq 0)
              then $halfResult * $halfResult
              else $x * $halfResult * $halfResult
        )

};