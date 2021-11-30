# unreal-world

Deploy your own ERC-721 contracts to the Ethereum blockchain and mint your NFTs!

## Create a .env file with the following values:

API_URL="" // Create an application with Alchemy and grab the API url 

PRIVATE_KEY="" // Don't ever share private keys with anyone! Get this from metamask or your wallet of choice. 

PUBLIC_KEY="" // Your wallet address 


## Replace mint-nft.js values 

- Upload your files to Pinata and replace mint-nft.js values with the new URLs. 

## Deploy! 

- `npx hardhat compile`
- `npx hardhat run scripts/deploy.js --network ropsten` 
- `node scripts/mint-nft.js`

