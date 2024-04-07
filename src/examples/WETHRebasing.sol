
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import "../IWETHRebasing.sol";
import "../../lib/openzeppelin-contracts/contracts/access/Ownable.sol";


contract WETHRebasingExample  is Ownable{
    IWETHRebasing  public constant  wethRebase   = IWETHRebasing(0x4300000000000000000000000000000000000004);  // Wet WETHRebasing
    
    constructor(address _initialOwner) Ownable(_initialOwner) {}

    // deposit/swap ETH  for WETH
    function deposit() external onlyOwner {
      wethRebase.deposit();
    }

    //swap/withdraw  ETH from WETH
    // @param  amount of ETH want to withdraw  from WETH
    function withdraw( uint256 wad) external onlyOwner{
        wethRebase.withdraw(wad);
    }
    
    function count () external onlyOwner{
       wethRebase.count();
    }

    function sharePrice() external onlyOwner{
        wethRebase.sharePrice();
    }
}
