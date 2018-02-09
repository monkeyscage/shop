contract m{
address public owner;

function m(){
owner=msg.sender;
}

function buy(address _seller,address _buyer,address _output,address _input,uint _inputamount) returns(bool){
MTS buyer=MTS(_buyer);
if(msg.sender!=buyer.owner)revert();
MTS seller=MTS(_seller);
if(seller.sell(_buyer,_output,_input,_inputamount)){
if(!buyer.buynow(_input,_inputamount))revert();
}else{revert();}
}
retunr true;
}
