
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import "../../lib/openzeppelin-contracts/contracts/access/Ownable.sol";
import "../IERC20Rebasing.sol";

contract BKitExampleChangeYieldWethAndUsdb is Ownable {

    IERC20Rebasing public constant USDB = IERC20Rebasing(0x4300000000000000000000000000000000000003);
    IERC20Rebasing public constant WETH = IERC20Rebasing(0x4300000000000000000000000000000000000004);

    constructor(address _initialOwner) Ownable(_initialOwner) {}

    function configureUsdbYieldClaimable() external onlyOwner {
        USDB.configure(YieldMode.CLAIMABLE);
    }

    function configureUsdbYieldAutomatic() external onlyOwner {
        USDB.configure(YieldMode.AUTOMATIC);
    }

    function configureWethYieldClaimable() external onlyOwner {
        WETH.configure(YieldMode.CLAIMABLE);
    }

    function configureWethYieldAutomatic() external onlyOwner {
        WETH.configure(YieldMode.AUTOMATIC);
    }

    receive() external payable {}
}
