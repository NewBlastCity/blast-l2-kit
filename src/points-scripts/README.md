# Blast L2 Kit - Points Scripts

This directory includes examples of how to communicate with the Blast API to check and distribute points balance. 

This diretory has it's own package.json environment, to keep the parent package from having too many dependencies. 

## Setup

- run `npm install` in this directory

- rename `.env.example` to `.env` and update with your config variables

- update `sample_data.json` to reflect your points distribution setup

- run scripts in package.json to check/distribute points

After you run a successful distribution, can check it's status by running the following script (replace <batch_id> with your ID):

`npm run check_distribution <batch_id>`

## Blast Endpoints

### MAINNET

URL: `https://waitlist-api.prod.blast.io`

### TESTNET

URL: `https://waitlist-api.develop.testblast.io`