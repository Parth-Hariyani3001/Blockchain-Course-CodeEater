import {useEffect, useState} from "react";
import SimpleStorage from './contracts/SimpleStorage.json';
import {Web3} from 'web3';
import './App.css';

function App() {
  const [state,setState] = useState({
    web3 : null,
    contract : null
  });
  const [val,setVal] = useState("");
  const [ans,setAns] = useState("");
  const [accounts,setAccounts] = useState([]);

  useEffect(() => {
    const provider = new Web3.providers.HttpProvider('HTTP://127.0.0.1:7545');
    async function template(){
      //Setting the provider
      const web3 = new Web3(provider);
  
      //Getting the contract address
      const networkId = await web3.eth.net.getId();
      const deployedNetwork = SimpleStorage.networks[networkId];
      // console.log(deployedNetwork.address);
  
      //creating an instance of contract
      const contract = new web3.eth.Contract(SimpleStorage.abi,deployedNetwork.address);
  
      setState({web3 : web3, contract : contract});
    }
    provider && template();
  },[]);

  async function getAccounts(){
    const {web3} = state;
    const accounts = await web3.eth.getAccounts();
    setAccounts(accounts);
  }
  // console.log(state);
  
  useEffect(() => {
    const {contract} = state;
    async function readContract() {
      const value = await contract.methods.getter().call();
      setAns(Number(value));
    }
    contract && readContract();
  },[state])
  

  async function writeContract(){
    const {contract} = state;
    // const accounts = await getAccounts();
    await contract.methods.setter(val).send({from : "0xaf01677244414A014c294C5f13b0E6d6f952C422"});
  }

  return (
    <div className="App">
      <button onClick={getAccounts}>Get Accounts</button>
      <br />
      {/* <button onClick={readContract}>Contract Data</button> */}
      <br />
      <label>Enter the value to change</label>
      <input type="text" placeholder="Enter the value to update" 
      value={val} 
      onChange={(e) =>setVal(Number(e.target.value))}
      />
      <button onClick={writeContract}>Change</button>
      <br />
      <b>Your Value is {ans}</b>
      <br />
      {accounts.map((e,index) => {
        return(
          <div key={index}>
            <span>{index} {" -> "} {e}</span>
          </div>
        )
      })}
    </div>
  );
}

export default App;
