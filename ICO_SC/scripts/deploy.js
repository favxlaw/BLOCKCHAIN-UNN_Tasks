const { ethers } = require("hardhat");

async function main() {
  const [deployer] = await ethers.getSigners();

  console.log(`Deploying contracts with the account: ${deployer.address}`);
const BUNNTokenAddress = '0x1057cC48F7C7DfE7542B7697e3C73e71557068A8';

//Deploy BUNNICO contract
const BUNNICO = await ethers.getContractFactory('BUNNICO');
const bunnicoinstance = await BUNNICO.deploy(BUNNTokenAddress);

await bunnicoinstance.deployed();


//Print the address of the deployed BUNNICO contract
console.log(`BUNNICO deployed to: ${bunnicoinstance.address}`);
}

main()
  .then(() => process.exit(0))
  .catch(error => {
    console.error(error);
    process.exit(1);
  });