# ImmyBotApiWrapper
A PowerShell wrapper for the ImmyBot REST API https://immy.bot/

I am not affliated with ImmyBot in anyway and this project is not maintained or supported by the people at ImmyBot in anyway. 
The ImmyBot REST API is not officially documented and not officially supported by ImmyBot. The API is also subject to change at any moment.
Use this project at your own risk especially if you are not exclusively running GET methods.

# To Do
- Provide function for all valid 'Remove' endpoints (ex: remove immy user)
- Provide function for all valid 'New' endpoints (ex: new immy user)
- Provide function for all valid 'Invoke' endpoints (ex: re-run maintenance on an immy computer)
- Allow pipeline input
- Allow optionally saving authToken and apiEndpointUri in memory so its not needed as a parameter for each function
- Create auto complete options for various function parameters (ex: ImmyComputerID)