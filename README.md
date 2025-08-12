# Homebrew Tap for doit

This is a custom Homebrew tap for **doit** - A CLI progress monitor for time-based visualization.

## Installation

### Add the tap and install doit

```bash
brew tap matsuokashuhei/doit
brew install doit
```

### Or install directly from the tap

```bash
brew install matsuokashuhei/doit/doit
```

## Usage

Once installed, you can use doit:

```bash
# Set a 25-minute focus session
doit --duration 25m

# Work until 5 PM today
doit --end "17:00:00"

# Custom start and end times
doit --start "2025-08-12 09:00:00" --end "2025-08-12 17:00:00"
```

## About doit

**doit** is a CLI tool to visualize your time and boost your focus. Set a duration or deadline, and see your progress in real time with colored progress bars.

### Features

- ⏱️ Time-based progress bar
- 🎯 Flexible time formats (`2h`, `2025-08-10 09:00:00`, etc.)
- 🔄 Real-time updates
- 🎨 Colored output
- 🖥️ Cross-platform (Linux/macOS/Windows)

### Repository

Main project: [matsuokashuhei/doit](https://github.com/matsuokashuhei/doit)

## License

MIT License