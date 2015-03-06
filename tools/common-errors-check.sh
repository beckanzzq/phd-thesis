#!/bin/bash

files=(chapters/*.tex appendices/*.tex)

function category() {
    echo
    echo -e "${bold}>>> $1${reset}"
}

function tgrep() {
    grep --color --line-number "$@"
}

category "Wrong line ending in align environment"
pcregrep --color --line-number -M '\\\\\n\\end\{align' "${files[@]}"

category "Wrong therefore"
tgrep 'therefor[^e]' "${files[@]}"

category "Word double occurence"
tgrep '\b\([A-Za-z][A-Za-z]*\) \1\b' "${files[@]}"
tgrep '\bthe a\b' "${files[@]}"
tgrep '\bthe an\b' "${files[@]}"
tgrep '\ba the\b' "${files[@]}"
tgrep '\ban the\b' "${files[@]}"

category "Paragraph without colon"
tgrep "\\paragraph{[^}]*[^:]}" "${files[@]}"