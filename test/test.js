const { expect } = require("chai");

describe("UnrealWorlds", function () {
    it("Should return the right name and symbol", async function () {
        const UnrealWorlds = await hre.ethers.getContractFactory("UnrealWorlds");
        const unrealWorlds = await UnrealWorlds.deploy("UnrealWorlds", "UW");

        await unrealWorlds.deployed();
        expect(await unrealWorlds.name()).to.equal("UnrealWorlds");
        expect(await unrealWorlds.symbol()).to.equal("UW");
    });
});