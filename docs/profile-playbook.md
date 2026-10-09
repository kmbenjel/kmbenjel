# Profile playbook

Recommendations behind the profile README, and the manual steps that cannot be scripted.

## Positioning

Lead with what is hard to fake and easy to verify: **CodinGame Legend (top 0.1%)**, **1337 / 42 systems work**, **a 100/100 PageSpeed Arabic/RTL niche**, and the Arabic heritage sites. Do not claim seniority. The README says "junior/entry roles and freelance/contract" on purpose: a clear, honest target beats an inflated title that falls apart in a technical screen.

## Do these by hand (2 minutes)

1. **Bio:** replace "Learning to code" (a red flag for recruiters) with the line in `scripts/organize-repos.sh`.
2. **Pins (3):** hmittou, libft, anki_madani_numbering: a live site, low-level C and a tool people use. A few strong pins beat six mixed ones; add more only when a project is finished.
3. **Profile photo:** use a clear headshot; recruiters skim faces and names.
4. **Contribution graph:** Settings > Public profile > tick "Include private contributions" so your steady activity shows.
5. **Run** `./scripts/organize-repos.sh` once in dry-run mode, edit the lists, then `APPLY=1`.

## Repo organization

- **Loopline:** unfinished, AI-assisted work that needs proper care. It goes private until it has tests, review and a deploy you would defend in an interview.
- **Showcase (3):** pinned, with descriptions and topics.
- **Archive (about 40):** 42, ALX, bootcamp and kata repos. They stay public and show a learning path, but archived repos read as "finished" instead of "abandoned".
- **Private (about 12):** empty, test and scratch repos. Repos that look like live sites (nwd, share-hub, hbatelier49, ayoub-zrabi, library) are left alone until you confirm what they are. 97 public repos with no signal hide the few that matter.
- 42 school asks students not to publish solutions to current projects. If any of the archived 42 repos could count as that, make them private instead.

## What I would still add (highest value first)

1. **A proper README for hmittou:** screenshot, one-line pitch, stack, run steps, live link. Recruiters open the pinned repos and judge the README in 10 seconds.
2. **Finish loopline properly** (tests, review of generated code, deploy), then bring it back as the Rails showcase. It would be your only Rails project, so it's worth the care.
3. **One merged PR** in an open-source project whose stack matches the roles you apply to. This is the strongest proof of working in a team that you currently lack.
4. **Open-source `shatr` / `create-qasida`** once it is ready. A reusable tool with docs shows more than ten sites built with it.
5. **Tests and a CI badge** on whichever project you finish next.

## benjelloun.dev: keep it consistent with GitHub

The README now uses the site's own positioning ("Arabic interfaces & digital publishing") and links each project's live subdomain. Suggested changes to the site itself, highest value first:

1. **Add a way to hire you.** The site has no email and no contact or "work with me" section, only social links. Put an email button near the top.
2. **Put CodinGame Legend (top 0.1%) on the home page.** Right now it's item 20 of a 23-certificate list, so nobody sees it.
3. **Trim the certificate list.** Lead with CodinGame Legend, CodinGame Ruby with Honors and Oracle Java Foundations. Recruiters discount the ten Programming Hub app certificates, and having them all listed dilutes the strong ones. Move the rest behind a "show all" link.
4. **Pick one primary story.** The site says frontend and digital publishing, while your job search targets backend/full-stack roles. The README bridges both. If you apply mostly for backend roles, add one line about that to the site's intro.

## Honest caveats

- I could not read the individual repos other than by name and description. The archive and private lists are my best guess from names, languages and dates, so skim them before applying.
- Private repos (career-ops, shatr, create-qasida, phone-library, kobaiti-website) are intentionally not linked from the README.
