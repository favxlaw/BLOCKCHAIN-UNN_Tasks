# BUNNICO Token ICO Smart Contract

## WEB3 Bootcamp - Assignment 3

The **WEB3 Bootcamp - Assignment 3

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

### 5. Deploy script which deploys and verifies your ICO smart contract on etherscan.
