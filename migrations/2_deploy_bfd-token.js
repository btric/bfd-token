var BFDToken = artifacts.require("./BFDToken.sol");

module.exports = function(deployer) {
  deployer.deploy(BFDToken);
};
