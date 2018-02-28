pragma solidity ^0.4.19;

contract Voter {

    struct Topic {
        address creator;
        string topicID;
        uint numUpVotes;
        uint numDownVotes;
    }

    struct Permission {
        string topicID;
        uint numVotes;
    }

    // mapping of user address to mapping of topics that user can vote on
    mapping(address => Permission[]) voterPermissions;
    
    // mapping of topicIDs to Topic structs
    mapping(string => Topic) topics;

    function Voter() public {
    }

    /**
     * Create topic by adding a Topic struct to the topics mapping
     * and giving each eligible voter 1 vote for the current topicTitle.
     */
    function createTopic(string topicTitle, address[] eligibleVoters) public {
        
        // TODO: check valid address, edge cases, add timer.

        // create new Topic struct
        topics[topicTitle] = Topic(msg.sender, topicTitle, 0, 0);

        // give each eligible voter 1 vote for topicTitle
        for (uint j = 0; j < eligibleVoters.length; j++) {
            address a = eligibleVoters[j];
            voterPermissions[a].push(Permission(topicTitle, 1));
        }
    }

    function vote() public {
    }

    /* 
     * Getter functions:
     */

    function getTopics() public view {
        // get all topics of Voter
    }

    function getOptions(string topicID) public view {
        // get all the voting options for topicID
    }

    function getVotes(string topicID, string option) public view {
        // get all current votes for option for topicID
    }
}
