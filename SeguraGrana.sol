pragma solidity 0.5.0;

contract SeguraGrana {
    address payable destino;
    address gerente;
    event Retirada(address payable destino, uint256 saldo);
    
    constructor() public {
        gerente = msg.sender;
    }
    
    function entrar() public payable {
    }
    
    function getSaldo() public view returns (uint) {
        return address(this).balance;
    }
    
    function getAddress() public view returns (address) {
        return address(this);
    }
    
    function getDestinoAddress() public view returns (address payable) {
        return destino;
    }
    
    function setDestino(address payable _destino) public {
        destino = _destino;
    }
    
    function retirada() public returns (bool) {
        require(gerente == msg.sender);
        if (destino != 0x0000000000000000000000000000000000000000) {
            destino.transfer(address(this).balance);
            emit Retirada(destino, address(this).balance);
            return true;
        } else {
            return false;
        }
    }
}