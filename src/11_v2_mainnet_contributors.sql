CREATE TEMP FUNCTION
    PARSE_V1_CREATE_LOG(data STRING, topics ARRAY<STRING>)
    RETURNS STRUCT<`wallet` STRING, `from` STRING, `to` STRING, `count` STRING>
    LANGUAGE js AS """
    const parsedEvent = {
  "anonymous": false,
  "inputs": [
    {
      "indexed": true,
      "internalType": "contract ShardedWallet",
      "name": "wallet",
      "type": "address"
    },
    {
      "indexed": true,
      "internalType": "address",
      "name": "from",
      "type": "address"
    },
    {
      "indexed": false,
      "internalType": "address",
      "name": "to",
      "type": "address"
    },
    {
      "indexed": false,
      "internalType": "uint256",
      "name": "count",
      "type": "uint256"
    }
  ],
  "name": "ShardsBought",
  "type": "event"
}
    return abi.decodeEvent(parsedEvent, data, topics, false);
"""
    OPTIONS
  ( library="https://storage.googleapis.com/ethlab-183014.appspot.com/ethjs-abi.js" );

CREATE TABLE v2_mainnet_contributors as (
  SELECT
      PARSE_V1_CREATE_LOG(logs.data, logs.topics).wallet as shardedWallet,
      PARSE_V1_CREATE_LOG(logs.data, logs.topics).from as fromAddress,
      PARSE_V1_CREATE_LOG(logs.data, logs.topics).to as toAddress,
      PARSE_V1_CREATE_LOG(logs.data, logs.topics).count as amount,
  FROM `bigquery-public-data.crypto_ethereum.logs` AS logs
  WHERE address = lower('0xa65803AD604668E26a81bE92C9F1c90354255eaE')
  AND topics[SAFE_OFFSET(0)] = '0x238e3bccfa0594503e6ecfa4f8595fd564903445338b3e088888ad8d05049076'
  AND block_number < 12361638
);
