async function main() {
    const UnrealWorld = await ethers.getContractFactory("BucketList");

    const unrealWorld = await UnrealWorld.deploy()

    console.log("BucketList deployed to:", unrealWorld.address);
}

main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });