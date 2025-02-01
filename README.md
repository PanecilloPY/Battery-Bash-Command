Here’s the `README.md` content translated into English, formatted for GitHub. You can copy and paste this directly into a `README.md` file in your repository:

```markdown
# Battery Status Script

This is a Bash script that displays the current battery status on a Linux system, including the battery level and whether it is charging or not. The script uses colors and a graphical bar to visually represent the battery level.

## Requirements

- A Linux system with a battery (e.g., a laptop).
- Access to system files in `/sys/class/power_supply/BAT0/`.

## How to Use

1. Save the script to a file, for example, `battery.sh`.
2. Make the script executable:
   ```bash
   chmod +x battery.sh
   ```
3. Run the script:
   ```bash
   ./battery.sh
   ```

## Script Explanation

### Main Variables

- `BATTERY_LEVEL`: Retrieves the battery charge level as a percentage.
- `BATTERY_STATUS`: Retrieves the battery status (Charging, Full, Not charging).

### Colors and Progress Bar

- The script assigns a color to the battery level based on its percentage:
  - **Green** (`\033[32m`): 80% or higher.
  - **Light Green** (`\033[32m`): 60% to 79%.
  - **Yellow** (`\033[33m`): 40% to 59%.
  - **Orange** (`\033[33m`): 20% to 39%.
  - **Red** (`\033[31m`): Less than 20%.

- The progress bar consists of filled blocks (`█`) and empty blocks (`░`), with a total length of 10 blocks.

### Battery Statuses

- **Charging** (`⚡ Charging`): The battery is plugged in and charging.
- **Full** (`🔋 Full`): The battery is fully charged.
- **Not charging** (`🔋 Not charging`): The battery is not plugged in and is not charging.

### Example Output

The script will generate an output similar to the following:

```bash
[+] Battery: 85% | █████████░ | ⚡ Charging
```

Where:
- The battery percentage is displayed in color (green, yellow, orange, or red).
- The progress bar shows how much of the battery is charged.
- The battery status indicates whether it is charging, full, or not charging.

## Customization

- You can adjust the length of the progress bar by modifying the `BAR_LENGTH` variable.
- You can change the colors or the bar characters (`FULL_BLOCK` and `EMPTY_BLOCK`) to customize the appearance.

## Contributions

If you would like to contribute to this project, feel free to fork it and submit a pull request with your improvements.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
