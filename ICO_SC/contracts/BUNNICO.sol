// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract BUNNICO{
    //Storage Variables
    address public admin; //address holding the ERC20 tokens
    address public token_address; // address of the the deployed BUNN token
    
    mapping(address => bool) public registered_addresses; // mapping to registration status
    mapping(address => bool) public claimed_addresses; //mapping to claim status

    uint256 public ico_start_time; // Time when ICO contract will be deployed
    uint256 constant public ICO_DURATION = 86400; // 24 hours in seconds

// ERC20 token Interface
IERC20 public token;

constructor(address _token_address) {
    admin = msg.sender;
    token_address = _token_address;
    ico_start_time = block.timestamp; //initialize ICO start time    
}

// Register function
    function register() external payable {
        require(msg.value == 0.01 ether, "Registration requires 0.01 ETH");
        require(!registered_addresses[msg.sender], "You are already registered");
        require(block.timestamp < ico_start_time + ICO_DURATION, "ICO has ended");
        registered_addresses[msg.sender] = true;
    }

// Claim Function
    function claim(address recipient) external {
        require(registered_addresses[msg.sender], "You are not registered");
        require(block.timestamp >= ico_start_time + ICO_DURATION, "ICO has not ended");
        require(!claimed_addresses[msg.sender], "You have already claimed");

claimed_addresses[msg.sender] = true;

// Transfer 50 BUNN tokens to the recipient   
        IERC20(token_address).transferFrom(admin, recipient, 50); // 10^8 to account for the token's decimal places
    }
}