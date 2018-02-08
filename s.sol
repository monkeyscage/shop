pragma solidity 0.4.19;

contract s{
address[] public input;
address[] public output;
address public owner;

mapping(address => mapping(address => uint))public price;
mapping(address => bool)public permissions;

function s(address _owner){owner=_owner;permissions[_owner]=true;}

function setPrice(address _output,address _input,uint _price)returns (bool){
price[_output][_input]=_price;
}

function addInput(address _input){
input.push(_input);
}

function removeInput(uint _i)returns (bool){
input[_i]=input[input.length-1];
input.length--;
}

function addOutput(address _output)returns (bool){
output.push(_output);
}

function removeOutput(uint _i)returns (bool){
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

function transferToken(address _to,address _token,uint _amount) {
if(!permissions[msg.sender])revert();
//erc20 token=erc20(_token);
//token.transfer(msg.sender,_amount);
}

function transferETH(address _to,uint _amount){
if(!permissions[msg.sender])revert();
//send(msg.sender,_amount);
}

function inspect(uint _i)constant returns(uint,uint){
return(input.length,output.length);
}

function setController(address _controller,bool active){
permissions[_controller]=active;
}


}
