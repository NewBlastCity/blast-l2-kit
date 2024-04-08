
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import "../IWETHRebasing.sol";
import "../../lib/openzeppelin-contracts/contracts/access/Ownable.sol";


contract WETHRebasingExample  is Ownable{
        address public WETH = 0x4300000000000000000000000000000000000004;

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

    // Send a specify amount of Eth and get  WETH
    // When you send a specif  amount ETH to the WETH contract address, 
    //the default function on the contract will be excuted  and  equall amount of WETH will be send back.
    function depositETH( uint256 _amount) external onlyOwner {
        require(WETH != address(0), "Invalid contract address");
        require(_amount > 0, "Invalid amount");
        
        (bool success, ) = WETH.call{value: _amount}("");
        require(success, "Ether transfer to contract failed");
    }
}
