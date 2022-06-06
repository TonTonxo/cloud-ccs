pragma solidity ^0.5.0;
pragma experimental ABIEncoderV2;


/**
* @title cloud
* @author Abhishek Vispute
*/
contract cloud {
 
    address owner;
  
    modifier onlyowner
    {
         require(msg.sender==owner,"You are not allowed");
         _;
    }
   
   bytes32 d;
   
   struct file {
       string hash;
       string mimetype;
       string name;
   }

  mapping(address => file[]) files_per_user;
  
  
  function getMyFiles() public view returns (file [] memory)
   {
       return files_per_user[msg.sender];
   }
   
   function addMyfile(string memory _hash,string memory _mimetype, string memory _name) public
   {
        file memory t;
        t.hash = _hash;
        t.mimetype = _mimetype;
        t.name = _name;
        files_per_user[msg.sender].push(t);
     
   }
   
   function shareMyfile(address _add, string memory _hash, string memory _mimetype, string memory _name) public
   { 
        file memory t;
        t.hash = _hash;
        uint256 index = 0;
        for(uint256 i = 0; i < files_per_user[msg.sender].length; i++){
          if(keccak256(abi.encodePacked(files_per_user[msg.sender][i].name)) ==  keccak256(abi.encodePacked(t.name))){
               index = i;
          }
        }
        delete(files_per_user[msg.sender][index]);
        t.mimetype = _mimetype;
        t.name = _name;
        files_per_user[_add].push(t); 
   }
}