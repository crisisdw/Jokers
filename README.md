Jokers Addon for World of Warcraft
Jokers is an advanced World of Warcraft addon designed to enhance guild management by automating recruitment processes such as advertising, replying, and inviting. Tailored to both guild and group management, Jokers offers flexibility and a rich set of features that simplify interactions with potential guild or group members.

Features
Automated Advertising: Automatically send customized messages in designated channels at set intervals.
Auto-Reply: Automatically respond to whispers based on pre-defined triggers.
Auto-Invite: Automatically invite players to your guild or group based on specific phrases they send.
Flexible Invite Options: Choose between guild invites and group invites with a simple command.
Blacklist Functionality: Avoid spam by ensuring that players who have already been contacted are not bothered again.
Easy Configuration: Configure settings through simple in-game commands.
Debug Mode: For troubleshooting and ensuring smooth operation.
Installation
Download the Addon:
Download the ZIP file from the Releases page.
Extract the ZIP File:
Extract the contents of the ZIP file into your World of Warcraft _retail_/Interface/AddOns directory.
Verify Installation:
Start World of Warcraft and click on the AddOns menu at the character select screen. Ensure that "Jokers" is listed and enabled.
Usage
Manage Jokers entirely via in-game slash commands:

/joker: Toggle the addon on or off.
/joker help: Display all available commands.
/joker settings: Display current settings with color-coded output.
/joker reply: Toggle automatic whisper replies on or off.
/joker inv: Toggle automatic invites on or off.
/joker setmsg "Your Message": Set the advertisement message.
/joker setreply "Your Message": Set the auto-reply message.
/joker setinterval X: Set the interval in seconds between advertisements.
/joker setchannel ChannelName: Set the channel name for advertisements.
/joker toggleinvite: Toggle between sending guild or group invites.
/joker debug: Toggle debug mode.
Configuration Examples
To set up Jokers for guild recruitment:

plaintext
Copy code
/joker setmsg "Join Jokers today for raiding and fun!"
/joker setreply "Thanks for your interest! Please hold for an invite."
/joker setinterval 300
/joker setchannel General
/joker toggleinvite  -- Make sure this is set to guild invites
For managing a group event like a raid or dungeon:

plaintext
Copy code
/joker setmsg "Looking for more for Mythic Dungeons!"
/joker setreply "Please send your spec and ilvl."
/joker setinterval 120
/joker setchannel LookingForGroup
/joker toggleinvite  -- Set this for group invites
Contributing
Contributions are welcome! If you'd like to help improve the Jokers addon, please fork the repository and submit a pull request with your changes. You can also open issues for bugs you've found or features you think would be beneficial.

License
This project is licensed under the MIT License - see the LICENSE.md file for details.
