# Nushell Config File
#
# version = "0.92.2"

$env.config = {
    show_banner: false
    ls: {
        use_ls_colors: true
        clickable_links: true
    }
    rm: { always_trash: false }
    table: {
        mode: single
        index_mode: always
        show_empty: true
        padding: { left: 1, right: 1 }
        trim: {
            methodology: wrapping
            wrapping_try_keep_words: true
            truncating_suffix: "..."
        }
        header_on_separator: false
    }
    error_style: "fancy"
    history: {
        max_size: 10_000
        sync_on_enter: true
        file_format: "plaintext"
    }
    filesize: { unit: "metric" }
    cursor_shape: {
        emacs: line
        vi_insert: blink_underscore
        vi_normal: block
    }
    # use_grid_icons: true
    footer_mode: auto # always, never, number_of_rows, auto
    float_precision: 2
    use_ansi_coloring: true
    bracketed_paste: true
    edit_mode: vi # emacs, vi
    render_right_prompt_on_last_line: false
    use_kitty_protocol: false
    highlight_resolved_externals: true
    recursion_limit: 50
}

source menus.nu
source keybindings.nu
source themes/balaena.nu

# aliases
alias cpdir = cp -r
alias ll = ls -l
alias la = ls -a
alias tree = lsd --tree
alias cat = bat

alias vi = nvim
alias nv = neovide

alias ga = git add
alias gc = git commit
alias gp = git push

# custom commands
use yazi.nu y
use wifi-tools.nu *
use frontmatter.nu *
# use pac.nu

# completions
use completions/cargo-completions.nu *
use completions/git-completions.nu *
use completions/rustup-completions.nu *

# add starship prompt
use ~/.cache/starship/init.nu

# add zoxide
source zoxide.nu
