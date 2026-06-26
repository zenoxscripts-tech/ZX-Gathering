# ZX-Gathering

Simple and optimized gathering script for FiveM featuring Lumberjack and Miner jobs using ox_lib with support for ox_inventory and tgiann-inventory.

## Features
- Lumberjack and Miner jobs.
- Axe and Pickaxe requirement.
- Skill check before gathering resources.
- Progress bar with animation.
- Per-location cooldown system.
- Server-side distance validation.
- Item rewards after successful gathering.
- TextUI interaction.
- Map blips for all gathering locations.
- Fully configurable locations, rewards, cooldowns, labels, and durations.
- Supports ox_inventory.
- Supports tgiann-inventory.
- Lightweight and easy to configure.

## Requirements
- ox_lib
- ox_inventory **or** tgiann-inventory

## How it Works

### Lumberjack
1. Go to a tree location.
2. Hold an Axe (`weapon_battleaxe`) in your hand.
3. Press **E** to start cutting.
4. Complete the skill check.
5. Wait for the progress bar to finish.
6. Receive wood as a reward.
7. The tree enters a cooldown before it can be gathered again.

### Miner
1. Go to a mining location.
2. Hold a Pickaxe (`weapon_pickaxe`) in your hand.
3. Press **E** to start mining.
4. Complete the skill check.
5. Wait for the progress bar to finish.
6. Receive rocks as a reward.
7. The mining spot enters a cooldown before it can be gathered again.

## Configuration

You can easily configure:

- Gathering locations.
- Progress duration.
- Reward items.
- Reward amount.
- Required tools.
- TextUI labels.
- Notifications.
- Cooldown time.
- Blips.
- Interaction distance.

## Security

- Server-side distance validation.
- Server-side cooldown validation.
- Tool validation.
- Current weapon validation.
- Prevents reward exploitation through client-side event triggering.

## Credits

ZX Scripts Discord: https://discord.gg/9ehW9GJ3ky
