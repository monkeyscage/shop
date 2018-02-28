pragma solidity 0.4.20;
contract m{
address public owner;
mapping(address => bool)public permissions;
mapping(address => bool)public certified;
function m(){
owner=msg.sender;
}

function buy(address _seller,address _buyer,address _output,address _input,uint _inputamount) returns(bool){
if((!certified[_buyer])||(!certified[_seller]))revert();
s buyer=s(_buyer);
if(msg.sender!=address(buyer.owner))revert();
s seller=s(_seller);
if(buyer.buynow(_seller,_input,_inputamount)){
if(!seller.sell(_buyer,_output,_input,_inputamount))revert();
}else{revert();}
return true;
}
}

function upgrade(address _shop,uint i,bool active,address _controller){
 s shop=s(_shop); if(s.owner!=msg.sender)revert();
 upgrader u=upgrader("0x0");
    if(active){
    s.setController(u.controllers(i),true);
    }else{
        if(u.removable(_controller))s.setController(_controller,false);
    }
    
 function add(address a){
 if(!permissions[msg.sender])revert();
 certified[a]=true;
 }
 
 function setPermission(address a,bool b){
if(msg.sender!=owner)revert();
permission[a]=b;
}


}

contract s{
    address public owner;
    
   function sell(address _buyer,address _output,address _input,uint _inputamount)returns(bool){return true;}
   function buynow(address _buyer,address _input,uint _inputamount)returns(bool){return true;}
   function setController(address _controller,bool active) returns(bool){return bool;}
}

   
