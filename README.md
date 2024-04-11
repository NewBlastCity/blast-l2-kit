# Blast L2 Kit 

[![npm](https://img.shields.io/npm/v/blast-l2-kit)](https://www.npmjs.com/package/blast-l2-kit)

In an effort to bring more standardization and clarity to deploying on Blast L2, we've created this kit to help developers. Import directly into your project to use the Blast interfaces, or reference as a model for your own library. Includes interface for talking to Blast contracts and to configure points operator.

## Installation

To install with [**Hardhat**](https://github.com/nomiclabs/hardhat):

```sh
npm install blast-l2-kit
```

## Contracts

The Solidity interfaces are located in the `src` directory.

```ml
src
├─ IBlast — "Interface for Blast yield contract"
├─ IBlastPoints — "Interface for Blast points operator"
├─ IERC20Rebasing — "Interface to change claim yield for ERC20 tokens (WETH & USDB)"
└─ examples/
   ├─ StandardAutomaticYield — "Setup for a contract with automatic yield"
   ├─ StandardClaimableYield — "Setup for a contract with claimable yield"
   ├─ UpgradeableAutomaticYield - "Setup for an upgradeable contract with automatic yield"
   ├─ ChangeYieldWethAndUsdb - "Example function for changing claim yield on WETH and USDB"
```

## Points Scripts

Within this repo is also a collection of scripts to check and distribute Blast Points. Reference the [README](src/points-scripts/README.md) there for more details.

## Blast Addresses

### MAINNET
| TYPE | ADDRESS |
| -------- | -------- |
| Blast Yield | 0x4300000000000000000000000000000000000002 |
| Blast Points | 0x2536FE9ab3F511540F2f9e2eC2A805005C3Dd800 |
| WETH | 0x4300000000000000000000000000000000000004 | 
| USDB | 	0x4300000000000000000000000000000000000003 | 

### TESTNET
| TYPE | ADDRESS |
| -------- | -------- |
| Blast Yield | 0x4300000000000000000000000000000000000002 |
| Blast Points | 0x2fc95838c71e76ec69ff817983BFf17c710F34E0 |
| WETH | 0x4200000000000000000000000000000000000023 |
| USDB | 0x4200000000000000000000000000000000000022 |

## Read More
- [Receive and claim ETH yield](https://docs.blast.io/building/guides/eth-yield)
- [Receive and claim WETH and USDB yield](https://docs.blast.io/building/guides/weth-yield)
- [Claim Gas Fees](https://docs.blast.io/building/guides/gas-fees)
- [Points Operator](https://docs.blast.io/airdrop/mainnet-points-api/overview)

## Contributing

Feel free to make a pull request. Some things that could be added:
- [ ] foundry support
- [ ] tests
- [ ] deploy scripts for examples
- [ ] example on how to convert WETH -> ETH

Please follow [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/) standard.

## Liability

This is provided on an "as is" and "as available" basis.

We **do not give any warranties** and **will not be liable for any loss** incurred through any use of this codebase.

Code is made available under the MIT License, which disclaims all warranties in relation to the project and which limits the liability of those that contribute and maintain the project, including New Blast City. 
