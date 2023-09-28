# BUNNICO Token ICO Smart Contract

## Overview

The **BUNNICO Token ICO Smart Contract** is a decentralized application (DApp) that facilitates the Initial Coin Offering (ICO) for the BUNN token. The ICO allows users to participate by registering and later claiming their share of BUNN tokens. This contract is designed to be deployed on the Ethereum blockchain.

## Features

### 1. ICO Registration

- **User Registration**: Users can participate in the ICO by registering with 0.01 ETH, allowing them to claim BUNN tokens.

- **Prevent Duplicate Registrations**: The contract ensures that users can only register once and cannot register after the ICO ends.

### 2. ICO Claiming

- **Claim Function**: After the ICO expires, registered users can claim their share of BUNN tokens using the `claim` function.

- **Prevent Duplicate Claims**: The contract prevents users from claiming tokens more than once.

### 3. ICO Duration

- **Customizable ICO Duration**: You can set the ICO duration using the `ICO_DURATION` constant. The default is 24 hours (86400 seconds).

### 4. ERC-20 Integration

- **Token Transfer**: The `claim` function transfers 50 BUNN tokens to the user's address using the ERC-20 interface.

### 5. Deployment Script

- **Deployment Script**: Included is a deployment script to deploy and verify the ICO smart contract on Etherscan for transparency.

## Getting Started

### Prerequisites

- [Node.js](https://nodejs.org/) and [npm](https://www.npmjs.com/) for package management.

- [Hardhat](https://hardhat.org/) as the Ethereum development environment.

### Installation

1. Clone the repository: `git clone https://github.com/your-username/your-repo.git`

2. Navigate to the project directory: `cd your-repo`

3. Install dependencies: `npm install`

## Usage

1. Modify the deployment script and contract parameters to match your specific use case.

2. Deploy the contract to your desired Ethereum network using Hardhat.

3. Interact with the deployed contract by registering and claiming tokens using the provided functions.

## Deployment

### Local Development

To deploy the contract to a local development network (e.g., Hardhat's local network):

```shell
npx hardhat run scripts/deploy.js --network localhost

## Acknowledgments
This project is based on the OpenZeppelin smart contract libraries.
Special thanks to the Ethereum community for their contributions to the ecosystem.