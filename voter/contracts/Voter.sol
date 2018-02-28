pragma solidity ^0.4.19;

contract Voter {

    struct Topic {
        string topicID;
        uint numUpVotes;
        uint numDownVotes;
    }

    // mapping of user address to mapping of topics that user can vote on
    mapping(address => Topic[]) public voterPermissions;
    
    // mapping of topicIDs to Topic structs
    mapping(string => Topic) public topics;

    function Voter() public {
    }

    /**
     * Create topic by adding a Topic struct to the topics mapping
     * and giving each eligible voter 1 vote for the current topicTitle.
     */
    function createTopic(string topicTitle, address[] eligibleVoters, uint voteTime, string[] options) public {
        
        // TODO: check valid address, edge cases etc.

        topics[topicTitle] = Topic(topicTitle, 0, 0);

        // give each eligible voter 1 vote for topicTitle
        for (uint j = 0; j < eligibleVoters.length; j++) {
            voterPermissions[eligibleVoters[j]].push(Topic(topicTitle, 0, 0));
        }
    }

    function vote() public {
    }

    /* 
     * Getter functions:
     */

    function getTopics() view {
        // get all topics of Voter
    }

    function getOptions(string topicID) view {
        // get all the voting options for topicID
    }

    function getVotes(string topicID, string option) view {
        // get all current votes for option for topicID
    }
}
