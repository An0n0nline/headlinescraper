# Frontpage Headline Search

Frontpage Headline Search is a Bash script that fetches and searches news headlines from multiple sources using `w3m`. It allows users to perform simple or persistent searches for specific terms in real-time news updates.

## Features
- Fetches news from:
  - CNN (US section)
  - Yahoo News RSS
  - Google News
  - Spidr Today
  - Reddit r/worldnews
- Simple search: Allows users to enter up to three search terms and filter news headlines accordingly.
- Persistent search: Continuously fetches and filters news based on user-defined terms with a customizable refresh rate.

## Prerequisites
- `w3m` (text-based web browser)
- Bash (default in most Linux distributions)
- ncurses/tput

## Installation & Usage
Download the script and give it execution permissions:
git clone https://github.com/An0n0nline/headlinescraper.git
cd headlinescraper
bash headlinescraper.sh

### Options
- **Simple Search**: Users enter up to three search terms and get filtered headlines.
- **Persistent Search**: The script continuously fetches news at a user-defined interval.

## Notes
- If a search term is not used, type `NULL` or `///` to skip.
- The script provides emergency search term suggestions (e.g., `warning`, `evacuation`, `warfare`).

## License
This script is open-source and provided under the MIT License.
