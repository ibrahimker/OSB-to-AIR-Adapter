xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

module namespace local="http://www.w3.org/2005/xquery-local-functions";

declare function local:repeat-string ( $stringToRepeat as xs:string , $count as xs:integer )  as xs:string {
	string-join((for $i in 1 to $count return $stringToRepeat),
		'')
} ;