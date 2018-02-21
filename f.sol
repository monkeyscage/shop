contract friendster{
mapping(address => address[]) public friends;
mapping(address => address[]) public requests;

function friendster(){
}

function addfriend(address shop,address friend){
s tshop=s(shop);
if(tshop.owner()==msg.sender)friends[shop].push(friend);
}

function removefriend(address shop,uint i){
s tshop=s(shop);
if(tshop.owner()==msg.sender){
friends[shop][i]=friends[shop][friends[shop].length-1];
friends[shop].length--;
}


}
