#!/usr/bin/env bash
# Tidy the kmbenjel GitHub profile for recruiters and contractors.
# Needs the GitHub CLI, authenticated as kmbenjel (`gh auth login`).
#
#   ./scripts/organize-repos.sh            # dry run: prints what it would do
#   APPLY=1 ./scripts/organize-repos.sh    # actually does it
#
# Review the lists below first. Archiving is reversible; making a repo private
# is reversible too, but it removes its stars/visibility until you flip it back.
set -euo pipefail

OWNER=kmbenjel
APPLY=${APPLY:-0}

run() {
  if [ "$APPLY" = 1 ]; then "$@"; else printf 'DRY:'; printf ' %q' "$@"; echo; fi
}

# 1. Profile: replace "Learning to code" with a positioning line.
run gh api -X PATCH user \
  -f bio="Developer · Arabic interfaces & digital publishing · Rails · C · CodinGame Legend (top 0.1%) · open to remote work" \
  -f blog="https://benjelloun.dev" \
  -f location="Fes, Morocco" \
  -F hireable=true

# 2. Description + topics for showcase repos (what a recruiter sees on the pinned cards).
describe() { # repo "description" "homepage" topic...
  local repo=$1 desc=$2 home=$3; shift 3
  local args=(--description "$desc")
  [ -n "$home" ] && args+=(--homepage "$home")
  for t in "$@"; do args+=(--add-topic "$t"); done
  run gh repo edit "$OWNER/$repo" "${args[@]}"
}
describe hmittou   "Reader and print-ready PDF edition of a classical Arabic rajaz poem. 100/100 PageSpeed, RTL." "https://hmittou.benjelloun.dev" arabic rtl pwa accessibility seo
describe nwd       "Arabic text edition: al-Taqi al-Shaykh's taqriz for the poem Hilyat al-Nawadi." "https://nwd.benjelloun.dev" arabic rtl arabic rtl
describe libft     "C standard library rebuilt from scratch (42 / 1337): strings, memory, linked lists." "" c 42-school 1337 libft
describe anki_madani_numbering "Anki deck for the Madani (last) verse numbering and Warsh mushaf revision." "" anki quran warsh

# 3. Pin order on the profile must be set by hand (GitHub has no public API):
#    Profile > Customize your pins > hmittou, nwd, libft, anki_madani_numbering

# 4. Archive finished coursework: stays public as proof of learning, but reads as "done".
ARCHIVE=(
  1337_Piscine_June-06-Benguerir 1337_pool ft_printf get_next_line push_swap minitalk
  so_long fractol ft_putnbr rendu exam rush00 binary_trees AirBnB_clone
  RSA-Factoring-Challenge alx-pre_course alx-zero_day alx-low_level_programming
  alx-higher_level_programming alx-system_engineering-devops 0x03-shell_variables_expansions
  zero_day Java-Masterclass---Exercises hackerrank_java_challenges
  codewars.com_ruby_kmbenjel codingame_fall_2022 Some-CodinGame-Clashes
  rwd_project_1 fcc-product-landing-page
  Redo-Learn-More-About-CSS-Pseudo-Selectors-By-Building-A-Balance-Sheet
  html-assignments-elzero thejsbootcamp rails-simple-airbnb rails-stupid-coaching
  platesforcars ruby_tictactoe_for_recurse_interview april_2023
)
for r in "${ARCHIVE[@]}"; do run gh repo archive "$OWNER/$r" --yes; done

# 5. Hide noise: empty, test, scratch or unfinished repos (loopline: work in progress, not ready to show).
#    Check each one is not needed publicly (e.g. linked from a site) before applying.
HIDE=(
  loopline khalid009 devise-kh test-new-repo git_practice new now rush 8-sep-2024 LoginPage
  bcgcontest TweakingWithLangGraph GenerateBandName-API
)
# Deliberately NOT hidden: nwd (live at nwd.benjelloun.dev), library, share-hub, hbatelier49,
# ayoub-zrabi, hiabed.github.io, wsl_dotfiles. Several look like live GitHub Pages / client sites;
# privatising would take them down.
# Give them a description, or archive them, after checking what they are.
for r in "${HIDE[@]}"; do
  run gh repo edit "$OWNER/$r" --visibility private --accept-visibility-change-consequences
done
