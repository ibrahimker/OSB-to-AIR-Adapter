<NgsspTransactionDataRecord xmlns="http://indosatooredoo.com/ngssp/schemas/TransactionDataRecord">
<StartTimestamp>{$startreqbe}</StartTimestamp>
<EndTimestamp>{current-dateTime()}</EndTimestamp>
<TransactionId>{$transID}</TransactionId>
<OrderId>{$orderID}</OrderId>
<RequestType>REQ_BE</RequestType>
<CallingHostName>{$OSBHostname}</CallingHostName>
<CallingHostAddress>{$OSBIPAddress}</CallingHostAddress>
<ProcessingHostName>{$OSBHostname}</ProcessingHostName>
<ProcessingHostAddress>{$OSBIPAddress}</ProcessingHostAddress>
<ModuleName>Adapter</ModuleName>
<ServiceName>AIRAdapter</ServiceName>
<FlowName>GetAccumulator</FlowName>
<ChannelName></ChannelName>
<Command></Command>
<MSISDN>{$msisdn}</MSISDN>
<PackageCompositeKey></PackageCompositeKey>
<RequestMessage>{$body}</RequestMessage>
<ResponseMessage></ResponseMessage>
<StatusCode></StatusCode>
<StatusDescription></StatusDescription>
<BackendStatusCode></BackendStatusCode>
<BackendStatusDescription></BackendStatusDescription>
</NgsspTransactionDataRecord>