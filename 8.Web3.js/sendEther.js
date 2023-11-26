const {Web3} = require('web3');

const provider = new Web3.providers.HttpProvider("HTTP://127.0.0.1:7545");

const web3 = new Web3(provider);

async function sendEther(){
    const tx = await web3.eth.sendTransaction({
        from : "0xD21878E8e3e062D5E4D86cf48eC68C95EcE1aaAD",
        to : "0x116474831efda2bA186623E71d2EFfA1ACB9ED36",
        value : web3.utils.toWei("10","ether"),
    });
    console.log(tx);
}

sendEther();