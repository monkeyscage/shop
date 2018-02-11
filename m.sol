contract m{
address public owner;
mapping(address => bool)public certified;
function m(){
owner=msg.sender;
}

function buy(address _seller,address _buyer,address _output,address _input,uint _inputamount) returns(bool){
//if((!certified[_buyer])||(!certified[_seller]))revert();
s buyer=s(_buyer);
if(msg.sender!=address(buyer.owner))revert();
s seller=s(_seller);
if(seller.sell(_buyer,_output,_input,_inputamount)){
if(!buyer.buynow(_seller,_input,_inputamount))revert();
}else{revert();}

return true;
}
}
