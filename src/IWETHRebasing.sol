pragma solidity ^0.8.23;


interface IWETHRebasing {
       /// Deposit/swap ETH for WETH (swap ETH for WETH).
    function deposit() external payable;

    /// Withdraw7swap ETH from WETH.
    /// @param wad Amount of ETH to withdraw. 
    function withdraw(uint256 wad) external;

    ///  Get the  and return the current share price.
    /// @return Current share price.
    function sharePrice() external view returns (uint256);

    /// Get the total count of shares.
    /// @return Total count of shares.
    function count() external view returns (uint256);
}