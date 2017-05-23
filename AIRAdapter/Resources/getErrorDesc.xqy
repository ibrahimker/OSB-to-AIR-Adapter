xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)
(:Author Ibam:)

module namespace local="http://www.w3.org/2005/xquery-local-functions";

declare function local:getErrorDesc($bestatus as xs:string) as xs:string
{
	(:Error Code DB is list of error, minify results from file errorCodeInformation.xml. Should you have to update the error code, just update file errorCodeInformation.xml, minify it using online minifier tools, then copy the results to this variable:)
	let $errorCodeDB := <errorCodeInformation><row><backEndStatus>0</backEndStatus><backEndDescription>Success</backEndDescription><frontEndStatus>0</frontEndStatus></row><row><backEndStatus>1</backEndStatus><backEndDescription>OK but supervision period exceeded</backEndDescription><frontEndStatus>0</frontEndStatus></row><row><backEndStatus>2</backEndStatus><backEndDescription>OK but service fee exceeded</backEndDescription><frontEndStatus>0</frontEndStatus></row><row><backEndStatus>100</backEndStatus><backEndDescription>Other Error</backEndDescription><frontEndStatus>6</frontEndStatus></row><row><backEndStatus>1000</backEndStatus><backEndDescription>Illegal request message</backEndDescription><frontEndStatus>1</frontEndStatus></row><row><backEndStatus>1001</backEndStatus><backEndDescription>Mandatory field missing</backEndDescription><frontEndStatus>1</frontEndStatus></row><row><backEndStatus>1002</backEndStatus><backEndDescription>Illegal data type</backEndDescription><frontEndStatus>1</frontEndStatus></row><row><backEndStatus>1003</backEndStatus><backEndDescription>Data out of bounds</backEndDescription><frontEndStatus>1</frontEndStatus></row><row><backEndStatus>1004</backEndStatus><backEndDescription>Unknown operation</backEndDescription><frontEndStatus>1</frontEndStatus></row><row><backEndStatus>1005</backEndStatus><backEndDescription>Internal server error</backEndDescription><frontEndStatus>6</frontEndStatus></row><row><backEndStatus>1006</backEndStatus><backEndDescription>This fault code is reserved for future use</backEndDescription><frontEndStatus>6</frontEndStatus></row><row><backEndStatus>1007</backEndStatus><backEndDescription>Overload rejection</backEndDescription><frontEndStatus>6</frontEndStatus></row><row><backEndStatus>101</backEndStatus><backEndDescription>Not Used</backEndDescription><frontEndStatus>5</frontEndStatus></row><row><backEndStatus>102</backEndStatus><backEndDescription>Subscriber Not Found</backEndDescription><frontEndStatus>2</frontEndStatus></row><row><backEndStatus>103</backEndStatus><backEndDescription>Account barred from refill</backEndDescription><frontEndStatus>2</frontEndStatus></row><row><backEndStatus>104</backEndStatus><backEndDescription>Temporary Blocked</backEndDescription><frontEndStatus>2</frontEndStatus></row><row><backEndStatus>105</backEndStatus><backEndDescription>Dedicated Account Not Allowed</backEndDescription><frontEndStatus>1</frontEndStatus></row><row><backEndStatus>106</backEndStatus><backEndDescription>Dedicated Account Negative</backEndDescription><frontEndStatus>4</frontEndStatus></row><row><backEndStatus>107</backEndStatus><backEndDescription>Voucher status used by same</backEndDescription><frontEndStatus>4</frontEndStatus></row><row><backEndStatus>108</backEndStatus><backEndDescription>Voucher status used by different</backEndDescription><frontEndStatus>4</frontEndStatus></row><row><backEndStatus>109</backEndStatus><backEndDescription>Voucher status unavailable</backEndDescription><frontEndStatus>4</frontEndStatus></row><row><backEndStatus>110</backEndStatus><backEndDescription>Voucher status expired</backEndDescription><frontEndStatus>4</frontEndStatus></row><row><backEndStatus>111</backEndStatus><backEndDescription>Voucher status stolen or missing</backEndDescription><frontEndStatus>4</frontEndStatus></row><row><backEndStatus>112</backEndStatus><backEndDescription>Voucher status damaged</backEndDescription><frontEndStatus>4</frontEndStatus></row><row><backEndStatus>113</backEndStatus><backEndDescription>Voucher status pending</backEndDescription><frontEndStatus>4</frontEndStatus></row><row><backEndStatus>114</backEndStatus><backEndDescription>Voucher type not accepted</backEndDescription><frontEndStatus>4</frontEndStatus></row><row><backEndStatus>115</backEndStatus><backEndDescription>Refill not accepted</backEndDescription><frontEndStatus>4</frontEndStatus></row><row><backEndStatus>117</backEndStatus><backEndDescription>Service class change not allowed</backEndDescription><frontEndStatus>4</frontEndStatus></row><row><backEndStatus>119</backEndStatus><backEndDescription>Invalid voucher activation code</backEndDescription><frontEndStatus>1</frontEndStatus></row><row><backEndStatus>120</backEndStatus><backEndDescription>Invalid refill profile</backEndDescription><frontEndStatus>1</frontEndStatus></row><row><backEndStatus>121</backEndStatus><backEndDescription>Supervision period too long</backEndDescription><frontEndStatus>4</frontEndStatus></row><row><backEndStatus>122</backEndStatus><backEndDescription>Service fee period too long</backEndDescription><frontEndStatus>4</frontEndStatus></row><row><backEndStatus>123</backEndStatus><backEndDescription>Max credit limit exceeded</backEndDescription><frontEndStatus>9</frontEndStatus></row><row><backEndStatus>124</backEndStatus><backEndDescription>Below minimum balance</backEndDescription><frontEndStatus>4</frontEndStatus></row><row><backEndStatus>125</backEndStatus><backEndDescription>System Unavailable</backEndDescription><frontEndStatus>6</frontEndStatus></row><row><backEndStatus>126</backEndStatus><backEndDescription>Account not active</backEndDescription><frontEndStatus>4</frontEndStatus></row><row><backEndStatus>127</backEndStatus><backEndDescription>Accumulator not available</backEndDescription><frontEndStatus>1</frontEndStatus></row><row><backEndStatus>128</backEndStatus><backEndDescription>Invalid PIN code</backEndDescription><frontEndStatus>4</frontEndStatus></row><row><backEndStatus>129</backEndStatus><backEndDescription>Faf number does not exist</backEndDescription><frontEndStatus>1</frontEndStatus></row><row><backEndStatus>130</backEndStatus><backEndDescription>Faf number not allowed</backEndDescription><frontEndStatus>1</frontEndStatus></row><row><backEndStatus>133</backEndStatus><backEndDescription>Service class list empty</backEndDescription><frontEndStatus>1</frontEndStatus></row><row><backEndStatus>134</backEndStatus><backEndDescription>Accumulator overflow</backEndDescription><frontEndStatus>1</frontEndStatus></row><row><backEndStatus>135</backEndStatus><backEndDescription>Accumulator underflow</backEndDescription><frontEndStatus>1</frontEndStatus></row><row><backEndStatus>136</backEndStatus><backEndDescription>Date adjustment error</backEndDescription><frontEndStatus>1</frontEndStatus></row><row><backEndStatus>137</backEndStatus><backEndDescription>Get balance and date not allowed</backEndDescription><frontEndStatus>1</frontEndStatus></row><row><backEndStatus>138</backEndStatus><backEndDescription>No PIN code registered</backEndDescription><frontEndStatus>7</frontEndStatus></row><row><backEndStatus>139</backEndStatus><backEndDescription>Dedicated account not defined</backEndDescription><frontEndStatus>7</frontEndStatus></row><row><backEndStatus>140</backEndStatus><backEndDescription>Invalid old Service Class</backEndDescription><frontEndStatus>7</frontEndStatus></row><row><backEndStatus>141</backEndStatus><backEndDescription>Invalid language</backEndDescription><frontEndStatus>7</frontEndStatus></row><row><backEndStatus>142</backEndStatus><backEndDescription>Subscriber already installed</backEndDescription><frontEndStatus>7</frontEndStatus></row><row><backEndStatus>143</backEndStatus><backEndDescription>Invalid master subscriber</backEndDescription><frontEndStatus>7</frontEndStatus></row><row><backEndStatus>144</backEndStatus><backEndDescription>Subscriber already activated</backEndDescription><frontEndStatus>7</frontEndStatus></row><row><backEndStatus>145</backEndStatus><backEndDescription>Already linked subordinate</backEndDescription><frontEndStatus>7</frontEndStatus></row><row><backEndStatus>146</backEndStatus><backEndDescription>Already linked as master</backEndDescription><frontEndStatus>7</frontEndStatus></row><row><backEndStatus>147</backEndStatus><backEndDescription>Invalid old community list</backEndDescription><frontEndStatus>7</frontEndStatus></row><row><backEndStatus>148</backEndStatus><backEndDescription>Invalid new community list</backEndDescription><frontEndStatus>7</frontEndStatus></row><row><backEndStatus>149</backEndStatus><backEndDescription>Invalid promotion plan end date</backEndDescription><frontEndStatus>7</frontEndStatus></row><row><backEndStatus>150</backEndStatus><backEndDescription>Invalid promotion plan</backEndDescription><frontEndStatus>7</frontEndStatus></row><row><backEndStatus>151</backEndStatus><backEndDescription>Promotion plan not found</backEndDescription><frontEndStatus>7</frontEndStatus></row><row><backEndStatus>152</backEndStatus><backEndDescription>Deblocking of expired account</backEndDescription><frontEndStatus>7</frontEndStatus></row><row><backEndStatus>153</backEndStatus><backEndDescription>Dedicated account max credit</backEndDescription><frontEndStatus>7</frontEndStatus></row><row><backEndStatus>154</backEndStatus><backEndDescription>Invalid old SC date</backEndDescription><frontEndStatus>7</frontEndStatus></row><row><backEndStatus>155</backEndStatus><backEndDescription>Invalid new service class</backEndDescription><frontEndStatus>7</frontEndStatus></row><row><backEndStatus>156</backEndStatus><backEndDescription>Delete subscriber failed due to for example references to consumers exist at the provider</backEndDescription><frontEndStatus>7</frontEndStatus></row><row><backEndStatus>157</backEndStatus><backEndDescription>Invalid account home region</backEndDescription><frontEndStatus>7</frontEndStatus></row><row><backEndStatus>158</backEndStatus><backEndDescription>Not used</backEndDescription><frontEndStatus>7</frontEndStatus></row><row><backEndStatus>159</backEndStatus><backEndDescription>Charged FaF not active for</backEndDescription><frontEndStatus>7</frontEndStatus></row><row><backEndStatus>160</backEndStatus><backEndDescription>Operation not allowed from current location</backEndDescription><frontEndStatus>7</frontEndStatus></row><row><backEndStatus>161</backEndStatus><backEndDescription>Failed to get location information</backEndDescription><frontEndStatus>7</frontEndStatus></row><row><backEndStatus>163</backEndStatus><backEndDescription>Invalid dedicated account period</backEndDescription><frontEndStatus>7</frontEndStatus></row><row><backEndStatus>164</backEndStatus><backEndDescription>Invalid dedicated account start date</backEndDescription><frontEndStatus>7</frontEndStatus></row><row><backEndStatus>165</backEndStatus><backEndDescription>Offer not found</backEndDescription><frontEndStatus>7</frontEndStatus></row><row><backEndStatus>167</backEndStatus><backEndDescription>Invalid unit type</backEndDescription><frontEndStatus>7</frontEndStatus></row><row><backEndStatus>176</backEndStatus><backEndDescription>Refill denied First IVR call not made</backEndDescription><frontEndStatus>7</frontEndStatus></row><row><backEndStatus>177</backEndStatus><backEndDescription>Refill denied Account not active</backEndDescription><frontEndStatus>7</frontEndStatus></row><row><backEndStatus>178</backEndStatus><backEndDescription>Refill denied Service fee period expired</backEndDescription><frontEndStatus>7</frontEndStatus></row><row><backEndStatus>179</backEndStatus><backEndDescription>Refill denied Supervision period expired</backEndDescription><frontEndStatus>7</frontEndStatus></row><row><backEndStatus>190</backEndStatus><backEndDescription>The PAM service id provided in the request already exist</backEndDescription><frontEndStatus>7</frontEndStatus></row><row><backEndStatus>191</backEndStatus><backEndDescription>The PAM service id provided in the request was out of range or did not exist</backEndDescription><frontEndStatus>7</frontEndStatus></row><row><backEndStatus>192</backEndStatus><backEndDescription>The old PAM class id provided in the request was incorrect or did not match the existing PAM class id for the account</backEndDescription><frontEndStatus>7</frontEndStatus></row><row><backEndStatus>193</backEndStatus><backEndDescription>The PAM class id or new PAM class id provided in the request was incorrect</backEndDescription><frontEndStatus>7</frontEndStatus></row><row><backEndStatus>194</backEndStatus><backEndDescription>The old schedule id provided in the request was incorrect or did not match the existing schedule id for the account</backEndDescription><frontEndStatus>7</frontEndStatus></row><row><backEndStatus>195</backEndStatus><backEndDescription>The schedule id or new schedule id provided in the request was incorrect</backEndDescription><frontEndStatus>7</frontEndStatus></row><row><backEndStatus>196</backEndStatus><backEndDescription>Invalid deferred to date</backEndDescription><frontEndStatus>7</frontEndStatus></row><row><backEndStatus>197</backEndStatus><backEndDescription>Periodic account management evaluation failed</backEndDescription><frontEndStatus>7</frontEndStatus></row><row><backEndStatus>198</backEndStatus><backEndDescription>Too many PAM services given in the sequence or the number of services on the account would be exceeded</backEndDescription><frontEndStatus>7</frontEndStatus></row><row><backEndStatus>199</backEndStatus><backEndDescription>The PAM period provided or calculated could not be found in the schedule</backEndDescription><frontEndStatus>7</frontEndStatus></row><row><backEndStatus>2</backEndStatus><backEndDescription>OK but service period exceeded</backEndDescription><frontEndStatus>6</frontEndStatus></row><row><backEndStatus>200</backEndStatus><backEndDescription>The PAM class id or new PAM class id provided in the request does not exist</backEndDescription><frontEndStatus>5</frontEndStatus></row><row><backEndStatus>201</backEndStatus><backEndDescription>The schedule id or new schedule id provided in the request did not exist or no valid period found</backEndDescription><frontEndStatus>7</frontEndStatus></row><row><backEndStatus>202</backEndStatus><backEndDescription>Invalid PAM Indicator</backEndDescription><frontEndStatus>7</frontEndStatus></row><row><backEndStatus>203</backEndStatus><backEndDescription>Subscriber installed but marked for deletion</backEndDescription><frontEndStatus>7</frontEndStatus></row><row><backEndStatus>204</backEndStatus><backEndDescription>Inconsistency between given current value and Account Database state</backEndDescription><frontEndStatus>7</frontEndStatus></row><row><backEndStatus>205</backEndStatus><backEndDescription>Max number of FaF indicators exceeded</backEndDescription><frontEndStatus>7</frontEndStatus></row><row><backEndStatus>206</backEndStatus><backEndDescription>FaF indicator already exists</backEndDescription><frontEndStatus>7</frontEndStatus></row><row><backEndStatus>207</backEndStatus><backEndDescription>Invalid accumulator end date</backEndDescription><frontEndStatus>7</frontEndStatus></row><row><backEndStatus>208</backEndStatus><backEndDescription>Invalid accumulator service class</backEndDescription><frontEndStatus>7</frontEndStatus></row><row><backEndStatus>209</backEndStatus><backEndDescription>Invalid dedicated account expiry date</backEndDescription><frontEndStatus>7</frontEndStatus></row><row><backEndStatus>210</backEndStatus><backEndDescription>Invalid dedicated account service class</backEndDescription><frontEndStatus>7</frontEndStatus></row><row><backEndStatus>211</backEndStatus><backEndDescription>Delete dedicated account failed</backEndDescription><frontEndStatus>7</frontEndStatus></row><row><backEndStatus>212</backEndStatus><backEndDescription>Crop of composite dedicated account not allowed</backEndDescription><frontEndStatus>7</frontEndStatus></row><row><backEndStatus>213</backEndStatus><backEndDescription>Sub dedicated account not defined</backEndDescription><frontEndStatus>7</frontEndStatus></row><row><backEndStatus>214</backEndStatus><backEndDescription>One or several of the provided offers are not defined or there is a mismatch between provided offer type and the offer type definition</backEndDescription><frontEndStatus>7</frontEndStatus></row><row><backEndStatus>215</backEndStatus><backEndDescription>Too many offers of the type Multi User Identification given in the sequence or the Multi User Identification offer is already activated for the subscriber</backEndDescription><frontEndStatus>7</frontEndStatus></row><row><backEndStatus>216</backEndStatus><backEndDescription>Usage threshold not found in definition</backEndDescription><frontEndStatus>7</frontEndStatus></row><row><backEndStatus>217</backEndStatus><backEndDescription>Usage counter not found in definition</backEndDescription><frontEndStatus>7</frontEndStatus></row><row><backEndStatus>218</backEndStatus><backEndDescription>The usage threshold does not exist on the account</backEndDescription><frontEndStatus>7</frontEndStatus></row><row><backEndStatus>219</backEndStatus><backEndDescription>Usage counter value out of bounds</backEndDescription><frontEndStatus>7</frontEndStatus></row><row><backEndStatus>220</backEndStatus><backEndDescription>The supplied value type does not match the definition</backEndDescription><frontEndStatus>7</frontEndStatus></row><row><backEndStatus>221</backEndStatus><backEndDescription>No subordinate subscriber connected to the account</backEndDescription><frontEndStatus>7</frontEndStatus></row><row><backEndStatus>222</backEndStatus><backEndDescription>Dedicated account can not be deleted because of it is in use</backEndDescription><frontEndStatus>7</frontEndStatus></row><row><backEndStatus>223</backEndStatus><backEndDescription>Service failed because new offer date provided in the request was incorrect</backEndDescription><frontEndStatus>7</frontEndStatus></row><row><backEndStatus>224</backEndStatus><backEndDescription>The old offer date provided in the request did not match the current date</backEndDescription><frontEndStatus>7</frontEndStatus></row><row><backEndStatus>225</backEndStatus><backEndDescription>The offer start date can not be changed because the offer is already active</backEndDescription><frontEndStatus>7</frontEndStatus></row><row><backEndStatus>226</backEndStatus><backEndDescription>Invalid PAM Period Relative Dates Start PAM Period Indicator</backEndDescription><frontEndStatus>7</frontEndStatus></row><row><backEndStatus>227</backEndStatus><backEndDescription>Invalid PAM Period Relative Dates Expiry PAM Period Indicator</backEndDescription><frontEndStatus>7</frontEndStatus></row><row><backEndStatus>230</backEndStatus><backEndDescription>Not allowed to convert to other type of lifetime</backEndDescription><frontEndStatus>7</frontEndStatus></row><row><backEndStatus>232</backEndStatus><backEndDescription>Not allowed to delete PAM service ID in use. The PAM Service ID is used by an Offer DA or sub-DA's Relative Dates.</backEndDescription><frontEndStatus>7</frontEndStatus></row><row><backEndStatus>233</backEndStatus><backEndDescription>Invalid PAM Service Priority</backEndDescription><frontEndStatus>7</frontEndStatus></row><row><backEndStatus>234</backEndStatus><backEndDescription>Old PAM service priority provided in the request was incorrect or did not match the existing PAM service priority for the account</backEndDescription><frontEndStatus>7</frontEndStatus></row><row><backEndStatus>235</backEndStatus><backEndDescription>Not allowed to connect the PAM Class to the PAM Service. The account already has a bill cycle service. Only one bill cycle per account is allowed</backEndDescription><frontEndStatus>7</frontEndStatus></row><row><backEndStatus>236</backEndStatus><backEndDescription>PAM Service Priority is already used for some other PAM service</backEndDescription><frontEndStatus>7</frontEndStatus></row><row><backEndStatus>237</backEndStatus><backEndDescription>Not allowed to add a Provider ID to another offer type than provider account offer</backEndDescription><frontEndStatus>7</frontEndStatus></row><row><backEndStatus>238</backEndStatus><backEndDescription>Not allowed to create a provider account offer without providing a Provider ID</backEndDescription><frontEndStatus>7</frontEndStatus></row><row><backEndStatus>239</backEndStatus><backEndDescription>The request failed because the given time restriction does not exist</backEndDescription><frontEndStatus>7</frontEndStatus></row><row><backEndStatus>240</backEndStatus><backEndDescription>The request failed because the end time was before the start time</backEndDescription><frontEndStatus>7</frontEndStatus></row><row><backEndStatus>241</backEndStatus><backEndDescription>The timezone could not be found in the timezone mapping table</backEndDescription><frontEndStatus>7</frontEndStatus></row><row><backEndStatus>242</backEndStatus><backEndDescription>Discount not defined</backEndDescription><frontEndStatus>7</frontEndStatus></row><row><backEndStatus>243</backEndStatus><backEndDescription>Missing associated party ID for provider owned personal usage counter</backEndDescription><frontEndStatus>7</frontEndStatus></row><row><backEndStatus>244</backEndStatus><backEndDescription>Associated party ID not allowed for provider owned common usage counter</backEndDescription><frontEndStatus>7</frontEndStatus></row><row><backEndStatus>245</backEndStatus><backEndDescription>Provider owned common usage counter can not have personal usage threshold</backEndDescription><frontEndStatus>7</frontEndStatus></row><row><backEndStatus>246</backEndStatus><backEndDescription>The common usage threshold does not exist on the account</backEndDescription><frontEndStatus>7</frontEndStatus></row><row><backEndStatus>247</backEndStatus><backEndDescription>Product not found</backEndDescription><frontEndStatus>7</frontEndStatus></row><row><backEndStatus>248</backEndStatus><backEndDescription>Shared account offer is not allowed on a subordinate subscriber</backEndDescription><frontEndStatus>7</frontEndStatus></row><row><backEndStatus>249</backEndStatus><backEndDescription>The product id specified was invalid or a product id was expected but not supplied</backEndDescription><frontEndStatus>7</frontEndStatus></row><row><backEndStatus>250</backEndStatus><backEndDescription>Communication ID change failed Insufficient funds</backEndDescription><frontEndStatus>7</frontEndStatus></row><row><backEndStatus>251</backEndStatus><backEndDescription>Communication ID change failed. AIA/MSISDN mismatch</backEndDescription><frontEndStatus>7</frontEndStatus></row><row><backEndStatus>252</backEndStatus><backEndDescription>Communication ID change failed. Invalid combination of values</backEndDescription><frontEndStatus>7</frontEndStatus></row><row><backEndStatus>253</backEndStatus><backEndDescription>Communication ID change failed. Previous MSISDN Change pending</backEndDescription><frontEndStatus>7</frontEndStatus></row><row><backEndStatus>254</backEndStatus><backEndDescription>Communication ID change failed. New MSISDN not available</backEndDescription><frontEndStatus>7</frontEndStatus></row><row><backEndStatus>255</backEndStatus><backEndDescription>Operation not allowed on subordinate subscriber</backEndDescription><frontEndStatus>7</frontEndStatus></row><row><backEndStatus>256</backEndStatus><backEndDescription>Attribute name does not exist</backEndDescription><frontEndStatus>7</frontEndStatus></row><row><backEndStatus>257</backEndStatus><backEndDescription>Operation not allowed since End of Provisioning is set</backEndDescription><frontEndStatus>7</frontEndStatus></row><row><backEndStatus>258</backEndStatus><backEndDescription>Attribute value does not exist</backEndDescription><frontEndStatus>7</frontEndStatus></row><row><backEndStatus>259</backEndStatus><backEndDescription>Attribute value already exists</backEndDescription><frontEndStatus>7</frontEndStatus></row><row><backEndStatus>260</backEndStatus><backEndDescription>Capability not available</backEndDescription><frontEndStatus>7</frontEndStatus></row><row><backEndStatus>261</backEndStatus><backEndDescription>Invalid Capability combination</backEndDescription><frontEndStatus>7</frontEndStatus></row><row><backEndStatus>262</backEndStatus><backEndDescription>Attribute update action not allowed for this attribute</backEndDescription><frontEndStatus>7</frontEndStatus></row><row><backEndStatus>263</backEndStatus><backEndDescription>Attribute value is not possible to override for the subscriber</backEndDescription><frontEndStatus>7</frontEndStatus></row><row><backEndStatus>264</backEndStatus><backEndDescription>The result of the operation would be a nominal value that is out of bounds</backEndDescription><frontEndStatus>7</frontEndStatus></row><row><backEndStatus>265</backEndStatus><backEndDescription>Too many Usage Accumulators</backEndDescription><frontEndStatus>7</frontEndStatus></row><row><backEndStatus>266</backEndStatus><backEndDescription>Permission denied</backEndDescription><frontEndStatus>7</frontEndStatus></row><row><backEndStatus>267</backEndStatus><backEndDescription>Backdate to time out of range</backEndDescription><frontEndStatus>7</frontEndStatus></row><row><backEndStatus>268</backEndStatus><backEndDescription>Backdate Update not allowed</backEndDescription><frontEndStatus>7</frontEndStatus></row><row><backEndStatus>269</backEndStatus><backEndDescription>Subscriber already marked for rerating</backEndDescription><frontEndStatus>7</frontEndStatus></row><row><backEndStatus>270</backEndStatus><backEndDescription>Subscriber already unmarked for rerating</backEndDescription><frontEndStatus>7</frontEndStatus></row><row><backEndStatus>271</backEndStatus><backEndDescription>Snapshot not found</backEndDescription><frontEndStatus>7</frontEndStatus></row><row><backEndStatus>272</backEndStatus><backEndDescription>Unable to apply snapshot</backEndDescription><frontEndStatus>7</frontEndStatus></row><row><backEndStatus>273</backEndStatus><backEndDescription>Operation not allowed on subscriber marked for rerating</backEndDescription><frontEndStatus>7</frontEndStatus></row><row><backEndStatus>274</backEndStatus><backEndDescription>Invalid external Product Id in request</backEndDescription><frontEndStatus>7</frontEndStatus></row><row><backEndStatus>275</backEndStatus><backEndDescription>Multiple providers not allowed a consumer connected to a local provider may only have one provider offer</backEndDescription><frontEndStatus>7</frontEndStatus></row><row><backEndStatus>276</backEndStatus><backEndDescription>The local provider specified with the provider offer does not exist</backEndDescription><frontEndStatus>7</frontEndStatus></row><row><backEndStatus>277</backEndStatus><backEndDescription>The consumer configuration is not compatible with the consistent local provider</backEndDescription><frontEndStatus>7</frontEndStatus></row><row><backEndStatus>278</backEndStatus><backEndDescription>The operation is not allowed for a consumer connected to a local provider</backEndDescription><frontEndStatus>7</frontEndStatus></row><row><backEndStatus>279</backEndStatus><backEndDescription>The operation is not allowed for a local provider</backEndDescription><frontEndStatus>7</frontEndStatus></row><row><backEndStatus>280</backEndStatus><backEndDescription>The provided rerating session data does not match an ongoing rerating session</backEndDescription><frontEndStatus>7</frontEndStatus></row><row><backEndStatus>281</backEndStatus><backEndDescription>Not allowed for multi user account</backEndDescription><frontEndStatus>7</frontEndStatus></row><row><backEndStatus>282</backEndStatus><backEndDescription>Destination SDP ID does not exist in AF</backEndDescription><frontEndStatus>7</frontEndStatus></row><row><backEndStatus>283</backEndStatus><backEndDescription>Target subscriber ID does not exist in AF</backEndDescription><frontEndStatus>7</frontEndStatus></row><row><backEndStatus>284</backEndStatus><backEndDescription>Transfer failed. Possible inconsistency in system</backEndDescription><frontEndStatus>7</frontEndStatus></row><row><backEndStatus>285</backEndStatus><backEndDescription>AF update failure. Possible inconsistency in system</backEndDescription><frontEndStatus>7</frontEndStatus></row><row><backEndStatus>286</backEndStatus><backEndDescription>Incompatible SDP versions. Subscriber still in origin SDP</backEndDescription><frontEndStatus>7</frontEndStatus></row><row><backEndStatus>287</backEndStatus><backEndDescription>No transfer done. Subscriber still in origin SDP</backEndDescription><frontEndStatus>7</frontEndStatus></row><row><backEndStatus>288</backEndStatus><backEndDescription>Tree parameter name does not exist</backEndDescription><frontEndStatus>7</frontEndStatus></row><row><backEndStatus>289</backEndStatus><backEndDescription>Tree parameter value has wrong format</backEndDescription><frontEndStatus>7</frontEndStatus></row><row><backEndStatus>290</backEndStatus><backEndDescription>Service provider (= tree type) does not exist</backEndDescription><frontEndStatus>7</frontEndStatus></row><row><backEndStatus>291</backEndStatus><backEndDescription>The destination SDP is not found</backEndDescription><frontEndStatus>7</frontEndStatus></row><row><backEndStatus>292</backEndStatus><backEndDescription>The subscriber is of a type not allowed to be transferred</backEndDescription><frontEndStatus>7</frontEndStatus></row><row><backEndStatus>293</backEndStatus><backEndDescription>Subscriber move failed subscription is blocked and redirection must be removed manually</backEndDescription><frontEndStatus>7</frontEndStatus></row><row><backEndStatus>294</backEndStatus><backEndDescription>Cancel redirect failed because the subscription was not in redirection mode</backEndDescription><frontEndStatus>7</frontEndStatus></row><row><backEndStatus>295</backEndStatus><backEndDescription>Subscription Move failed prohibited destination as subscription already exists in redirect mode</backEndDescription><frontEndStatus>7</frontEndStatus></row><row><backEndStatus>296</backEndStatus><backEndDescription>Tree parameter update action not allowed for this tree parameter</backEndDescription><frontEndStatus>7</frontEndStatus></row><row><backEndStatus>297</backEndStatus><backEndDescription>Maximum limit of offers exceeded during Installation of subscriber</backEndDescription><frontEndStatus>7</frontEndStatus></row><row><backEndStatus>298</backEndStatus><backEndDescription>Failure to Delete Subscriber that had been successfully installed but should be deleted due to failure of offers</backEndDescription><frontEndStatus>7</frontEndStatus></row><row><backEndStatus>299</backEndStatus><backEndDescription>Failure to Install Subscriber</backEndDescription><frontEndStatus>7</frontEndStatus></row><row><backEndStatus>3</backEndStatus><backEndDescription>Subscriber already on destination SDP</backEndDescription><frontEndStatus>1</frontEndStatus></row><row><backEndStatus>4</backEndStatus><backEndDescription>Subscriber move successful but subscriber may be in sleep mode</backEndDescription><frontEndStatus>1</frontEndStatus></row><row><backEndStatus>999</backEndStatus><backEndDescription>Other Error No Retry</backEndDescription><frontEndStatus>7</frontEndStatus></row><row><backEndStatus></backEndStatus></row></errorCodeInformation>
	let $fedesc := $errorCodeDB/row[backEndStatus=$bestatus]/backEndDescription/text()
	return $fedesc
};