// We require the Hardhat Runtime Environment explicitly here. This is optional
// but useful for running the script in a standalone fashion through `node <script>`.
//
// When running the script with `npx hardhat run <script>` you'll find the Hardhat
// Runtime Environment's members available in the global scope.
const fs = require('fs');
const { ethers } = require('hardhat');

async function deploy() {
  const [deployer] = await ethers.getSigners();
  console.log("Deploying contracts with the account:", deployer.address);

  const Micdrop = await hre.ethers.getContractFactory("Micdrop"); // Replace EthrLive with Micdrop
  const micdrop = await Micdrop.deploy(maticAddress); // Replace maticAddress with the address of the modified smart contract

  await micdrop.deployed();

  console.log("Micdrop deployed to:", micdrop.address);

  // Save the contract address to a JSON file for later use
  let addresses = {
    micdrop: micdrop.address
  };

  fs.writeFileSync("contract-addresses.json", JSON.stringify(addresses, null, 2));
}

deploy()
  .then(() => process.exit(0))
  .catch(error => {
    console.error(error);
    process.exit(1);
  });
