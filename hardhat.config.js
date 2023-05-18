require("@nomicfoundation/hardhat-toolbox");
require('dotenv').config({path: '.env'});

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.18",
  networks:{
    alfajores:{
      url:"https://alfarajores-forno.celo-testnet.org",
      accounts:{
        mnemonic: process.env.MNEMONIC,
        path: "m/44'/52752'/0'/0",
    
    },
    chainId: 44787,
  },
},
};
