# Profile playbook

Recommendations behind the profile README, and the manual steps that cannot be scripted.

## Positioning

Lead with what is hard to fake and easy to verify: **CodinGame Legend (top 0.1%)**, **1337 / 42 systems work**, **a 100/100 PageSpeed Arabic/RTL niche**, and the Arabic heritage sites. Do not claim seniority. The README says "junior/entry roles and freelance/contract" on purpose: a clear, honest target beats an inflated title that falls apart in a technical screen.

## Do these by hand (2 minutes)

1. **Bio:** replace "Learning to code" (a red flag for recruiters) with the line in `scripts/organize-repos.sh`.
2. **Pins (6):** hmittou, alfiya, atraf, khalid-curl, libft, anki_madani_numbering. This mixes live sites, a CLI tool and low-level C.
3. **Profile photo:** use a clear headshot; recruiters skim faces and names.
4. **Contribution graph:** Settings > Public profile > tick "Include private contributions" so your steady activity shows.
5. **Run** `./scripts/organize-repos.sh` once in dry-run mode, edit the lists, then `APPLY=1`.

## Repo organization

- **Loopline:** unfinished, AI-assisted work that needs proper care. It goes private until it has tests, review and a deploy you would defend in an interview.
- **Showcase (6):** pinned, with descriptions and topics.
- **Archive (about 40):** 42, ALX, bootcamp and kata repos. They stay public and show a learning path, but archived repos read as "finished" instead of "abandoned".
- **Private (about 12):** empty, test and scratch repos. Repos that look like live sites (nwd, share-hub, hbatelier49, ayoub-zrabi, library) are left alone until you confirm what they are. 97 public repos with no signal hide the six that matter.
- 42 school asks students not to publish solutions to current projects. If any of the archived 42 repos could count as that, make them private instead.

## What I would still add (highest value first)

1. **Proper READMEs for hmittou and alfiya:** screenshot, one-line pitch, stack, run steps, live link. Recruiters open the pinned repos and judge the README in 10 seconds.
2. **Finish loopline properly** (tests, review of generated code, deploy), then bring it back as the Rails showcase. It would be your only Rails project, so it's worth the care.
3. **One merged PR** in an open-source project whose stack matches the roles you apply to. This is the strongest proof of working in a team that you currently lack.
4. **Open-source `shatr` / `create-qasida`** once it is ready. A reusable tool with docs shows more than ten sites built with it.
5. **Tests and a CI badge** on whichever project you finish next.

## Honest caveats

- I could not open benjelloun.dev from this environment (blocked); the README uses the facts recorded in your career-ops CV and digests. Check the portfolio's wording matches.
- I could not read the individual repos other than by name and description. The archive and private lists are my best guess from names, languages and dates, so skim them before applying.
- Private repos (career-ops, shatr, create-qasida, phone-library, kobaiti-website) are intentionally not linked from the README.
