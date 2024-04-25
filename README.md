# Jokers Addon for World of Warcraft

**Jokers** is an advanced World of Warcraft addon designed to enhance guild management by automating recruitment processes such as advertising, replying, and inviting. Tailored to both guild and group management, Jokers offers flexibility and a rich set of features that simplify interactions with potential guild or group members.

## Features

- **Automated Advertising**: Automatically send customized messages in designated channels at set intervals.
- **Auto-Reply**: Automatically respond to whispers based on pre-defined triggers.
- **Auto-Invite**: Automatically invite players to your guild or group based on specific phrases they send.
- **Flexible Invite Options**: Choose between guild invites and group invites with a simple command.
- **Blacklist Functionality**: Avoid spam by ensuring that players who have already been contacted are not bothered again.
- **Easy Configuration**: Configure settings through simple in-game commands.
- **Debug Mode**: For troubleshooting and ensuring smooth operation.

## Installation

1. **Download the Addon**:
   - Download the ZIP file from the [Releases](https://github.com/crisisdw/jokers/releases) page.

2. **Extract the ZIP File**:
   - Extract the contents of the ZIP file into your World of Warcraft `./Interface/AddOns` directory.

3. **Verify Installation**:
   - Start World of Warcraft and click on the AddOns menu at the character select screen. Ensure that "Jokers" is listed and enabled.

## Usage

Manage Jokers entirely via in-game slash commands:

- `/joker`: Toggle the addon on or off.
- `/joker help`: Display all available commands.
- `/joker settings`: Display current settings with color-coded output.
- `/joker reply`: Toggle automatic whisper replies on or off.
- `/joker inv`: Toggle automatic invites on or off.
- `/joker setmsg "Your Message"`: Set the advertisement message.
- `/joker setreply "Your Message"`: Set the auto-reply message.
- `/joker setinterval X`: Set the interval in seconds between advertisements.
- `/joker setchannel ChannelName`: Set the channel name for advertisements.
- `/joker debug`: Toggle debug mode.

## Configuration Examples

To set up Jokers for guild recruitment:

```plaintext
/joker setmsg "Join Jokers today for raiding and fun!"
/joker setreply "Thanks for your interest! Type "invite", "inv" or "can i join" for an automatic invite!"
/joker setinterval 300
/joker setchannel General
