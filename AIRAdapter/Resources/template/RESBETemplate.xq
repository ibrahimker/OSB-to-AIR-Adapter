<NgsspTransactionDataRecord xmlns="http://indosatooredoo.com/ngssp/schemas/TransactionDataRecord">
<StartTimestamp>{$startresbe}</StartTimestamp>
<EndTimestamp>{current-dateTime()}</EndTimestamp>
<TransactionId>{$transID}</TransactionId>
<OrderId>{$orderID}</OrderId>
<RequestType>RES_BE</RequestType>
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
<RequestMessage></RequestMessage>
<ResponseMessage>{$body}</ResponseMessage>
<StatusCode>{$festatus}</StatusCode>
<StatusDescription>{$fedesc}</StatusDescription>
<BackendStatusCode>{$bestatus}</BackendStatusCode>
<BackendStatusDescription>{$bedesc}</BackendStatusDescription>
</NgsspTransactionDataRecord>