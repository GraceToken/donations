var DonationPool = artifacts.require("./DonationPool.sol");

contract('DonationPool', function(accounts) {
  it("should transfer withdrawal amount from donation to `beneficiary`", function() {
    // TODO - stub
  });

  it("should not allow withdrawal for accounts other than `beneficiary`", function() {
    // TODO - stub
  });

  it("should not allow withdrawal until `releaseTime`", function() {
    // TODO - stub
  });
});
