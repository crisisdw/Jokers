# Jokers
Addon specializing in Guild Recruitment

Jokers Addon
Jokers is a fully automated World of Warcraft addon designed to facilitate guild recruitment and management. It streamlines the process of advertising guild recruitment messages, automating replies to whispers, and handling guild invites based on customizable triggers.

Features
Automated Guild Advertising: Automatically post guild recruitment messages in specified channels at set intervals.
Auto-Reply: Automatically reply to whispers based on predefined messages.
Auto-Invite: Automatically invite players who request an invite using specific trigger phrases.
Blacklist Functionality: Prevent spam by not re-inviting or replying to players who have already been contacted.
Customizable Settings: Easily change messages, intervals, channels, and toggle functionalities through in-game commands.
Debug Mode: Enable or disable debug messages for troubleshooting.
Installation
Download the Addon:
Download the latest version of Jokers from the official repository or addon manager.
Extract Files:
Extract the downloaded zip file into your World of Warcraft _retail_/Interface/AddOns directory.
Verify Installation:
Launch World of Warcraft, go to the AddOns menu from the character select screen, and ensure that Jokers is listed and enabled.
Usage
Jokers is controlled entirely through in-game slash commands. Below are the available commands to manage various functionalities:

General Commands
/joker: Toggle the addon on or off.
/joker help: Display a list of available commands.
Configuration Commands
/joker setmsg "Your message": Set the advertisement message.
/joker setreply "Your message": Set the auto-reply message.
/joker setinterval X: Set the interval (in seconds) between advertisement messages.
/joker setchannel ChannelName: Set the channel for advertisements.
/joker settings: Display current settings.
Toggle Commands
/joker reply: Toggle the automatic reply feature on or off.
/joker inv: Toggle the automatic invite feature on or off.
/joker debug: Toggle debug mode on or off.
Blacklist Management
/joker blacklist PlayerName: Add a player to the blacklist to prevent further automated interactions.
Customization
Edit the Lua file directly to modify more advanced settings or behavior. Ensure you are familiar with Lua scripting and the World of Warcraft API to make effective changes.

Support
If you encounter issues or have suggestions, please submit them to the issue tracker on the official addon repository page.

Contributing
Contributions are welcome! If you have improvements or bug fixes, please fork the repository and submit a pull request.

License
Jokers is released under the MIT license. See the LICENSE file for more details.
