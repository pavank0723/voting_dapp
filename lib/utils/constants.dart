String infura_url = "https://kovan.infura.io/v3/0abb111eff444820a1e2ca8635468103";

String owner_private_key = "1c51068bea5248f79a2fc0d7ec8d3cf5b5dea17381d8a96c5bd1da806162500a";

//#region Private key of Wallet address
const String voter1_private_key = "0e3c5288c066e03034ac5e079e98280e98791788e7c9472fb9ac997fd7aa9aea";
const String voter2_private_key = "2d72e53bc5c58c8c437a50b0a7fe101f26c0cac0cf3927a7425274771eaecedf";
const String voter3_private_key = "3461cb3ce420296d8d73837286680cddb9841b81bbce86e139b7a57e2333b4ed";
//#endregion

//#region Wallet address
const String voter1_address = "0x4685BfECE0f04E6ca9E576c1aA6b33405A1Bc635";
const String voter2_address = "0x8A8d3F406173eECa675a8D60506e225fc521df73";
const String voter3_address = "0xA160b665B279c908Db35b2CeeFa648eF007Ab391";
//#endregion

String contract_address = "0xb804B6CfF2FfFdA47dEa455480f22B6FDd5fA40f";

String getVoterAddressByKey(String key){
  switch(key){
    case voter1_private_key:{return voter1_address;}
    case voter2_private_key:{return voter2_address;}
    case voter3_private_key:{return voter3_address;}
    default: return "";
  }
}

