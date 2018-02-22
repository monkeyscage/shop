pragma solidity 0.4.20;
contract friendster{
mapping(address => address[]) public friends;
mapping(address => address[]) public requests;

function friendster(){
}

function addfriend(address shop,address friend){
s tshop=s(friend);
if(tshop.owner()==msg.sender)revert();
requests[shop].push(friend);
}

function removefriend(address shop,uint i){
s tshop=s(shop);
if(tshop.owner()==msg.sender){
friends[shop][i]=friends[shop][friends[shop].length-1];
friends[shop].length--;
}
}

function acceptrequest(address shop,uint i){
s tshop=s(shop);
if(tshop.owner()==msg.sender){
friends[shop].push(requests[shop][i]);
requests[shop][i]=requests[shop][requests[shop].length-1];
requests[shop].length--;
}
}

function deleterequest(address shop,uint i){
s tshop=s(shop);
if(tshop.owner()==msg.sender){
requests[shop][i]=requests[shop][requests[shop].length-1];
requests[shop].length--;
}
}

function allfriends(address shop)constant returns(uint,uint){return (requests[shop].length,friends[shop].length);}


}

contract s{address public owner;}
