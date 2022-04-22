require("dotenv").config()
const API_URL = process.env.API_URL
const PUBLIC_KEY = process.env.PUBLIC_KEY;
const PRIVATE_KEY = process.env.PRIVATE_KEY;

const { createAlchemyWeb3 } = require("@alch/alchemy-web3")
const web3 = createAlchemyWeb3(API_URL)

const contract = require("../artifacts/contracts/BucketList.sol/BucketList.json")
const contractAddress = "0x6fE449D92a328A7D2baa4c3d5e351D05DeeC09Bf"
const nftContract = new web3.eth.Contract(contract.abi, contractAddress)

async function printAbi() {
    console.log(JSON.stringify(contract.abi));
}

async function mintNFT() {
    const nonce = await web3.eth.getTransactionCount(PUBLIC_KEY, 'latest'); //get latest nonce
    const maxPriorityFee = await web3.eth.getMaxPriorityFeePerGas();

    //the transaction
    const tx = {
        'from': PUBLIC_KEY,
        'to': contractAddress,
        'nonce': nonce,
        'gas': 500000,
        'maxPriorityFeePerGas': maxPriorityFee,
        'data': nftContract.methods.mintNFT(PUBLIC_KEY).encodeABI(),
        'value': 700000000000000000,
    };

    const signPromise = web3.eth.accounts.signTransaction(tx, PRIVATE_KEY)
    signPromise
        .then((signedTx) => {
            web3.eth.sendSignedTransaction(
                signedTx.rawTransaction,
                function (err, hash) {
                    if (!err) {
                        console.log(
                            "The hash of your transaction is: ",
                            hash,
                            "\nCheck Alchemy's Mempool to view the status of your transaction!"
                        )
                    } else {
                        console.log(
                            "Something went wrong when submitting your transaction:",
                            err
                        )
                    }
                }
            )
        })
        .catch((err) => {
            console.log(" Promise failed:", err)
        })
}

printAbi()

// mintNFT()

// mintNFT("https://gateway.pinata.cloud/ipfs/QmVsDzFJWNU9drbysyqGEoVMUhH366YTErdKUUc53yfLMK/1")

// mintNFT("https://gateway.pinata.cloud/ipfs/QmVVyNxfRVNRzVuFNtQxKn8Vw2zqa5RZ97iSGLgU13fnqX")