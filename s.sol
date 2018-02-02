contract s is superowned{
address[] public input;
address[] public output;

mapping(address => mapping(address => uint))public price;

function s(){}

function setPrice(address _output,address _input,uint _price)returns (bool){
price[_output][_input]=_price;
}

function addInput(address _input){
input.push(_input);
}

function removeInput(address _input)returns (bool){

}

function addOutput(address _input)returns (bool){
output.push(_output);
}

function removeOutput(address _input)returns (bool){

}

function buy(){

}

}
