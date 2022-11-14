# ImmyBotApiWrapper
A PowerShell wrapper for the ImmyBot REST API https://immy.bot/

I am not affliated with ImmyBot in anyway and this project is not maintained or supported by the people at ImmyBot in anyway. 
The ImmyBot REST API is not officially documented and not officially supported by ImmyBot. The API is also subject to change at any moment.
Use this project at your own risk especially if you are not exclusively running GET methods. Note that this module is also subject to frequent changes while
I learn about the ImmyBot API through trial and error.

# Endpoint Documentation
To assist others who just want some documentation on the API as there is no official documentation (yet) I have started to document endpoints that I know of [here](https://github.com/serialscriptr/ImmyBotApiWrapper/tree/main/Endpoint%20Documentation/GET). Note that the names of the endpoints in my documentation are not official.

# Running the module
For a quick way to load the module's functions into memory run the following
> (new-object Net.WebClient).DownloadString('https://raw.githubusercontent.com/serialscriptr/ImmyBotApiWrapper/main/ImmyBot%20Web%20Api%20Wrapper/ImmyBotApiWrapper.psm1') | iex

Alternatively download and import the module using Import-Module

# To Do
- Provide function for all valid 'Remove' endpoints (ex: remove immy user)
- Provide function for all valid 'New' endpoints (ex: new immy user)
- Provide function for all valid 'Invoke' endpoints (ex: re-run maintenance on an immy computer)
- Allow pipeline input
- Create auto complete options for various function parameters (ex: ImmyComputerID)
