require("@nomicfoundation/hardhat-toolbox");
require("dotenv").config();
//require("hardhat-deploy");

const SEPOLIA_RPC = process.env.SEPOLIA_RPC;
const PRIV_KEY = process.env.PRIV_KEY;
const ETHERSCAN_API_KEY = process.env.ETHERSCAN_API_KEY;

module.exports = {
  solidity: "0.8.19",
  defaultNetwork: "hardhat",
  networks: {
    sepolia: {
      url: "https://polygon-mainnet.g.alchemy.com/v2/Y9NftxusBbROGJsCM0AHyXl5jvR6EALm",
      accounts: [process.env.PRIVATE_KEY],
      chainId: 137,
    },
  },
  etherscan: {
    apiKey: [process.env.ETHERSCAN_API_KEY],
    polygon: [process.env.ETHERSCAN_API_KEY],
  },
  namedAccounts: {
    deployer: {
      default: 0,
      137: 0,
    },
  },
};
