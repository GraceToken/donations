var DonationPool = artifacts.require("./DonationPool.sol");

module.exports = function(deployer) {
  var beneficiary = web3.eth.accounts[1];
  var releaseTime = new Date();
  releaseTime = Math.floor(releaseTime / 1000);
  
  deployer.deploy(DonationPool, beneficiary, releaseTime);
};
