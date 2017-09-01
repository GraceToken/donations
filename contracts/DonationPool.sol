pragma solidity ^0.4.15;

import './SafeMath.sol';

contract ERC20Token {
	function balanceOf(address _owner) constant returns (uint balance);
	function transfer(address _to, uint _value) returns (bool success);
	event Transfer(address indexed _from, address indexed _to, uint _value);
}

/**
 * @title DonationPool
 * @dev DonationPool is a base contract for collecting GRCE tokens, locking them until release conditions are met.
 * To make a contribution to the token, the donor calls `token.transfer(donationPoolAddress, value)` 
 */
contract DonationPool {
	using SafeMath for uint256;

	address public beneficiary;
	address public tokenAddress = 0x24ca74090c7496d34b7e1431f09a541110dc7453;	// test RPC address
	// address public tokenAddress = 0x00068577b0c0edef1386d12572b407da65820b825b;	// Ropsten
	// address public tokenAddress = 0x66a795d2d285c542df00ebcaa7c42fa8897c2c55;	// Main net

	uint256 public releaseTime;

	ERC20Token public graceToken;

	event Withdrawal(address to, uint256 value);

	function DonationPool(address _beneficiary, uint256 _releaseTime) { 
		beneficiary = _beneficiary;
		releaseTime = _releaseTime;
		graceToken = ERC20Token(tokenAddress);
	}

	function withdraw(uint256 value) returns(bool successful) {
		if (msg.sender != beneficiary || value > balance() || !canWithdraw()) return false;
		
		if (!graceToken.transfer(beneficiary, value)) {
			return false;
		}

		Withdrawal(beneficiary, value);
		return true;
	}

	function balance() constant returns (uint balance) {
		return graceToken.balanceOf(address(this));
	}

	function canWithdraw() public constant returns (bool) {
		return now > releaseTime;
	}
}
