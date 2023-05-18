// We require the Hardhat Runtime Environment explicitly here. This is optional
// but useful for running the script in a standalone fashion through `node <script>`.
//
// You can also run a script with `npx hardhat run <script>`. If you do that, Hardhat
// will compile your contracts, add the Hardhat Runtime Environment's members to the
// global scope, and execute the script.
const hre = require("hardhat");

async function main() {
  const Marketplace = await hre.ethers.getContractFactory("Marketplace");
  const marketplace = await Marketplace.deploy();

  await marketplace.deployed();

  console.log("Marketplace deployed to:", marketplace.address);
  // storemarketplaceData(marketplace);

  const EstateNFT = await hre.ethers.getContractFactory("EstateNFT");
  const NFT = await EstateNFT.deploy();

  await NFT.deployed();

  console.log("NFT deployed to:", NFT.address);
  // storeContractData(NFT);
}

// function storeContractData(contract) {
//   const fs = require("fs");
//   const contractsDir = __dirname + "/../src/contracts";

//   if (!fs.existsSync(contractsDir)) {
//     fs.mkdirSync(contractsDir);
//   }

//   fs.writeFileSync(
//     contractsDir + "/NFT-address.json",
//     JSON.stringify({ NFT: contract.address }, undefined, 2)
//   );

//   const NFTArtifact = artifacts.readArtifactSync("NFT");

//   fs.writeFileSync(
//     contractsDir + "/NFT.json",
//     JSON.stringify(NFTArtifact, null, 2)
//   );
// }

// function storemarketplaceData(contract) {
//   const fs = require("fs");
//   const contractsDir = __dirname + "";

//   if (!fs.existsSync(contractsDir)) {
//     fs.mkdirSync(contractsDir);
//   }

//   fs.writeFileSync(
//     contractsDir + "/Marketplace-address.json",
//     JSON.stringify({ Marketplace: contract.address }, undefined, 2)
//   );

//   const NFTArtifact = artifacts.readArtifactSync("Marketplace");

//   fs.writeFileSync(
//     contractsDir + "/Marketplace.json",
//     JSON.stringify(NFTArtifact, null, 2)
//   );
// }

main()
.then(() => process.exit(0))
.catch((error) => {
  console.error(error);
  process.exit(1);
});


