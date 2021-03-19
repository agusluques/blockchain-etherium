pragma solidity ^ 0.4.0;

contract Dividir {
    
    address[] empleados = [0x14723a09acff6d2a60dcdf7aa4aff308fddc160c, 0x4b0897b0513fdc7c541b6d9d7e929c4e5364d2db, 0x583031d1113ad414f02576bd6afabfb302140225, 0xdd870fa1b7c4700f2bd7f44238821c26f7392148];
    uint totalRecibido = 0;
    mapping (address => uint) cantidadesRetiradas;
    
    function Dividir() payable{
        updateTotalRecibido();
    }

    function() payable{
        updateTotalRecibido();    
    }
    
    function updateTotalRecibido() internal{
        totalRecibido += msg.value;
    }
    
    modifier puedeRetirar(){
        bool puede = false;
        for(uint i=0; i<empleados.length; i++){
            if(empleados[i] == msg.sender){
                puede = true;
            }
        }
        require(puede);
        _;
    }
    
    function retirar() puedeRetirar{
        
        uint cantidadAsignada = totalRecibido/empleados.length;
        uint cantidadRetirada = cantidadesRetiradas[msg.sender];
        uint cantidad = cantidadAsignada - cantidadRetirada;
        cantidadesRetiradas[msg.sender] = cantidadRetirada + cantidad;
        
        if(cantidad > 0){
            msg.sender.transfer(cantidad);
        }
        
        
    }