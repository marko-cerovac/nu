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

# Java variable
# $env.NUPM_HOME = $nu.default-config-dir | path join "nupm"
# $env.JAVA_HOME = "/usr/lib/jvm/java-17-openjdk"
$env.JAVA_HOME = "/usr/lib/jvm/java-21-openjdk"
# $env.JAVA_HOME = "/usr/lib/jvm/java-23-openjdk"

# Go variable
$env.GOPATH = ($env.HOME | path join ".go")

# Directories to search for scripts when calling source or use
# The default for this is $nu.default-config-dir/scripts
$env.NU_LIB_DIRS = [
    ($nu.default-config-dir | path join 'scripts'),
    ($nu.default-config-dir | path join 'modules'),
    ($nu.default-config-dir | path join 'completions'),
    # ($env.NUPM_HOME | path join "modules")
]

$env.PATH = $env.PATH | split row (char esep)
  | append /bin
  | append /usr/bin
  | append /usr/local/bin
  | append ($env.HOME | path join ".local/bin")
  | append ($env.HOME | path join ".cargo/bin")
  | append ($env.HOME | path join ".rustup/bin")
  | append ($env.JAVA_HOME | path join "bin")
  | uniq # filter so the paths are unique
  # | prepend ($env.NUPM_HOME | path join "scripts")
  # | prepend ($env.NUPM_HOME | path join "plugins/bin")


# Directories to search for plugin binaries when calling register
# The default for this is $nu.default-config-dir/plugins
$env.NU_PLUGIN_DIRS = [
    ($nu.default-config-dir | path join 'plugins') # add <nushell-config-dir>/plugins
]

$env.LS_COLORS = (dircolors -b)

$env.FZF_DEFAULT_OPTS = [
    "--height 50% "
    "--layout reverse "
    "--border rounded "
    "--margin 0,2 "
    "--color "
    "fg:#D2EBFB," # text
    "fg+:#D2EBFB,bg+:#232B3A," # text on the current line
    "hl:#9ECECD,hl+:#9ECECD," # highlighted substrings
    "info:#464B5D,pointer:#88ACD7,marker:#E4F8FF,"
    "border:#242B38,spinner:#E4957C,prompt:#E3F5FF,"
    "label:#ECEFF4,gutter:#141A23"
] | str join
$env._ZO_FZF_OPTS = $env.FZF_DEFAULT_OPTS | str join " --no-preview"

# TEMPORARY
$env.__zoxide_hooked = true

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
