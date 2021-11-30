# eth-nfts

Deploy your own ERC-721 contracts to the Ethereum blockchain and mint your NFTs!
This tutorial will deploy to the Ropsten test network - there are about 5 test networks but Ropsten is the easiest to get test ETH for. Go here to get some test eth in your Ropsten wallet: https://faucet.ropsten.be/

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

And voila - look at your Ropsten test wallet in Metamask and you should see your nft! This is what I see: 
![WhatsApp Image 2021-11-27 at 3 29 24 PM](https://user-images.githubusercontent.com/9842449/144080764-b8b697ca-e4cf-4a8d-b019-5fb3bcaed8f6.jpeg)
