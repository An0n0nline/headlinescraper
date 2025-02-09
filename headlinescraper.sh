#!/bin/bash

# Function to fetch news
fetch_news() {
    w3m cnn.com/us | cat
    w3m rss.news.yahoo.com | cat
    w3m news.google.com | cat
    w3m spidr.today | cat
    w3m reddit.com/r/worldnews | cat
}

# Function to perform simple search
simple_search() {
    clear
    tput setaf 14  # Light Cyan
    echo "FONTPAGE NEWS SIMPLE SEARCH"
    echo
    tput setaf 15  # White
    echo "SOURCES:"
    echo "CNN.COM/US | RSS.NEWS.YAHOO.COM | NEWS.GOOGLE.COM | SPIDR.TODAY | REDDIT.COM/R/WORLDNEWS"
    echo
    tput setaf 9  # Yellow
    echo "TYPE 'NULL' FOR UNUSED SEARCH TERM(S)"
    echo "OTHERWISE BLANK TERMS WILL RESULT IN FULL PAGE RETURNS"
    echo
    tput setaf 9  # Yellow
    echo "Emergency Search Term Suggestions:"
    echo "warning | emergency | evacuation | conflict | warfare | uprising | violence"
    echo
    tput setaf 14  # Light Cyan
    echo "INPUT SEARCH TERMS (3):"
    tput setaf 15  # White
    read -p "ENTER SEARCH TERM 1: " term1
    read -p "ENTER SEARCH TERM 2: " term2
    read -p "ENTER SEARCH TERM 3: " term3
    echo
    fetch_news | grep -i -E --color=always "$term1|$term2|$term3"
}

# Function to perform persistent search
persistent_search() {
    clear
    echo
    tput setaf 14  # Light Cyan
    echo "FONTPAGE NEWS PERSISTENT SEARCH"
    echo
    tput setaf 15  # White
    echo "SOURCES:"
    echo "CNN.COM/US | RSS.NEWS.YAHOO.COM | NEWS.GOOGLE.COM | SPIDR.TODAY | REDDIT.COM/R/WORLDNEWS"
    echo
    tput setaf 9  # Yellow
    echo "TYPE 'NULL' FOR UNUSED SEARCH TERM(S)"
    echo "OTHERWISE YOU WILL GET A FULL RETURN"
    echo
    tput setaf 9  # Yellow
    echo "Emergency Search Term Suggestions:"
    echo "warning | emergency | evacuation | conflict | warfare | uprising | violence"
    echo
    tput setaf 14  # Light Cyan
    echo "INPUT SEARCH TERMS (3) TO UPDATE"
    tput setaf 15  # White
    read -p "SEARCH TERM 1: " term1
    read -p "SEARCH TERM 2: " term2
    read -p "SEARCH TERM 3: " term3
    # Add a space after SEARCH TERM 3 and before Time Equivalences
    echo
    # Time Equivalences display
    tput setaf 14  # Light Cyan
    echo "Time Equivalences (minutes to seconds):"
    tput setaf 15  # White
    echo "20 mins = 1200 seconds"
    echo "30 mins = 1800 seconds"
    echo "60 mins = 3600 seconds"
    echo
    tput setaf 14  # Light Cyan
    read -p "TIME DELAY FOR LOOP (SECONDS): " seconds1
    echo  # Add space after TIME DELAY FOR LOOP input

    while true; do
        fetch_news | grep --color=always -i -E "$term1|$term2|$term3"
        tput setaf 14  # Light Cyan
        echo "THIS PAGE WILL REFRESH IN $seconds1 SECONDS"
        tput setaf 15  # White
        date
        echo "=============================================================================="
        sleep $seconds1
    done
}

# Main Menu
clear
tput setaf 14  # Light Cyan
echo -n "///// "
tput setaf 15  # White
echo -n "FRONTPAGE HEADLINE SEARCH "
tput setaf 14  # Light Cyan
echo "///// "
echo
read -r -p "SELECT (1) SIMPLE SEARCH OR (2) PERSISTENT SCAN: " selection1
echo

if [ "$selection1" = 1 ]; then
    simple_search
elif [ "$selection1" = 2 ]; then
    persistent_search
else
    echo "Invalid selection, please choose 1 or 2."
    exit 1
fi

# Return to the menu prompt
tput setaf 14  # Light Cyan
read -p "WOULD YOU LIKE TO RETURN TO THE MENU? (y/n): " ANSWER
tput setaf 15  # White
if [[ "$ANSWER" = y ]]; then
    # Run the script again
    exec "$0"
else
    echo
fi
