contract s is superowned{
address[] public input;
address[] public output;


mapping(address => mapping(address => uint))public price;

function s(address _owner){owner=owner;}

function setPrice(address _output,address _input,uint _price)returns (bool){
price[_output][_input]=_price;
}

function addInput(address _input){
input.push(_input);
}

function removeInput(uint _i)returns (bool){
input[i]=input[input.length-1];
input.length--;
}

function addOutput(address _input)returns (bool){
output.push(_output);
}

function removeOutput(address _input)returns (bool){
output[i]=output[output.length-1];
output.length--;
}

function buy(address _output,address _input,uint _amount){
if(price[_output][_input]==0)revert();
erc20 token=erc20(_input);
if(!token.transferFrom(msg.sender,this,_amount))revert();
uint total;
if(price[_output][_input]<1000000000000000000){
total=price[_output][_input]*_amount;}else{
total=price[_output][_input]/1000000000000000000*_amount;}
token=erc20(_output);
if(!token.transfer(msg.sender,total))revert();
}

function transferToken(address _to,address _token,uint _amount) onlyOwner{
token.transfer(msg.sender,_amount);
}

function transferETH(address _to,uint _amount)onlyOwner{
send(msg.sender,_amount);
}

function inspect(uint _i)constant returns(){
return(input[_i],input.length,output[_i],output.length);
}

}
