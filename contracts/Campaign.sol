//SPDX-License-Identifier: UNLICENSED
pragma solidity >0.7.0 <=0.9.0;

contract CampaignFactory {
    address[] public deployedCampaign;

    event campaignCreated(
        string title,
        uint requiredAmount,
        address indexed owner,
        address  campaignAddress,
        string imgURI,
        uint indexed timestamp,
        string indexed category
    );

    function createCampaign(
        string memory campaignTitle,
        uint requiredCampaignAmount,
        string memory imgURI,
        string memory category,
        string memory storyURI
    ) public 
    {
        Campaign newCampaign = new Campaign(
            campaignTitle,requiredCampaignAmount,imgURI,storyURI
        );
        deployedCampaign.push(address(newCampaign));

        emit campaignCreated(campaignTitle, requiredCampaignAmount, msg.sender, address(newCampaign), imgURI, block.timestamp, category);
    }
}

contract Campaign {
    string public title = "Campaign Test";
    uint public requiredAmount;
    string public image;
    string public story;
    address payable public owner;
    uint public receivedAmount;

    event donated(address indexed donor,uint indexed amount,uint indexed timestamp);

    constructor(
    string memory Campgaintitle,
    uint requiredCampaignAmount,
    string memory imgURI,
    string memory storyURI
    
    ){
        title = Campgaintitle;
        requiredAmount = requiredCampaignAmount;
        image = imgURI;
        story = storyURI;
        owner = payable(msg.sender);

    }

    function donate() public payable {
        require(requiredAmount > receivedAmount, "Donation Amount Fulfilled");
        owner.transfer(msg.value);
        receivedAmount += msg.value;
        emit donated(msg.sender, msg.value, block.timestamp);
    } 



}
