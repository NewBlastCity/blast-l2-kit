// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import "../../lib/openzeppelin-contracts/contracts/access/Ownable.sol";
import "../IBlast.sol";
import "../IBlastPoints.sol";

contract BKitExampleClaimableYield is Ownable {

    // BLAST CONTRACTS
    address public BLAST_GAS_YIELD_CONTRACT = 0x4300000000000000000000000000000000000002;
    address public BLAST_POINTS_CONTRACT = 0x2536FE9ab3F511540F2f9e2eC2A805005C3Dd800;

    constructor(
      address _initialOwner,
      address _blastOperator
    ) Ownable(_initialOwner) {
        IBlast(BLAST_GAS_YIELD_CONTRACT).configureClaimableYield();
        IBlast(BLAST_GAS_YIELD_CONTRACT).configureClaimableGas();
        IBlastPoints(BLAST_POINTS_CONTRACT).configurePointsOperator(_blastOperator);
    }


    // BLAST Functions
    function setBlastGasYieldAddress(address _addr) external onlyOwner {
        BLAST_GAS_YIELD_CONTRACT = _addr;
    }

    function setBlastPointsAddress(address _addr) external onlyOwner {
        BLAST_POINTS_CONTRACT = _addr;
    }

    /*
      Even though we run these in constructor already, good to have 
      this failsafe in the contract. 
    */
    function configureBlastGasYield() external onlyOwner {
        IBlast(BLAST_GAS_YIELD_CONTRACT).configureClaimableYield();
        IBlast(BLAST_GAS_YIELD_CONTRACT).configureClaimableGas();
    }

    function configureBlastPointsOperator(address _operator) external onlyOwner {
        IBlastPoints(BLAST_POINTS_CONTRACT).configurePointsOperator(_operator);
    }

    /*
      Claim a specific amount of yield.
    */
    function claimYield(address _recipient, uint256 _amount) external onlyOwner {
        IBlast(BLAST_GAS_YIELD_CONTRACT).claimYield(address(this), _recipient, _amount);
    }

    /*
      Claim all yield on the contract
    */
    function claimAllYield(address _recipient) external onlyOwner {
        IBlast(BLAST_GAS_YIELD_CONTRACT).claimAllYield(address(this), _recipient);
    }


    /*
      If you’d like to maximize the amount of gas fees, then you can use 
      claimMaxGas to guarantee a 100% claim rate. Only gas fees that have 
      fully matured (30 days) will be claimed. Any remaining fees after 
      calling this function will remain in the Blast Gas contract for you 
      to claim later.
    */
    function claimMaxGas(address _recipient) external onlyOwner {
        IBlast(BLAST_GAS_YIELD_CONTRACT).claimMaxGas(address(this), _recipient);
    }

    /*
      To claim all of your contract’s gas fees, regardless of
      your resulting claim rate, you can call claimAllGas. Your 
      resulting claim rate may be anywhere from 50% to 100% depending 
      on how long it has been since the fees were earned.
    */
    function claimAllGas(address _recipient) external onlyOwner {
        IBlast(BLAST_GAS_YIELD_CONTRACT).claimAllGas(address(this), _recipient);
    }

    /*
      Allows you to claim the maximum amount of gas fees while 
      guaranteeing a specific claim rate. If you’re comfortable with 
      an 80% claim rate, that translates to 8000 bip. Calling this 
      function with a 100% min claim rate is the same as calling claimMaxGas.
    */
    function claimGasAtMinClaimRate(address _recipient, uint256 _claimRateBips) external onlyOwner {
        IBlast(BLAST_GAS_YIELD_CONTRACT).claimGasAtMinClaimRate(address(this), _recipient, _claimRateBips);
    }

    function readClaimableGas() public view returns (uint256) {
        (, uint256 etherBalance, , ) = IBlast(BLAST_GAS_YIELD_CONTRACT).readGasParams(address(this));
        return etherBalance;
    }


    receive() external payable {}
}