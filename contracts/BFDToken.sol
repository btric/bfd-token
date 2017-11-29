pragma solidity ^0.4.18;

// ----------------------------------------------------------------------------
// 'BTRIC Founding Donor' Ethereum ERC20 Token smart contract
//
// Symbol      : BFD
// Name        : BTRIC Founding Donor Token
// Total supply: 500000
// Decimals    : 8
//
// License     : MIT
// Website     : https://www.btric.org
// ----------------------------------------------------------------------------

import "zeppelin-solidity/contracts/token/StandardToken.sol";
import "zeppelin-solidity/contracts/ownership/Ownable.sol";

contract BFDToken is StandardToken, Ownable {
  string public name = "BTRIC Founding Donor Token"; 
  string public symbol = "BFD";
  uint public decimals = 8;
  uint public INITIAL_SUPPLY = 500000 * (10 ** decimals);

  function BFDToken() public {
    totalSupply = INITIAL_SUPPLY;
    balances[msg.sender] = INITIAL_SUPPLY;
  }

  // ------------------------------------------------------------------------
  // Don't accept ETH
  // ------------------------------------------------------------------------
  function () public payable {
    revert();
  }

  // ------------------------------------------------------------------------
  // Owner can transfer out any accidentally sent ERC20 tokens
  // ------------------------------------------------------------------------
  function transferAnyERC20Token(address tokenAddress, uint tokens) public onlyOwner returns (bool success) {
    return ERC20(tokenAddress).transfer(owner, tokens);
  }
}
