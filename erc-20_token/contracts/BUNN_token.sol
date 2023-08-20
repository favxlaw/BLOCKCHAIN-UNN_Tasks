// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract ERC20{
    //variables
    uint256 public totalSupply;
    string public name; 
    string public symbol;
    //unit8 public decimal;
    mapping(address => uint256) public balanceOf;
    mapping(address => mapping(address => uint256)) public allowance;
    event Transfer(address indexed from, address indexed to, uint256 amount);
    event Approval(address indexed owner, address indexed spender, uint256 amount);

    address public owner;

    constructor(string memory _name, string memory _symbol){
        name = _name;
        symbol = _symbol;
        owner = msg.sender;
        
        _mint(msg.sender, 1000e18);
        }

    //Recipient
        function decimal() public pure returns (uint8){
            return 18;
        }
        function transfer(address recipient, uint256 amount) external returns(bool){
            return _transfer(msg.sender,recipient,amount);
        }

        function transferFrom(address sender, address recipient, uint256 amount) external returns (bool){

            uint256 currentBalance = allowance[sender][msg.sender];
            require(currentBalance >= amount, "Erc20 transfer amount must exceed allowance");

            allowance[sender][msg.sender]=currentBalance - amount;

            emit Approval(sender, recipient, amount);

            return _transfer(sender, recipient,amount);

        }

        function approve(address spender, uint256 amount) external returns(bool){
            require(spender != address(0), "erc20 approve to the address");
            allowance[msg.sender][spender] = amount;
            emit Approval(msg.sender, spender, amount);
            return true;
        }

        function _transfer(address sender, address recipient, uint256 amount) private returns(bool){
            require(recipient != address(0), "Erc20 transfer to address 0");
            uint256 senderBalance = balanceOf[sender];
            require(senderBalance >= amount, "Erc transfer to address 0");
            balanceOf[sender] = senderBalance - amount;

            balanceOf[recipient] += amount;
            emit Transfer(sender, recipient, amount);
            return true;
        }
        function _mint(address to, uint256 amount) internal {
            require(to != address(0), "Erc20 mint to address 0");

            totalSupply += amount;
            balanceOf[to] += amount;

            emit Transfer(address(0), to, amount);
                 }
    

//Burn Functionality
        function _burn(uint256 amount) public{
            require(msg.sender == owner, "The owner alone burns the tokens");
            require(amount <= balanceOf[msg.sender], "Erc20 burn amount exceed balance");

            balanceOf[msg.sender] -= amount;
            totalSupply -= amount;
            emit Transfer(msg.sender, address(0), amount);
        }
  
}