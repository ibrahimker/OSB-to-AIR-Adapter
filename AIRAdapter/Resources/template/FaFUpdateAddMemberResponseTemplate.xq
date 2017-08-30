<fns:addFnSMemberResponse xmlns:fns="http://www.example.org/FnSAction/">
<result>{$festatus}</result>
<description>{$fedesc}</description>
<notAllowedDescription>
{
	if(exists($body/methodResponse/params/param/value/struct/member[name="notAllowedReason"]/value/i4/text())) then
	let $notAllowedStatus := $body/methodResponse/params/param/value/struct/member[name="notAllowedReason"]/value/i4/text()
	return
	if($notAllowedStatus eq '1') then
	let $response := 'Wrong number format'
	return $response
	else if($notAllowedStatus eq '2') then
	let $response:= 'Wrong number of digits'
	return $response
	else if($notAllowedStatus eq '3') then
	let $response := 'Number part of black list'
	return $response
	else if($notAllowedStatus eq '4') then
	let $response := 'Too many changes already performed for this period'
	return $response
	else if($notAllowedStatus eq '5') then
	let $response := 'On total maximum of allowed FaF numbers'
	return $response
	else if($notAllowedStatus eq '6') then
	let $response := 'On maximum of allowed FaF numbers for this number type'
	return $response
	else if($notAllowedStatus eq '7') then
	let $response := 'FaF number already exist'
	return $response
	else if($notAllowedStatus eq '8') then
	let $response := 'Service Class change not allowed'
	return $response
	else if($notAllowedStatus eq '9') then
	let $response := 'Offer for FaF number not allowed in destination Service Class'
	return $response
	else if($notAllowedStatus eq '10') then
	let $response := 'FaF indicator not allowed in Service Class'
	return $response
	else
	let $response := ''
	return $response
	else
	''
}
</notAllowedDescription>
</fns:addFnSMemberResponse>