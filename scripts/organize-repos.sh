#!/usr/bin/env bash
# Tidy the kmbenjel GitHub profile for recruiters and engineering hiring managers.
# Needs the GitHub CLI, authenticated as kmbenjel (`gh auth login`).
#
#   ./scripts/organize-repos.sh            # dry run: prints what it would do
#   APPLY=1 ./scripts/organize-repos.sh    # actually does it
#
# Archiving is reversible; making a repo private is reversible too.
set -euo pipefail

OWNER=kmbenjel
APPLY=${APPLY:-0}

run() {
  if [ "$APPLY" = 1 ]; then "$@"; else printf 'DRY:'; printf ' %q' "$@"; echo; fi
}

# 1. Profile positioning bio, portfolio website, location, and hireable flag.
#    (Requires 'user' OAuth scope; falls back gracefully with a warning if token lacks 'user' scope)
run gh api -X PATCH user \
  -f bio="AI-Native Systems & Fullstack Developer · Python, Rails, C & JS · 1337/42 Network · CodinGame Legend (Top 0.1%) · Open to remote & relocation" \
  -f blog="https://benjelloun.dev" \
  -f location="Fes, Morocco" \
  -F hireable=true || echo "WARN: Skipping 'gh api -X PATCH user' (run 'gh auth refresh -h github.com -s user' to grant profile-edit scope)."

# 2. Description + homepage + topics for flagship & documented repositories.
describe() { # repo "description" "homepage" topic...
  local repo=$1 desc=$2 home=$3; shift 3
  local args=(--description "$desc")
  [ -n "$home" ] && args+=(--homepage "$home")
  for t in "$@"; do args+=(--add-topic "$t"); done
  run gh repo edit "$OWNER/$repo" "${args[@]}"
}

describe phone-library \
  "Autonomous 16,700-volume (174+ GB) Arabic digital library & computer-vision PDF processing pipeline across Android FTP storage and Linux." \
  "https://benjelloun.dev/library" \
  python computer-vision pdf-processing pymupdf digital-library arabic-heritage automation sqlite

describe workstation-discord-bridge \
  "Zero-dependency Python systemd daemon bridging a Linux workstation to Discord for conversational AI agent steering (Antigravity, Claude Code) & SSH." \
  "https://benjelloun.dev" \
  python discord-bot linux systemd ai-agents claude-code antigravity ssh-automation

describe hassanicalligraphy.com \
  "Interactive digital showcase & virtual masterclass academy for Moroccan calligraphy — built using Replit, plus Claude Code & Antigravity via VS Code Remote-SSH." \
  "https://hassanicalligraphy.com" \
  react vite tailwindcss rtl moroccan-calligraphy replit

describe shatr \
  "Publish a fast, accessible, 100/100-PageSpeed Arabic poetry website from plain text — kashida justification, PWA, print-ready PDF engine, and npm create qasida CLI." \
  "https://hmittou.benjelloun.dev" \
  arabic arabic-poetry kashida pwa rtl static-site-generator cli javascript

describe hmittou \
  "Reader and print-ready PDF edition of a classical 291-verse Arabic poem — 100/100 PageSpeed, on-canvas kashida justification, PWA, RTL." \
  "https://hmittou.benjelloun.dev" \
  arabic rtl pwa accessibility seo javascript

describe alfiya \
  "Interactive web edition of Ibn Malik's 1,002-verse Alfiyya in Arabic grammar — powered by the shatr engine." \
  "https://kmbenjel.github.io/alfiya" \
  arabic arabic-grammar poetry rtl pwa

describe nwd \
  "Interactive digital edition of the classical Moroccan scholarly Taqariz on Hilyat al-Nawadi — built with React 18, TypeScript, Tailwind CSS v4, and classical Arabic typography." \
  "https://nwd.benjelloun.dev" \
  react typescript tailwindcss arabic-poetry rtl vite

describe masahif-al-maghrib \
  "Interactive digital encyclopedia & bilingual video showcase for historic Moroccan Qur'anic manuscripts (Maghrebi scripts, illumination, codicology)." \
  "https://masahif-al-maghrib.com" \
  quran-manuscripts moroccan-heritage arabic-calligraphy react tailwindcss

describe libft \
  "C standard library rebuilt from scratch (1337 / 42 Network): 43 memory, string, character, FD output, and singly-linked-list functions." \
  "" \
  c unix 42-school 1337 libft systems-programming

describe ft_printf \
  "Custom C implementation of variadic printf(3) using <stdarg.h> — parsing %c, %s, %p, %d, %i, %u, %x, %X, %% under strict 42 Norm." \
  "" \
  c unix 42-school 1337 printf systems-programming

describe get_next_line \
  "Stateful buffered line reader in C using read(2) and persistent static state across arbitrary Unix file descriptors (1337 / 42 Network)." \
  "" \
  c unix 42-school 1337 systems-programming

describe minitalk \
  "Bit-level UNIX inter-process communication (IPC) client & server in C transmitting strings via SIGUSR1 and SIGUSR2 signals (1337 / 42 Network)." \
  "" \
  c unix ipc signals 42-school 1337 systems-programming

describe anki_madani_numbering \
  "Anki flashcard deck for the Madani (last) Qur'anic verse-numbering count and Warsh mushaf revision." \
  "" \
  anki quran warsh

# 3. Recommended 6 Pinned Repositories (set in GitHub UI > Profile > Customize your pins):
#    1. phone-library
#    2. workstation-discord-bridge
#    3. hassanicalligraphy.com
#    4. shatr
#    5. hmittou
#    6. libft

# 4. Archive finished coursework & historical exercises (remains public as verifiable learning history, clearly marked read-only/complete).
ARCHIVE=(
  1337_Piscine_June-06-Benguerir 1337_pool push_swap
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
for r in "${ARCHIVE[@]}"; do
  run gh repo archive "$OWNER/$r" --yes || true
done

# 5. Hide noise: empty, test, scratch, dotfiles, or incomplete WIP repos (e.g. loopline, khalid-curl, qari).
#    Note: live GitHub Pages / client sites (nwd, library, share-hub, hbatelier49, ayoub-zrabi, hiabed.github.io)
#    are intentionally kept public so their live Pages deployments stay online.
HIDE=(
  loopline khalid-curl qari wsl_dotfiles 5461 c_piscine_kbenjell
  khalid009 devise-kh test-new-repo git_practice new now rush 8-sep-2024 LoginPage
  bcgcontest TweakingWithLangGraph GenerateBandName-API
)
for r in "${HIDE[@]}"; do
  run gh api -X PATCH "repos/$OWNER/$r" -F private=true >/dev/null || true
  echo "✓ Set $OWNER/$r to private"
done

# 6. Conceal organization memberships from public profile.
for org in elnakady abu-obaidah-ennaqqadi; do
  run gh api -X DELETE "orgs/$org/public_members/$OWNER" >/dev/null 2>&1 || true
  echo "✓ Concealed public membership in $org"
done
