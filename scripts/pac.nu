# def commands [] {
#     [
#         { value "i", description "install" },
#         { value "r", description "remove" },
#         { value "s", description "search for a package" },
#         { value "u", description "update" },
#         { value "y", description "syncronise repositories" },
#         { value "q", description "package info" },
#         { value "l", description "query installed" },
#         { value "si", description "list installed" },
#     ]
# }

# a more ergonomic way to use pacman
export def main [
    command: string, # the command to execute
                              # i - install
                              # r - remove
                              # s - search
                              # u - update
                              # y - sync
                              # q - query
                              # l - list installed
                              # si - info
    ...packages: string # a list of packages
] {
    match $command {
        "i" => { sudo pacman -S ...$packages }
        "r" => { sudo pacman -Rns ...$packages }
        "u" => { sudo pacman -Syu }
        "y" => { sudo pacman -Syy }
        "s" => { pacman -Ss ...$packages }
        "si" => { pacman -Si ...$packages }
        "q" => { pacman -Qs ...$packages }
        "l" => { pacman -Q }
        _ => { print "Unknown command. Try a different letter"}
    }
}
