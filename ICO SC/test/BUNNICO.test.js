const { expect } = require("chai");
const { ethers } = require("hardhat"); 

//Describe the tests for the BUNNICO contract
describe("BUNNICO contract", function () {
    let BUNNICO;
    let BUNNToken;
    let deployer;
    let User;

//Set up the contracts and user accounts 
before(async function (){
    [deployer, User] = await ethers.getSigners();
    
// Deploy the BUNNICO contract
const BUNNICOFactory = await ethers.getContractFactory("BUNNICO");
BUNNICO = await BUNNICOFactory.deploy(deployer.address);
});

//Check if a user can register for the ICO
it("Allow user to register", async function () {
    await BUNNICO.connect(User).register({ value: ethers.utils.parseEther("0.01")});
    const isRegistered = await BUNNICO.registered_addresses(User.address);
    expect(isRegistered).to.be.true;
});

//Test that a user cannot register after the ICO ends
it("Don't allow user to register after the ICO ends", async function (){
    await BUNNICO.endICO();

//Trying to register after ICO ends
await expect(BUNNICO.connect(User).register({ value: ethers.parseEther("0.01")}))
    .to.be.revertedWith("Sorry ICO has ended.");
});

//Test if a registered user can claim tokens after the ICO ends
it("Should allow registered user to claim tokens", async function () {
    await BUNNICO.connect(User).register({ value: ethers.utils.parseEther("0.01") });
    await BUNNICO.endICO();
    await BUNNICO.connect(User).claim(User.address);
    const isClaimed = await BUNNICO.claimed_addresses(User.address);
    expect(isClaimed).to.be.true;
  });

// Test that an unregistered user cannot claim tokens
it("Should not allow unregistered user to claim tokens", async function () {
    await expect(BUNNICO.connect(User).claim(User.address))
      .to.be.revertedWith("You are not registered.");
  });
 
// Test that a user cannot claim tokens multiple times
it("Should not allow user to claim tokens multiple times", async function () {
    await BUNNICO.connect(User).register({ value: ethers.utils.parseEther("0.01") });
    await BUNNICO.endICO();
    await BUNNICO.connect(User).claim(User.address);

// Try to claim tokens again 
await expect(BUNNICO.connect(User).claim(User.address))
    .to.be.revertedWith("You have already claimed. ");
});

});