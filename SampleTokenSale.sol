// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

abstract contract ERC20{

    function transferFrom(address _from, address _to, uint256 _value) public virtual  returns (bool success);
    function decimals() public  virtual  view returns(uint8); 


}

contract TokenSale{

    uint public  TokenPriceInwei = 1 ether;

    ERC20  public token;
    address  public tokenowner;
    constructor(address _token){
        tokenowner = msg.sender;
        token = ERC20(_token);
    }

    function purchasecoffe()  public payable{
        require(msg.value >= TokenPriceInwei ,"you dont have enough money");
        uint tokenstotransfer = msg.value / TokenPriceInwei;
        uint remainder = msg.value - tokenstotransfer * TokenPriceInwei;
        token.transferFrom(tokenowner, msg.sender, tokenstotransfer * 10**token.decimals());
        payable(msg.sender).transfer(remainder);// send the rest of the money back


    }
}