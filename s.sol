pragma solidity 0.4.19;

contract s{
address[] public input;
address[] public output;
address public owner;

 modifier permissioned{ if(!permissions[msg.sender])revert();
 }

mapping(address => mapping(address => uint))public price;
mapping(address => bool)public permissions;

function s(address _owner){owner=_owner;permissions[_owner]=true;}

function setPrice(address _output,address _input,uint _price)returns (bool) permissioned{
price[_output][_input]=_price;
}

function addInput(address _input) permissioned{
input.push(_input);
}

function removeInput(uint _i)returns (bool) permissioned{
input[_i]=input[input.length-1];
input.length--;
}

function addOutput(address _output)returns (bool) permissioned{
output.push(_output);
}

function removeOutput(uint _i)returns (bool) permissioned{
output[_i]=output[output.length-1];
output.length--;
}

function buy(address _output,address _input,uint _amount){
if(price[_output][_input]==0)revert();
//erc20 token=erc20(_input);
//if(!token.transferFrom(msg.sender,this,_amount))revert();
uint total;
if(price[_output][_input]<1000000000000000000){
total=price[_output][_input]*_amount;}else{
total=price[_output][_input]/1000000000000000000*_amount;}
//token=erc20(_output);
//if(!token.transfer(msg.sender,total))revert();
}

function transferToken(address _to,address _token,uint _amount) permissioned{
//erc20 token=erc20(_token);
//token.transfer(msg.sender,_amount);
}

function transferETH(address _to,uint _amount)permissioned{
//send(msg.sender,_amount);
}

function inspect(uint _i)constant returns(uint,uint){
return(input.length,output.length);
}

function setController(address _controller,bool active)permissioned{
permissions[_controller]=active;
}

function approve(address _user,address _token,uint _amount) permissioned{

//erc20 token=erc20(_token);
//token.approve(_user,_amount);
}

function action(address _contract,uint _value,uint _gas,string _function,byte _byte,uint _call) permissioned{
if(_call==0){_contract.call.gas(_gas).value(_value)( bytes4(sha3(_function)));}
if(_call==1){_contract.call.gas(_gas).value(_value)( bytes4(sha3(_function)),string(_byte));}
if(_call==2){_contract.call.gas(_gas).value(_value)( bytes4(sha3(_function)),address(_byte));}
if(_call==3){_contract.call.gas(_gas).value(_value)( bytes4(sha3(_function)),uint(_byte));}
if(_call==4){_contract.call.gas(_gas).value(_value)( bytes4(sha3(_function)),_byte);}
}


}
