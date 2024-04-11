
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import "../IWETHRebasing.sol";
import "../../lib/openzeppelin-contracts/contracts/access/Ownable.sol";


contract WETHRebasingExample  is Ownable{
    address public WETH = 0x4300000000000000000000000000000000000004;

    IWETHRebasing public constant wethRebase = IWETHRebasing(0x4300000000000000000000000000000000000004);
    
    constructor(address _initialOwner) Ownable(_initialOwner) {}

    /// Deposit/swap ETH for WETH
    function deposit() external onlyOwner {
      wethRebase.deposit();
    }

    /// Swap/withdraw ETH from WETH
    /// @param wad amount of ETH to be withdraw from WETH
    function withdraw( uint256 wad) external onlyOwner{
        wethRebase.withdraw(wad);
    }
    
    /// Get the total number of shares that has been distributed.
    function count () external view returns (uint256){
     uint256 _count =  wethRebase.count();
     return _count;
    }

    /// Retrieve the current share price based on the current contract balance.
    /// @return Current share price.
    function sharePrice() external view  returns(uint256){
       uint256 _sharedPrice =  wethRebase.sharePrice();
       return _sharedPrice; 
    }

    // Send a specific amount of Eth and get WETH
    // When you send a specific amount ETH to the WETH contract address, 
    // the default function on the contract will be excuted and equal amount of WETH will be send back.
    function depositETH( uint256 _amount) external onlyOwner {
        require(WETH != address(0), "Invalid contract address");
        require(_amount > 0, "Invalid amount");
        
        (bool success, ) = WETH.call{value: _amount}("");
        require(success, "Ether transfer to contract failed");
    }
}
