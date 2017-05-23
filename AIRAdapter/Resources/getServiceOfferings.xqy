xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

module namespace local="http://www.w3.org/2005/xquery-local-functions";

declare function local:getServiceOfferings ($listId as xs:string,$listValue as xs:string,$i as xs:integer) as xs:string {
        if(xs:int(substring($listId,$i,1)) eq 1) then
	concat('<value>
	<struct>
	<member>
	<name>serviceOfferingID</name>
	<value>
	<i4>',32 - $i,'</i4>
	</value>
	</member>
	<member>
	<name>serviceOfferingActiveFlag</name>
	<value>
	<boolean>',xs:int(substring($listValue,$i,1)),'</boolean>
	</value>
	</member>
	</struct>
	</value>')
        else
        ''
};