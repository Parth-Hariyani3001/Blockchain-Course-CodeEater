let {Web3} = require('web3');

let provider = new Web3.providers.HttpProvider("HTTP://127.0.0.1:7545");

let web3 = new Web3(provider);

// console.log(web3);
async function getBalance(){
    const balance = await web3.eth.getBalance("0xD21878E8e3e062D5E4D86cf48eC68C95EcE1aaAD");
    const balanceEther = web3.utils.fromWei(balance,"ether"); //wei to ether
    const balanceWei = web3.utils.toWei(balanceEther,"ether") // ether to wei
    console.log("in Wei " + balance);
    console.log("in ETH " + balanceEther);
    console.log("in wei " + balanceWei);
}

getBalance();