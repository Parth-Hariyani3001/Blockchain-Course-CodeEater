const simpleStorage = artifacts.require('./SimpleStorage.sol');

module.exports = async function(deployer) {
    await deployer.deploy(simpleStorage);
}