let theme = {
  bg:         "#141a23",
  # bg_alt_0:   "#11161e", # darker background
  # bg_alt_1:   "#19212d", # lighter background

  # fg_0:       "#a5b7ca", # darker text
  # fg_1:       "#bacfe2", # slightly darker text
  fg_2:       "#cce4f1", # normal text
  fg_3:       "#e3f5ff", # for titles and headings

  grad_0:     "#98a0e1", # also used as blue
  grad_1:     "#a0b7e1",
  grad_2:     "#a0d2e1",
  grad_3:     "#99e2d7", # also used as cyan

  red:        "#e68686",
  orange:     "#e8ae94",
  yellow:     "#e4e8a6",
  green:      "#aae7b4",
  purple:     "#d0aae2",

  cursor:     "#e4f8ff", # cursor color
  # cursor_ln:  "#1b212d", # cursorline background
  selection:  "#232b3a", # visual selection background

  stealth_0:  "#353a4d", # used for things that are disabled
  stealth_1:  "#3b4154", # used for line numbers
  stealth_2:  "#444b65", # used for comments

  # border_0:   "#1e242f", # discrete border, just visible enough to be present (used for window splits)
  border_1:   "#242b38", # a slightly more visible border for floating windows that need to blend in
  # border_2:   "#364155", # lighter, clearly visible border (used most often)

  err:        "#eb6d85",
  warn:       "#dcd080",
}

let syntax = {
  unrecognized_command: $theme.red,
  recognized_command: $theme.grad_1,
  r_value: $theme.orange,
  string: $theme.green,
  operator: $theme.grad_0,
  keyword: $theme.grad_0,
  type: $theme.grad_1
  argument: $theme.grad_3
}

$env.config.color_config = {
  separator: $theme.border_1
  leading_trailing_space_bg: { fg: $theme.red attr: u }
  header: { fg: $theme.fg_3 attr: b }
  row_index: $theme.stealth_1
  record: $syntax.operator
  list: $syntax.operator
  hints: $theme.stealth_0
  search_result: { fg: $theme.bg bg: $theme.orange }
  shape_closure: $syntax.operator
  closure: $syntax.operator
  shape_flag: { fg: $theme.fg_2 attr: i }
  shape_matching_brackets: { attr: u }
  shape_garbage: $theme.red
  shape_keyword: $syntax.keyword
  shape_match_pattern: $theme.yellow
  shape_signature: $syntax.type
  shape_table: $syntax.operator
  cell-path: $syntax.operator
  shape_list: $syntax.operator
  shape_record: $syntax.operator
  shape_vardecl: $theme.fg_2
  shape_variable: $theme.fg_2
  empty: { attr: n }
  filesize: {||
    if $in < 1kb {
      $theme.stealth_2
    } else if $in < 10kb {
      $theme.grad_0
    } else if $in < 100kb {
      $theme.grad_1
    } else if $in < 10mb {
      $theme.grad_2
    } else if $in < 100mb {
      $theme.grad_3
    } else if $in < 1gb {
      $theme.green
    } else {
      $theme.red
    }
  }
  duration: {||
    if $in < 1day {
      $theme.yellow
    } else if $in < 1wk {
      $theme.green
    } else if $in < 4wk {
      $theme.grad_3
    } else if $in < 12wk {
      $theme.grad_2
    } else if $in < 24wk {
      $theme.grad_1
    } else if $in < 52wk {
      $theme.grad_0
    } else {
      $theme.stealth_2
    }
  }
  datetime: {|| (date now) - $in |
    if $in < 1day {
      $theme.yellow
    } else if $in < 1wk {
      $theme.green
    } else if $in < 4wk {
      $theme.grad_3
    } else if $in < 12wk {
      $theme.grad_2
    } else if $in < 24wk {
      $theme.grad_1
    } else if $in < 52wk {
      $theme.grad_0
    } else {
      $theme.stealth_2
    }
  }
  shape_external: $syntax.unrecognized_command
  shape_internalcall: $syntax.recognized_command
  shape_external_resolved: $syntax.recognized_command
  shape_block: $syntax.recognized_command
  block: $syntax.recognized_command
  shape_custom: $theme.red
  custom: $theme.red
  background: $theme.bg
  foreground: $theme.fg_2
  cursor: { bg: $theme.cursor fg: $theme.bg }
  shape_range: $syntax.r_value
  range: $syntax.r_value
  shape_pipe: $syntax.operator
  shape_operator: $syntax.operator
  shape_redirection: $syntax.operator
  glob: $syntax.argument
  shape_directory: $syntax.argument
  shape_filepath: $syntax.argument
  shape_glob_interpolation: $theme.purple
  shape_globpattern: $syntax.argument
  shape_int: $syntax.r_value
  int: $syntax.r_value
  bool: $syntax.r_value
  float: $syntax.r_value
  nothing: $syntax.r_value
  binary: $syntax.r_value
  shape_nothing: $syntax.r_value
  shape_bool: $syntax.r_value
  shape_float: $syntax.r_value
  shape_binary: $syntax.r_value
  shape_datetime: $syntax.r_value
  shape_literal: $syntax.r_value
  string: $syntax.string
  shape_string: $syntax.string
  shape_string_interpolation: $theme.purple
  shape_raw_string: $syntax.string
  shape_externalarg: $syntax.string

}

$env.config.highlight_resolved_externals = true
$env.config.explore = {
    status_bar_background: { fg: $theme.fg_2, bg: $theme.bg },
    command_bar_text: { fg: $theme.fg_3 },
    highlight: { fg: $theme.bg, bg: $theme.orange },
    status: {
        error: $theme.err,
        warn: $theme.warn,
        info: $theme.grad_3,
    },
    selected_cell: { bg: $theme.selection },
}
