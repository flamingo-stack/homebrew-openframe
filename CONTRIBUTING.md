## Contributing to Homebrew Openframe

Thanks for your interest in contributing to `homebrew-openframe`, the Homebrew tap that distributes the OpenFrame client (CLI and cask) to macOS and Linux users via `brew`. This repository holds Ruby Formula/Cask definitions, repository metadata (`.github/CODEOWNERS`), and generated automation workflows rather than application source code — contributing here means proposing small, verifiable changes to those definitions and that metadata.

This document covers the mechanics of contributing. For the full day-to-day development picture, start at the [Development documentation hub](./docs/development/README.md).

---

## Where this fits

According to the organization's repository graph, this tap currently publishes no artifact that another repository pins, and no repository is recorded as a consumer of it. That graph's coverage is **partial** — OpenFrame CLI, OpenFrame OSS Tenant, and one repository not visible from here are not indexed, so an empty consumer list is not proof that nothing depends on this tap. In practice, this tap is how end users install the OpenFrame client via Homebrew. See the related installation guides:

- [Install the OpenFrame client with Homebrew](./docs/getting-started/how-to/install-the-openframe-client-with-homebrew.md)
- [Install a specific OpenFrame client channel (stage or dev)](./docs/getting-started/how-to/install-a-specific-openframe-client-channel-stage-or-dev.md)
- [Upgrade or uninstall the OpenFrame client cask](./docs/getting-started/how-to/upgrade-or-uninstall-the-openframe-client-cask.md)

Because downstream consumption of this tap is only partially indexed, treat every version/URL/checksum change as externally visible — it is what end users' `brew install` commands resolve, not an "internal only" edit.

---

## Setting up a development environment

Full setup instructions live in the development docs — follow them rather than improvising:

- [Development overview](./docs/development/README.md) — how the development docs are organized and in what order to read them.
- [Environment setup](./docs/development/setup/environment.md) — required tools (Homebrew, Git, Ruby, `brew` CLI), IDE recommendations, editor extensions, and the environment variables used during local development.
- [Local development](./docs/development/setup/local-development.md) — cloning the tap, tapping it into Homebrew, the install/audit/reinstall iteration loop, and how to inspect or debug a formula/cask resolution.

In short: this repository has no application server, no `package.json`, and no `pom.xml`. "Local development" means editing Ruby Formula/Cask files and exercising them through the `brew` CLI (`brew tap`, `brew install`, `brew audit`, `brew style`) — there is no hot-reload server or traditional debugger. See the linked docs for the exact commands.

---

## Development workflow

### Branch naming

Use short, descriptive, lowercase, hyphenated branch names. Avoid colliding with prefixes reserved for automation:

| Prefix | Reserved for |
|---|---|
| `setup/` | The hub's own setup PRs (workflow installation); excluded from the review workflow's code-graph triggers |
| `code-documentation/` | Automated documentation pipeline PRs |
| `ai-fix/` | Automated fix branches; excluded from the code-graph trigger condition |

For your own work, prefer:

- `fix/<short-description>` — bug fixes (a broken checksum, a stale download URL)
- `feat/<short-description>` — new formula/cask additions or new automation
- `chore/<short-description>` — maintenance that is neither a fix nor a feature (dependency bumps, CODEOWNERS changes)
- `docs/<short-description>` — documentation-only changes

### Commits

Write commit messages that explain *why*, not just *what* — the diff already shows what changed.

- **Subject line**: imperative mood, no trailing period, ideally under ~72 characters (e.g. `Bump openframe-cli cask to v1.4.2`).
- **Reference the affected formula/cask by name** in the subject when the change is version-scoped (e.g. `Fix sha256 for openframe stage channel cask`).
- **Body** (for non-trivial changes): explain the reason — a new upstream release, a broken download URL, a checksum mismatch, an added release channel — and link the relevant upstream release or issue if one exists.
- **Keep automation-authored commits distinguishable** from your own; don't imitate the documentation pipeline's or review bot's commit style by hand.
- **Squash fixup commits** ("wip" / "fix typo" cycles) before merge so the history reads as one coherent change per logical unit of work.

Example:

```text
Add dev channel cask for openframe-client

Upstream now ships a `dev` release channel alongside `stage` and
stable. This adds the corresponding cask so `brew install --cask
openframe-client-dev` resolves to it, matching the pattern already
used for the stage channel.
```

### Pull requests

1. **Open the PR against the default branch.** It is what the code-graph job re-indexes on every push (documentation-only changes under `docs/**` and `**.md` do not trigger a rebuild).
2. **Keep the diff scoped.** A formula/cask bump, a CODEOWNERS change, and a workflow update are three separate PRs unless they are causally linked.
3. **Let automated review run.** This repository has the Flamingo Code Review workflow installed. Review does not always start automatically:
   - Opening, reopening, or marking a PR ready for review posts an **invitation** comment — review starts only when you act on it (checking its box, commenting, or applying a label).
   - To request a review explicitly, comment `@flamingo-review` on the PR (`@flamingo-review full` forces a full re-read of the cumulative diff rather than only the incremental delta since the last review).
   - Alternatively, apply the `flamingo-review` label; it is one-shot and is consumed automatically once processed. The `flamingo-review-always` label is durable and subscribes the PR to review on every subsequent push.
   - This does not work the same way from a fork with write-restricted tokens — review logic checks that the PR's head repository matches this repository, and a comment-triggered review additionally requires the commenter to have owner, member, or collaborator association.
4. **Address findings** by responding in the PR thread and pushing follow-up commits to the same branch.
5. **Merge once checks are green and review is satisfied.** Avoid force-pushing over a review in progress unless you intend to ask for a fresh pass (request one with `@flamingo-review full`).

### Review checklist

Before requesting review (or before approving one), confirm:

- [ ] The PR does exactly one logical thing — a version bump, a new formula/cask, a metadata change, or a docs change — not a mix.
- [ ] Any `url`, `sha256`, and `version` fields that were touched were touched together and are internally consistent.
- [ ] Neither `.github/workflows/code-documentation.yml` nor `.github/workflows/flamingo-code-review.yml` was edited directly outside the hub's setup/update flow — if a workflow file appears in the diff, confirm it came from a hub-dispatched setup PR, not a manual edit.
- [ ] No workflow change adds a pinned script hash (`HASH_*` env var) or otherwise bypasses the shared verification mechanism for a hub-served script.
- [ ] If `.github/CODEOWNERS` was touched, broader patterns remain above narrower ones (last-match-wins), and `@flamingo-stack/devops-engineers` coverage was not accidentally removed from a path that needs it.
- [ ] The branch name does not collide with the reserved `setup/`, `code-documentation/`, or `ai-fix/` prefixes.
- [ ] Commit messages are meaningful; fixup/wip commits are squashed.
- [ ] A version string, URL, or constant was not retyped in a second place when an existing field already owns it.
- [ ] If the change affects what `brew install`/`brew install --cask` resolves to, the corresponding install/upgrade/uninstall documentation still describes the correct behavior.

### Code ownership

All paths in this repository are currently owned by `@flamingo-stack/devops-engineers`, as declared in `.github/CODEOWNERS`. `.github/CODEOWNERS` uses last-match-wins semantics: if you add a narrower ownership rule for a subdirectory (for example a future `Formula/` or `Casks/` owner), add it **below** the existing wildcard line, or it will never take effect.

---

## Code style and conventions

- **Keep formula/cask diffs minimal and mechanical.** A tap's trust model depends on every version bump being a small, obviously-correct diff (URL, checksum, version string). Do not bundle unrelated refactors into a version-bump PR.
- **Never hand-edit a generated workflow file.** `.github/workflows/code-documentation.yml` and `.github/workflows/flamingo-code-review.yml` are generated and installed by the Flamingo hub's setup workflow and are explicitly marked as such in their own headers. If a change to either file seems necessary, it belongs in the hub's templates, not as a direct edit here — a direct edit breaks the byte-identical drift check the review workflow relies on.
- **Never pin a script hash inside workflow YAML.** Scripts the workflows fetch from the hub must be verified through the shared verification function against the hub's manifest digest — never against a hash pinned in the workflow file itself. Do not reintroduce `curl | bash`, and do not execute or source a fetched script before verification.
- **Respect fork-sentinel conventions where they apply.** If you are editing a file in this tap that mirrors or vendors content from an upstream project, preserve any existing sentinel-comment convention around edited regions rather than silently diverging.
- **One source of truth for every fact.** Don't duplicate a constant, label, version string, or URL in two places when one already owns it. If you find the same value hardcoded in two files, prefer fixing the duplication over adding a third copy.

### Ruby (formula/cask) conventions

- Match the formatting Homebrew itself expects (two-space indentation, double-quoted strings for interpolation, single-quoted otherwise) so that `brew audit` and `brew style` pass cleanly.
- Keep `url`, `sha256`, and `version` fields together and update them as a single atomic change — never land a URL bump without its matching checksum.
- Avoid inline comments that merely restate the field name; comment only non-obvious choices (e.g., why a particular release channel or mirror is used).

### YAML / workflow conventions

- Keep generated workflow files untouched except through the hub's setup/update flow described above.
- In any YAML you author directly (e.g., repository metadata), keep keys and values quoted consistently and avoid unquoted values that could be misread as other types.

---

## Running and writing tests

This repository has no `test/` or `spec/` directory and no application code to unit test. "Testing" means validating the Ruby Cask/Formula definitions with Homebrew's own tooling and exercising the install flow they drive. Full instructions are in [Testing](./docs/development/testing/README.md); in summary:

1. **Tap your local checkout** so `brew` resolves against the file you are editing.
2. **Style and lint** with `brew style` — catches most formatting issues a reviewer would otherwise flag.
3. **Audit** with `brew audit` (add `--strict`/`--cask` as appropriate) — checks `url`, `sha256`, `version`, naming conventions, and `livecheck` configuration.
4. **Install smoke test** — run a real (or `--dry-run`) `brew install` / `brew install --cask` against the changed definition.
5. **Upgrade and uninstall paths** — if your change touches versioning, `livecheck`, or `uninstall`/`zap` stanzas, also verify `brew upgrade --cask` and `brew uninstall --cask`.
6. **Clean up** your local tap (`brew untap`) once done so it doesn't shadow the published tap afterward.

When adding or changing a cask/formula, work through the checklist in [Testing](./docs/development/testing/README.md): syntax/style, required stanzas (`version`, checksum, `url`, and for casks the correct artifact stanza), naming conventions, `livecheck`, install verification, channel-variant coverage (stable/stage/dev), and upgrade/uninstall behavior where relevant.

There is no code-coverage tool or threshold configured for this repository. Instead, treat the scenario table in [Testing](./docs/development/testing/README.md) — fresh install, upgrade, uninstall/zap, every supported channel, and clean style/audit — as the bar a change must clear before merging. The automated code-review workflow performs code review, not functional testing; it does not substitute for running `brew style` / `brew audit` / a real install yourself.

---

## Reporting security issues

Do not open a public GitHub issue, pull request, or discussion for a security problem. Follow the process in [SECURITY.md](./SECURITY.md), which covers how to report a vulnerability, what to expect in response, and what is in and out of scope.

For the security posture specific to this tap — the supply-chain concerns around cask checksums, download URLs, and CI workflow credential handling — see [Security (development docs)](./docs/development/security/README.md).

---

## Where to find more documentation

- [Development documentation hub](./docs/development/README.md) — the full index of setup, local development, security, testing, and contributing docs.
- [docs/README.md](./docs/README.md) — the top-level documentation index for this repository.

If you run into a bug in the tap itself (not in the OpenFrame client it installs), file it at [flamingo-stack/homebrew-openframe/issues](https://github.com/flamingo-stack/homebrew-openframe/issues). Open pull requests at [flamingo-stack/homebrew-openframe/pulls](https://github.com/flamingo-stack/homebrew-openframe/pulls).
