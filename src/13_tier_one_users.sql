create table tier_one_users as (
    with 
        to_addresses as (
        select to_address as address from `bigquery-public-data.crypto_ethereum.token_transfers`
        where token_address in ('0x1e95a0d39c3d98a926a77565108ad084f1e9df5c',
        '0x26ea1f595f6567b7050fbba24f6a66e19db4d560',
        '0xfd62dbde8dc9ee56438f2d31aa3d9b039920232a',
        '0x783e2dcfbf6f40c6943d9aded6113c7013c46c9b',
        '0xe2f7dbcd2241d740ee552b44e8083841f2117f1c',
        '0xb76ceeb17483d667c37fe2c9a60f27f024ffea7b',
        '0x64b6f7c5d0bffbf532e7f5a2713081890bada155',
        '0x93d70f6c48a8e4755b3afcef61520439b4970a4d',
        '0xd9703d45b87f717dbe29759f09af7ac2b6bde775',
        '0x25a3dcabbf0070cb8e5baaa62d576cf6643afb5b',
        '0x19767500db814a3545b0a8e356facfff2bfd831d',
        '0x4982e5c944a6aa5a6aa12e48bb5a4c0b70424080',
        '0xc5d80ffab995db90557f311b904e3b4faf2f6a13',
        '0xfb925821eef8dfabe2788b322f436088650551cc',
        '0xf03b128da734dc0d6a3a7884a70089807bdc6bc8',
        '0xa3a3f076413a362bb0d69eea1dc5b0e79c831edc',
        '0xf0d2a55c74cd01a3e4fe6becb374c0ea77ecbdbf',
        '0x5c29cee07983a390c37f3f068fa00374a998ea2d',
        '0xcce50fd7f41574adb8fa600055b74303111f2e40',
        '0xa69fcaaa3f5ae04e63a7fec7aff9277bc0bdf8b4',
        '0x1aff4291843a69ce54fb25c227641e2f01f43ff3',
        '0xcfb223d9de75f9f784699cf75222301e7da5de17',
        '0x56fc86263c9bd2c4182b54a99fba5047aa8bb472',
        '0x022fc29373beeccfb44fae92a23a3e74830c7103',
        '0x41523a22144f3d129dddf1e9a549333148d0c37d',
        '0x50eb346fc29a80d97563a50146c3fcf9423b5538',
        '0xf5262f7adfb55d24a73b093a5e8810e972795cf6',
        '0xc73b32352b13e540469378af9d8191a99ab1323f',
        '0xfe549bbace54d7e5f27625790d69f54691fd2da7',
        '0xfc141b9c6bcc6a6a0f2f2cdb84036316577b389f',
        '0xbbcdee12f16696f887a009b059561561d4479b45',
        '0x7d926c737da03462a3c8d7c8e798975cf50a933e',
        '0xc0f69fe66f9e593440bac1e6f013fb0496d96915',
        '0xd340bab0184d4d266c47d56751b0d4954087d6ed',
        '0x33b07738f34d7b46e4d4e74442a70020762cf8ae',
        '0xe018ce12dfcec3a8dcc94f4c1946e1dd7c6fe310',
        '0xe85a37e3fbcf9ec782f06477604de8c211b5c218',
        '0x93b5b55f6ceb9742c542291c0ccf6f6a62368bce',
        '0x71d0d05c9772803ccfd4f39ae0e61b35f2792c2f',
        '0x0b078bac82e277ed7b9cefb91935ef72dca6e0de',
        '0x3dfe49aad52c8f512981bbf8a077ebdc5115a131',
        '0x3bbffaa97cae3514eceebbcd9b5d3840ecf71301',
        '0x12419eea0b053ffea92f9afcd7986a495e2cf0dd',
        '0xc0bfeba72805f22dc18dde31467c5a55c16ff57b',
        '0x945086c55d8d11b61992653badd4edf939ab92e1',
        '0xa38c58e9b05ee4f22633ecaedc6f7692f1bdaf9e',
        '0xb892e6ba024c8ed5ab6feb1175ec059c4caf1f08',
        '0x22972f3900d6fd68dc8c35249936b16f21b0b836',
        '0x8b0b17424a99a01894c8e08a504d9815cb917cc9',
        '0x971e22a354fe026faf437dd283a21fd5bf57b4fa',
        '0x1b991b6a41bf3bbc5cbd3b60000f26a8ea9ff9e9',
        '0xd9ce78d7984eb2d50fcb2f10fde8492877b51cc4',
        '0x6bd5c3f9f60a5df821876f89e58ac1dd1e036edc',
        '0xcbd51e8e8cfd0c67907bc200a358e482901f41d2',
        '0xf581fa0a5f6909741d75f1610106144cd157925e',
        '0x78175901e9b04090bf3b3d3cb7f91ca986fb1af6',
        '0x02f91f4ed30de53e42921eef98b843eacbc47a30',
        '0xc1ce4d3c19ee73d10ae98a2fe318966b7a6126dd',
        '0x1bbc8aa095f5ca72dfbc169773989e41de8bdb86',
        '0xd2f7d752e2efd2865aeddd9fbcbbe4aadd37fbce',
        '0x0edf0a28311fd9478c13dc2a80c823ad3eb8683b',
        '0x7061583c8106d726ce7196f7bc33a7f06e32fe3c',
        '0x92f5ee3bedb444fd079c288fe3a890ad6de28ecb',
        '0xbc3ec4e491b835dce394a53e9a9a10ac19564839',
        '0xd51a3690d2e1e89ea656ca87e9cdfe412037c06a',
        '0x7d3c9bc9ee2a493c2a72f6886987d5dcd6bb2c71',
        '0xf8cf95a8dcc64dc2d6b8f7f2938be4e09cb6d9e2',
        '0xeb85a7b3fed933ec3b4599f1b4f8f3f838d0bedf',
        '0x98004ec49e84215442932ee1428ed6369c3d94e8',
        '0xa6037bd036ca41b84751b88bd658031eb5b4cb6e',
        '0x5c2581e1deaebefb52538943469077ad669f1bab',
        '0x73a6f9b93543fb606063682b4b50c6c69f54a14c',
        '0x1a9fcbadc5aed05a8eabb59af7563bf02a406689',
        '0x1106a616f77d368243086e23b3f6046375a75a16',
        '0xcce272b528b2c395741a24af0e4b13569cde65c4',
        '0x0ed993e448667f2c8c2a782468edd1b1f11bbd12',
        '0x622dd0305a5045eefcf03324f74561d9ca01c44e',
        '0xafdeecae3720c7186a120cc3a913b55f366f22a7',
        '0xe40b5c62d039ac427c809a3aaadb996c3c58d2da',
        '0x81e8cdcc1914343d2cd1dfa50f83dc2306e04888',
        '0x98a0f212e313767a2cb3084ec6bcf939106c50c2',
        '0x7af5ea77e8ec7459aa5d24d695ee53c9d349d317',
        '0x7b6b36389288d6afe4dd8e5da16ce8b806e4d4d2',
        '0x3cfb9a00ffa8c665dfa31089b33d4b9269d478ae',
        '0x063d84f9b591b9be26208dd184ab21511a108c6f',
        '0x7b6bba5f39bc2fbcf8100a7194cb1fd78f7d6bbd',
        '0x9fc54d389dd43532db9583a055e4bbc627a23c58',
        '0x498adbe819e9be58661f1e304947339cd0e40554',
        '0x3142dad33b1c6e1371d8627365f2ee2095eb6b37',
        '0x59fe66887bf0dadddd53476f0e95fe08dc43ed32',
        '0x87b008e57f640d94ee44fd893f0323af933f9195',
        '0x6b2185b659a6991a495f1391e49c2fbffe99525a',
        '0xe5434fe28fdc9431a37494de4e34dbc0a8a48722',
        '0x066b8bd8dc96c238264ea66db97acf78add8f189',
        '0x5333cc9ab84b198ab83e499a3b2803b79cb2faa7',
        '0x2c689b7b0f1cd7482450cdf72fcb63fca1693e66',
        '0x6ca54c383c2ae3333e53eeee5c485803b5a50dc7',
        '0x540fc589e2c5967bdc7aa371ecaa795febabc347',
        '0xf29e5e52a93e2f3efa7b5e4fa4dee5b8532e143f',
        '0xb48c9b5c4855c02adeee3dac98885599af385d92',
        '0xf3dd98c8716fe4c8a559eeef84c5fe1fe697cdce',
        '0x5134cc284535d4eaf4fb9cba5f65a9a100215766',
        '0xe05be8c63cf4e35d3e27eba03d932f2133a1dfa4',
        '0x6a2afea72dddf83156d8f08ed09c9d0906d250a2',
        '0x30668a4baa26f618dc70fa2835b6e3b347ef9a0f',
        '0x51720681a0cbcde8ab602f0eb9643986eb2b70ff',
        '0xb8588f8fe1c2a8656bee8ffdee1c1469a0556be6',
        '0x0a7ef13bf9ebaabbb7912b7f859b164a725e8de7',
        '0xbbb60df786de6f9f5a79f1fec7d371045d7dec0c',
        '0x7b36c7e440d7471f4b820f0fa0ac52dc749d9864',
        '0x06141f60ee56c8ecc869f46568e2cb1e66baaf41',
        '0x3cd9321a1eb1ebce82550826181940723ae8b723',
        '0xf3110b27f481f9ac3c1ba3c54de542accb2d913c',
        '0x0a01960ddf19c59e43cbdf0b5ab9278d7459e76e'
        ) and block_number < 11818910
),
        from_addresses as (
        select from_address as address from `bigquery-public-data.crypto_ethereum.token_transfers`
        where token_address in ('0x1e95a0d39c3d98a926a77565108ad084f1e9df5c',
        '0x26ea1f595f6567b7050fbba24f6a66e19db4d560',
        '0xfd62dbde8dc9ee56438f2d31aa3d9b039920232a',
        '0x783e2dcfbf6f40c6943d9aded6113c7013c46c9b',
        '0xe2f7dbcd2241d740ee552b44e8083841f2117f1c',
        '0xb76ceeb17483d667c37fe2c9a60f27f024ffea7b',
        '0x64b6f7c5d0bffbf532e7f5a2713081890bada155',
        '0x93d70f6c48a8e4755b3afcef61520439b4970a4d',
        '0xd9703d45b87f717dbe29759f09af7ac2b6bde775',
        '0x25a3dcabbf0070cb8e5baaa62d576cf6643afb5b',
        '0x19767500db814a3545b0a8e356facfff2bfd831d',
        '0x4982e5c944a6aa5a6aa12e48bb5a4c0b70424080',
        '0xc5d80ffab995db90557f311b904e3b4faf2f6a13',
        '0xfb925821eef8dfabe2788b322f436088650551cc',
        '0xf03b128da734dc0d6a3a7884a70089807bdc6bc8',
        '0xa3a3f076413a362bb0d69eea1dc5b0e79c831edc',
        '0xf0d2a55c74cd01a3e4fe6becb374c0ea77ecbdbf',
        '0x5c29cee07983a390c37f3f068fa00374a998ea2d',
        '0xcce50fd7f41574adb8fa600055b74303111f2e40',
        '0xa69fcaaa3f5ae04e63a7fec7aff9277bc0bdf8b4',
        '0x1aff4291843a69ce54fb25c227641e2f01f43ff3',
        '0xcfb223d9de75f9f784699cf75222301e7da5de17',
        '0x56fc86263c9bd2c4182b54a99fba5047aa8bb472',
        '0x022fc29373beeccfb44fae92a23a3e74830c7103',
        '0x41523a22144f3d129dddf1e9a549333148d0c37d',
        '0x50eb346fc29a80d97563a50146c3fcf9423b5538',
        '0xf5262f7adfb55d24a73b093a5e8810e972795cf6',
        '0xc73b32352b13e540469378af9d8191a99ab1323f',
        '0xfe549bbace54d7e5f27625790d69f54691fd2da7',
        '0xfc141b9c6bcc6a6a0f2f2cdb84036316577b389f',
        '0xbbcdee12f16696f887a009b059561561d4479b45',
        '0x7d926c737da03462a3c8d7c8e798975cf50a933e',
        '0xc0f69fe66f9e593440bac1e6f013fb0496d96915',
        '0xd340bab0184d4d266c47d56751b0d4954087d6ed',
        '0x33b07738f34d7b46e4d4e74442a70020762cf8ae',
        '0xe018ce12dfcec3a8dcc94f4c1946e1dd7c6fe310',
        '0xe85a37e3fbcf9ec782f06477604de8c211b5c218',
        '0x93b5b55f6ceb9742c542291c0ccf6f6a62368bce',
        '0x71d0d05c9772803ccfd4f39ae0e61b35f2792c2f',
        '0x0b078bac82e277ed7b9cefb91935ef72dca6e0de',
        '0x3dfe49aad52c8f512981bbf8a077ebdc5115a131',
        '0x3bbffaa97cae3514eceebbcd9b5d3840ecf71301',
        '0x12419eea0b053ffea92f9afcd7986a495e2cf0dd',
        '0xc0bfeba72805f22dc18dde31467c5a55c16ff57b',
        '0x945086c55d8d11b61992653badd4edf939ab92e1',
        '0xa38c58e9b05ee4f22633ecaedc6f7692f1bdaf9e',
        '0xb892e6ba024c8ed5ab6feb1175ec059c4caf1f08',
        '0x22972f3900d6fd68dc8c35249936b16f21b0b836',
        '0x8b0b17424a99a01894c8e08a504d9815cb917cc9',
        '0x971e22a354fe026faf437dd283a21fd5bf57b4fa',
        '0x1b991b6a41bf3bbc5cbd3b60000f26a8ea9ff9e9',
        '0xd9ce78d7984eb2d50fcb2f10fde8492877b51cc4',
        '0x6bd5c3f9f60a5df821876f89e58ac1dd1e036edc',
        '0xcbd51e8e8cfd0c67907bc200a358e482901f41d2',
        '0xf581fa0a5f6909741d75f1610106144cd157925e',
        '0x78175901e9b04090bf3b3d3cb7f91ca986fb1af6',
        '0x02f91f4ed30de53e42921eef98b843eacbc47a30',
        '0xc1ce4d3c19ee73d10ae98a2fe318966b7a6126dd',
        '0x1bbc8aa095f5ca72dfbc169773989e41de8bdb86',
        '0xd2f7d752e2efd2865aeddd9fbcbbe4aadd37fbce',
        '0x0edf0a28311fd9478c13dc2a80c823ad3eb8683b',
        '0x7061583c8106d726ce7196f7bc33a7f06e32fe3c',
        '0x92f5ee3bedb444fd079c288fe3a890ad6de28ecb',
        '0xbc3ec4e491b835dce394a53e9a9a10ac19564839',
        '0xd51a3690d2e1e89ea656ca87e9cdfe412037c06a',
        '0x7d3c9bc9ee2a493c2a72f6886987d5dcd6bb2c71',
        '0xf8cf95a8dcc64dc2d6b8f7f2938be4e09cb6d9e2',
        '0xeb85a7b3fed933ec3b4599f1b4f8f3f838d0bedf',
        '0x98004ec49e84215442932ee1428ed6369c3d94e8',
        '0xa6037bd036ca41b84751b88bd658031eb5b4cb6e',
        '0x5c2581e1deaebefb52538943469077ad669f1bab',
        '0x73a6f9b93543fb606063682b4b50c6c69f54a14c',
        '0x1a9fcbadc5aed05a8eabb59af7563bf02a406689',
        '0x1106a616f77d368243086e23b3f6046375a75a16',
        '0xcce272b528b2c395741a24af0e4b13569cde65c4',
        '0x0ed993e448667f2c8c2a782468edd1b1f11bbd12',
        '0x622dd0305a5045eefcf03324f74561d9ca01c44e',
        '0xafdeecae3720c7186a120cc3a913b55f366f22a7',
        '0xe40b5c62d039ac427c809a3aaadb996c3c58d2da',
        '0x81e8cdcc1914343d2cd1dfa50f83dc2306e04888',
        '0x98a0f212e313767a2cb3084ec6bcf939106c50c2',
        '0x7af5ea77e8ec7459aa5d24d695ee53c9d349d317',
        '0x7b6b36389288d6afe4dd8e5da16ce8b806e4d4d2',
        '0x3cfb9a00ffa8c665dfa31089b33d4b9269d478ae',
        '0x063d84f9b591b9be26208dd184ab21511a108c6f',
        '0x7b6bba5f39bc2fbcf8100a7194cb1fd78f7d6bbd',
        '0x9fc54d389dd43532db9583a055e4bbc627a23c58',
        '0x498adbe819e9be58661f1e304947339cd0e40554',
        '0x3142dad33b1c6e1371d8627365f2ee2095eb6b37',
        '0x59fe66887bf0dadddd53476f0e95fe08dc43ed32',
        '0x87b008e57f640d94ee44fd893f0323af933f9195',
        '0x6b2185b659a6991a495f1391e49c2fbffe99525a',
        '0xe5434fe28fdc9431a37494de4e34dbc0a8a48722',
        '0x066b8bd8dc96c238264ea66db97acf78add8f189',
        '0x5333cc9ab84b198ab83e499a3b2803b79cb2faa7',
        '0x2c689b7b0f1cd7482450cdf72fcb63fca1693e66',
        '0x6ca54c383c2ae3333e53eeee5c485803b5a50dc7',
        '0x540fc589e2c5967bdc7aa371ecaa795febabc347',
        '0xf29e5e52a93e2f3efa7b5e4fa4dee5b8532e143f',
        '0xb48c9b5c4855c02adeee3dac98885599af385d92',
        '0xf3dd98c8716fe4c8a559eeef84c5fe1fe697cdce',
        '0x5134cc284535d4eaf4fb9cba5f65a9a100215766',
        '0xe05be8c63cf4e35d3e27eba03d932f2133a1dfa4',
        '0x6a2afea72dddf83156d8f08ed09c9d0906d250a2',
        '0x30668a4baa26f618dc70fa2835b6e3b347ef9a0f',
        '0x51720681a0cbcde8ab602f0eb9643986eb2b70ff',
        '0xb8588f8fe1c2a8656bee8ffdee1c1469a0556be6',
        '0x0a7ef13bf9ebaabbb7912b7f859b164a725e8de7',
        '0xbbb60df786de6f9f5a79f1fec7d371045d7dec0c',
        '0x7b36c7e440d7471f4b820f0fa0ac52dc749d9864',
        '0x06141f60ee56c8ecc869f46568e2cb1e66baaf41',
        '0x3cd9321a1eb1ebce82550826181940723ae8b723',
        '0xf3110b27f481f9ac3c1ba3c54de542accb2d913c',
        '0x0a01960ddf19c59e43cbdf0b5ab9278d7459e76e'
        ) and block_number < 11818910
)
    select address from (
        select distinct address from to_addresses
        UNION DISTINCT
        select distinct address from from_addresses
    ) WHERE address NOT IN (
          SELECT contract
          FROM `retroactive_ed5d7c292da31b3f3568dc3c5cbb431a6b4eb4da.uniswap_contracts`
    ) and address not in ('0x0000000000000000000000000000000000000000', '0x000000000000000000000000000000000000dead');
);

