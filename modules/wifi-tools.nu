# Get wifi information in a table format
export def "wifi get" [] {
    iwctl station wlan0 get-networks
          | tail --lines +3
          | str replace --all --regex "\\x1B\\[1;90m\\**\\x1B\\[0m" ""
          | ansi strip
          | str replace ">" " "
          | rg -v "\\-+"
          | from ssv
          | rename "name" "security" "signal"
}

# Initiate wifi scanning
export def "wifi scan" [] {
    iwctl station wlan0 scan
}

# Filter wifi networks using fzf and connect to the selected one
export def "wifi connect" [] {
    iwctl station wlan0 scan | complete

    let choice = wifi get
                 | get name
                 | append "Disconnect"
                 | str join "\n"
                 | fzf

    if ($choice | is-empty) {
        return
    } else if ($choice == "Disconnect") {
        iwctl station wlan0 disconnect
    } else {
        iwctl station wlan0 connect $choice
    }
}

# Wifi tools for a more ergonomic experience with iw.
# Call without arguments for quick connect.
export def wifi [] {
    wifi connect
}
