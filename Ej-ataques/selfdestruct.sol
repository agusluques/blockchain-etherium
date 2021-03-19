pragma solidity ^0.4.18;

/**
 * si un contrato se autodestuye enviando sus fondos a otro contrato, la fallback function no se llama
 */

contract ForzarRecibirEther {

  bool public ganaste = false;

  function soloBalancesMayoresACero() {
      require(this.balance > 0); 
      ganaste = true;
  }
  
  function obtenerBalance() public returns (uint){
      return address(this).balance;
  }

  // throw si se recibe ether
  function() payable {
    revert();
  }
         
}

contract AutoDestructor {
    
    function obtenerBalance() public returns (uint){
      return this.balance;
    }
    
    function matar (){
        selfdestruct(address(0xd45968f99ce42c63b2ee728bf4ccf63c19166bc0));
    }
    
    function () payable {
        
    }
}