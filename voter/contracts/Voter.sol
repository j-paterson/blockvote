pragma solidity ^0.4.19;

contract Voter {

    struct Topic {
        address creator;
        string topicTitle;
        string[] options;
        uint topicID;
        mapping(string => uint) optionVotes;
    }

    struct Permission {
        uint topicID;
        uint numVotes;
    }

    // mapping of user address to mapping of topics that user can vote on
    mapping(address => Permission[]) voterPermissions;

    // mapping of topicIDs to Topic structs
    mapping(uint => Topic) topics;

    uint topicCounter;

    function Voter() public {
      topicCounter = 0;
    }

    /**
     * Create topic by adding a Topic struct to the topics mapping
     * and giving each eligible voter 1 vote for the current topicTitle.
     */
    function createTopic(string topicTitle, string[] options, address[] eligibleVoters) public {

        // TODO: check valid address, edge cases, add timer.

        // create new Topic struct
        topics[topicCounter] = Topic(msg.sender, topicTitle, options, topicCounter);

        // give each eligible voter 1 vote for topicTitle
        for (uint j = 0; j < eligibleVoters.length; j++) {
            address a = eligibleVoters[j];
            voterPermissions[a].push(Permission(topicCounter, 1));
        }

        //increment to always have unique id
        topicCounter+=1;
    }

    /**
     * check the users mapping to see if that user has the topic ID in their dictionary and has enough ‘vote’ for it.
     * check the timeFrame to see if voting is over
     * increment option vote amount for that topic
     */
    function vote(uint topicID, string option) public {
      for(uint i = 0; i < voterPermissions[msg.sender].length; i++){
        if((voterPermissions[msg.sender][i].topicID == topicID) && (voterPermissions[msg.sender][i].numVotes > 0)){
          topics[topicID].optionVotes[option]+=1;
        }
      }
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
