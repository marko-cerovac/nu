$env.config.completions = {
  case_sensitive: false
  quick: true # set this to false to prevent auto-selecting completions when only one remains
  partial: true # set this to false to prevent partial filling of the prompt
  algorithm: "fuzzy"    # prefix or fuzzy
  external: {
    enable: true
    max_results: 100
    completer: null # check 'carapace_completer' above as an example
  }
  use_ls_colors: true # set this to true to enable file/path/directory completions using LS_COLORS
}
$env.config.menus = [
  # Configuration for default nushell menus
# Note the lack of source parameter
     {
       name: completion_menu
       only_buffer_difference: false
       marker: "| "
       type: {
         layout: columnar
         columns: 4
         col_width: 20
         col_padding: 2
       }
       style: {
         text: dark_gray
         selected_text: { fg: light_gray, attr: r}
# selected_text: { attr: r }
         description_text: white
         match_text: { attr: u }
         selected_match_text: { fg: light_gray, attr: ur }
       }
     }
     {
       name: ide_completion_menu
       only_buffer_difference: false
       marker: "| "
       type: {
         layout: ide
         min_completion_width: 0,
         max_completion_width: 50,
         max_completion_height: 10,
         padding: 0,
         border: true,
         cursor_offset: 0,
         description_mode: "prefer_right"
         min_description_width: 0
         max_description_width: 50
         max_description_height: 10
         description_offset: 1
# If true, the cursor pos will be corrected, so the suggestions match up with the typed text
#
# C:\> str
#      str join
#      str trim
#      str split
         correct_cursor_pos: true
       }
       style: {
         text: light_gray
# border: "#232637"
         selected_text: { attr: r }
         description_text: white
         match_text: { attr: u }
         selected_match_text: { attr: ur }
       }
     }
     {
       name: history_menu
       only_buffer_difference: true
       marker: "^ "
       type: {
         layout: list
         page_size: 10
       }
       style: {
         text: green
         selected_text: green_reverse
         description_text: yellow
       }
     }
     {
       name: help_menu
       only_buffer_difference: true
       marker: "? "
       type: {
         layout: description
         columns: 4
         col_width: 20     # Optional value. If missing all the screen width is used to calculate column width
         col_padding: 2
         selection_rows: 4
         description_rows: 10
       }
       style: {
         text: white
         selected_text: white_reverse
         description_text: purple
       }
     }
]
