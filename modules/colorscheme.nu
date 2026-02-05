export def choose [] {

    let choice = ls $"($nu.default-config-dir)/themes/"
    | get name
    | path basename
    | each { |it| $it | str replace '.nu' '' }
    | to text
    | fzf

    echo $choice

    source-env [$"($nu.default-config-dir)/themes/", $choice, ".nu" ] | str join

    $env.config.color_config = ($choice)
}
