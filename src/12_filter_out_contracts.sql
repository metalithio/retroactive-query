SELECT * FROM `bigquery-public-data.crypto_ethereum.contracts` 
WHERE address = lower('0x8ae09173e4dff3f63d1c287d19f4a197977cb425')
LIMIT 1000