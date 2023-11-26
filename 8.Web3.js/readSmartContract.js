//0x7140212A46E57C54B4723673e8d47746F261C518

const {Web3} = require('web3');
const web3 = new Web3('http://127.0.0.1:7545');

//ABI and Contract Address
async function readContract() {
    const ABI = [
            {
                "inputs": [
                    {
                        "internalType": "uint256",
                        "name": "_a",
                        "type": "uint256"
                    }
                ],
                "name": "set",
                "outputs": [],
                "stateMutability": "nonpayable",
                "type": "function"
            },
            {
                "inputs": [],
                "name": "get",
                "outputs": [
                    {
                        "internalType": "uint256",
                        "name": "",
                        "type": "uint256"
                    }
                ],
                "stateMutability": "view",
                "type": "function"
            }
    ];
    const contractAddress = "0xB10343780351de85b10524B2588F732262cFe243";
    const contract = new web3.eth.Contract(ABI,contractAddress);
    const data = await contract.methods.get().call();
    console.log(data);
    await contract.methods.set(5).send({from : "0xB978446826De0c51d3dB3Dee0830b37385667298"});
    const data2 = await contract.methods.get().call();
    console.log(data2);
}
readContract();