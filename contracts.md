Three smart contracts (sender, receiver, authentication)

## Data to be stored
- User(individual + corporate) data -> Basic Info, wallet address, authentication info
- NGO data -> Basic Info, wallet address, authentication info, campaigning info, amount received, limit, etc.

## Functions
### Payment related
- Coporate to NGO
- Individual to NGO

### Others
#### Individual/corporate
- Login
- Create new user
- See all NGOs + their campaigns
- Donate 

#### NGO
- Login
- Sign up
- Put up campaign
- Remove campaign

#### Admin page
- View all NGOs pending for verification
- Update verification state

### Algorithms - 
#### Login
Check username and password
If correct:
    Successful Login
Else:
    Bad credentials
#### Signup
Is request sender NGO
If yes
    Update in NGO data
Else
    create new user
#### See all NGOs + their campaigns
Access NGO information and return it
#### Payment
Check Gas Limit, etc
Call inbuilt function to send amount from sender to receiver
#### Put up and remove campaign
Update campaign information structure
#### Verify NGO
Is NGO successfully verified to be correct
If yes
    Then update active NGO information
Else
    Remove from requests