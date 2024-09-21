export def main [] { return {
    separator: "#232637"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#EEFFFF" attr: "b" }
    empty: "#2196f3"
    bool: {|| if $in { "#C792EA" } else { "#F78C6C" } }
    int: "#F78C6C"
    filesize: {|e|
        if $e == 0b {
            "#8DA3CA"
        } else {
            "#C792EA"
        }
    }
    duration: "#80868b"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#F07178" attr: "b" }
        } else if $in < 6hr {
            "#F78C6C"
        } else if $in < 1day {
            "#FFCB6B"
        } else if $in < 3day {
            "#C3E88D"
        } else if $in < 1wk {
            { fg: "#B0C9FF" attr: "b" }
        } else if $in < 6wk {
            "#82AAFF"
        } else if $in < 52wk {
            "#717CB4"
        } else { "#464B5D" }
    }
    range: "#F78C6C"
    float: "#F78C6C"
    string: "#A6ACCD"
    nothing: "#80868b"
    binary: "#F78C6C"
    cellpath: "#80868b"
    row_index: { fg: "#EEFFFF" attr: "b" }
    record: "#80868b"
    list: "#FFCB6B"
    block: "#FFCB6B"
    hints: "#464B5D"
    search_result: { fg: "black" bg: "#f44336" }

    shape_and: { fg: "#FFCB6B" attr: "b" }
    shape_binary: { fg: "#F78C6C" attr: "b" }
    shape_block: { fg: "#FFCB6B" attr: "b" }
    shape_bool: "#F78C6C"
    shape_custom: "#C3E88D"
    shape_datetime: { fg: "#C792EA" attr: "b" }
    shape_directory: "#82AAFF"
    shape_external: "#89DDFF"
    shape_externalarg: { fg: "#C3E88D" attr: "b" }
    shape_filepath: "#F07178"
    shape_flag: { fg: "#F07178" attr: "b" }
    shape_float: { fg: "#F78C6C" attr: "b" }
    shape_garbage: { fg: "black" bg: "#FF5370" attr: "b" }
    shape_globpattern: { fg: "#C792EA" attr: "b" }
    shape_int: { fg: "#F78C6C" attr: "b" }
    shape_internalcall: { fg: "#89DDFF" attr: "b" }
    shape_list: { fg: "#FFCB6B" attr: "b" }
    shape_literal: "#C3E88D"
    shape_match_pattern: "#F07178"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#8DA3CA"
    shape_operator: "#FFCB6B"
    shape_or: { fg: "#FFCB6B" attr: "b" }
    shape_pipe: { fg: "#FFCB6B" attr: "b" }
    shape_range: { fg: "#89DDFF" attr: "b" }
    shape_record: { fg: "#C792EA" attr: "b" }
    shape_redirection: { fg: "#FFCB6B" attr: "b" }
    shape_signature: { fg: "#C3E88D" attr: "b" }
    shape_string: "#C3E88D"
    shape_string_interpolation: { fg: "#00bcd4" attr: "b" }
    shape_table: { fg: "#2196f3" attr: "b" }
    shape_variable: "#B0C9FF"

    background: "#0F111A"
    foreground: "#A6ACCD"
    cursor: "#FFCC00"
}}
