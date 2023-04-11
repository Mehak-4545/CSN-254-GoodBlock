// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.0 <0.9.0;

contract Ngo{

    struct ngo{
            string name;
            string email;
            string password;
            string contact;
            string Address;
            
        }

    struct campaign{
        string name_campaign;
        string motto;
        uint amount;
    }
    
    uint max_users= 50;

    event ngo_created(ngo, uint id);
    event if_loggedin(bool successful_login);
    event camp_created(campaign);


    ngo[] public Ngos;
    campaign[] public Campaigns;

    mapping(address => ngo) ngo_Users;//map to store ngo corresponding to user address
    mapping(address => string) Password;//map to store password string corresponding to user address
    mapping(uint => address) User_Ids;//map to reference addresses using userid
    mapping(address => campaign) User_camp;//map to reference addresses using userid
    

    function _createNgo(string calldata _name, string calldata _email,string calldata _password,string calldata _contact,string calldata _Address) internal {
        ngo memory new_Ngo = ngo( _name,  _email, _password, _contact, _Address);
        Ngos.push(new_Ngo);
        ngo_Users[msg.sender]=new_Ngo;
        Password[msg.sender]=_password;
        uint id = uint(keccak256(abi.encodePacked(_name)))%max_users;
        User_Ids[id]=msg.sender;
        emit ngo_created(new_Ngo,id);

    }

    function _signup (string calldata _name, string calldata _email,string calldata _password,string calldata _contact,string calldata _Address) public{
        _createNgo(_name,  _email, _password, _contact , _Address);
        //confirm not implemented
    }

    function _login (uint _userid, string calldata _password) public{
        bool is_verified= false;
        if(keccak256(abi.encodePacked(Password[User_Ids[_userid]]))==keccak256(abi.encodePacked(_password))){
            is_verified = true;
        }
        emit if_loggedin(is_verified);

    }

    function _addCampaign(string calldata _name, string calldata _motto , uint  _amount)  public {
        campaign memory new_camp = campaign(_name, _motto, _amount);
        Campaigns.push(new_camp);
        User_camp[msg.sender]=new_camp;
        emit camp_created(new_camp);

    }

    function _withdrawCampaign() public {
        delete User_camp[msg.sender];
    }
   

}
