# Nushell Environment Config File
#
# version = "0.92.2"

# Specifies how environment variables are:
# - converted from a string to a value on Nushell startup (from_string)
# - converted from a value back to a string when running external commands (to_string)
# Note: The conversions happen *after* config.nu is loaded
$env.ENV_CONVERSIONS = {
    "PATH": {
        from_string: { |s| $s | split row (char esep) | path expand --no-symlink }
        to_string: { |v| $v | path expand --no-symlink | str join (char esep) }
    }
    "Path": {
        from_string: { |s| $s | split row (char esep) | path expand --no-symlink }
        to_string: { |v| $v | path expand --no-symlink | str join (char esep) }
    }
}

$env.NUPM_HOME = ($nu.default-config-dir | path join "nupm")

# Directories to search for scripts when calling source or use
# The default for this is $nu.default-config-dir/scripts
$env.NU_LIB_DIRS = [
    ($nu.default-config-dir | path join 'scripts'),
    ($nu.default-config-dir | path join 'modules'),
    ($nu.default-config-dir | path join 'completions'),
    ($env.NUPM_HOME | path join "modules")
]

$env.PATH = ($env.PATH | split row (char esep)
  | append /bin
  | append /usr/bin
  | append /usr/local/bin
  | append ($env.HOME | path join ".local bin")
  | append ($env.HOME | path join ".cargo/bin")
  | append ($env.HOME | path join ".rustup/bin")
  | prepend ($env.NUPM_HOME | path join "scripts")
  | prepend ($env.NUPM_HOME | path join "plugins/bin")
  | uniq) # filter so the paths are unique


# Directories to search for plugin binaries when calling register
# The default for this is $nu.default-config-dir/plugins
$env.NU_PLUGIN_DIRS = [
    ($nu.default-config-dir | path join 'plugins') # add <nushell-config-dir>/plugins
]

$env.LS_COLORS = (dircolors -b)

$env.FZF_DEFAULT_OPTS = ([
    "--height 50% "
    "--layout reverse "
    "--border rounded "
    # "--preview 'bat --color always {}' "
    "--color "
    "fg:#A6ACCD,bg:#0F111A," # text
    "fg+:#EEFFFF,bg+:#1F2233," # text on the current line
    "hl:#C3E88D,hl+:#C3E88D," # highlighted substrings
    "info:#464B5D,pointer:#84FFFF,marker:#FFCB6B,"
    "border:#232637,spinner:#C792EA,prompt:#EEFFFF,"
    "gutter:#0F111A"
] | str join)
$env._ZO_FZF_OPTS = ($env.FZF_DEFAULT_OPTS | str join " --no-preview")

# To add entries to PATH (on Windows you might use Path), you can use the following pattern:
# $env.PATH = ($env.PATH | split row (char esep) | prepend '/some/path')
# An alternate way to add entries to $env.PATH is to use the custom command `path add`
# which is built into the nushell stdlib:
# use std "path add"
# $env.PATH = ($env.PATH | split row (char esep))
# path add /some/path
# path add ($env.CARGO_HOME | path join "bin")
# path add ($env.HOME | path join ".local" "bin")
# $env.PATH = ($env.PATH | uniq)

# To load from a custom file you can use:
# source ($nu.default-config-dir | path join 'custom.nu')

# set up zoxide if not set up
if not ("~/.config/nushell/zoxide.nu" | path exists) {
    zoxide init nushell | save -f ~/.config/nushell/zoxide.nu
}

# set up starship if not set up
if not ("~/.cache/starship/init.nu" | path exists) {
    mkdir ~/.cache/starship
    starship init nu | save -f ~/.cache/starship/init.nu
}
