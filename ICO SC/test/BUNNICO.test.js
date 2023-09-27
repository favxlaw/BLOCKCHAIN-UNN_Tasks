const { expect } = require("chai");

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
BUNNICO = await BUNNICOFactory.deploy(BUNNToken.address);
});

//Check if a user can register for the ICO
it("Allow user to register", async function () {
    await BUNNICO.connect(User).register({ value: ethers.utils.parseEther("0.01")});
    const isRegistered = await BUNNICO.registered_addresses(User.address);
    expect(isRegistered).to.be.true;
});

//Test that a user cannot register after the ICO ends
it("Don't allow user to register after the ICO ends", async function (){
    
})

})