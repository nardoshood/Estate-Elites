# Estate Elites
## Introduction

Estate Elites is a decentralized application (dapp) for real estate management built on the Celo blockchain. It allows users to list, buy, and sell properties using smart contracts.

## Features 
- Property Listing: Users can create listings for properties they want to sell. Each listing contains details such as the property address, price, description, and media files.
- Property Search: Users can search for available properties based on location, price range, or other criteria.
- Buying and Selling: Users can interact with the smart contract to buy or sell properties. Transactions are securely executed using Ethereum.
- Ownership Management: The smart contract maintains ownership records and enables transfer of property ownership between users.

### Getting Started 
#### Prerequisites

- Node.js: Make sure you have Node.js installed on your machine.
- Celo Extension Wallet: Install the Celo Extension Wallet in your browser to interact with the Celo network.

#### Installation
1. Clone the repository:
        
        git clone git@github.com:nardoshood/Estate-Elites.git


2. Install dependencies:

        cd Estate-Elites
        npm install

3. Configure the project:
     
     create a .env file and save your phrase key to MNEMONIC

4 Compile and deploy smart contracts:

    npx hardhat compile
    npx hardhat deploy

5. Start the server:

        npm run start


### Acknowledgements
- OpenZeppelin: Used for smart contract development and security.
- Hardhat: Used as the development environment and testing framework.
- React: Used for building the user interface.
- Celo developer docs: Used to understand the develpment enviroment. 