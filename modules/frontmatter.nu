export def "from frontmatter" [] {
  if not ($in | has_frontmatter) {
    echo "Hmm... I can't seem to find the frontmatter"
    exit
  }

  $in
  | split row "---"
  | get 1
  | from yaml
  # | table --expand
}

def has_frontmatter [: string] {
  let first_line = ($in | lines | first)
  $first_line == "---"
}
