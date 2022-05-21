//SPDX-License-Identifier:MIT

pragma solidity ^0.8.0;

//@title Decentralized Library (Read to Earn)
///@author Khadeejah, Blessing Emah, Maureen


contract Escrow{

    //contract name of the contract address - inheritance
     address payable public reader;
    address public escrow; //the smart contract holds the token
    uint public amount;

    constructor(address payable _reader, uint _amount) {
        reader = _reader;
        amount = _amount;
        escrow = msg.sender; 
    }

    function deposit() payable public{
       require(msg.sender == escrow, "Sender must be the contract");
       require(address(this).balance <= amount);

    }
//release funds - 
    function release() public {
        require(address(this).balance == amount, "cannot release funds until full amount is sent");
    
        require(msg.sender == escrow, "only lawyer can release funds");
        reader.transfer(amount);    
    }



     function escrowBalance() public view returns(uint bal) {
        return bal = address(this).balance;
    }
}

