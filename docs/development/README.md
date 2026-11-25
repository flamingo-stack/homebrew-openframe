## Overview

This is the development documentation hub for `homebrew-openframe`, the Homebrew tap that distributes the OpenFrame client (CLI and cask) to macOS users via `brew`. This section collects everything a contributor needs to set up a working environment, understand the security posture of the tap, run tests against the formula/cask definitions, and follow the contribution workflow before opening a pull request.

The tap itself holds Homebrew formula/cask manifests rather than application source code, and it fits into the broader OpenFrame ecosystem as the distribution channel for the OpenFrame client. The repository graph currently shows no verified upstream dependencies or downstream consumers recorded for `homebrew-openframe`, and two related repositories (OpenFrame CLI, OpenFrame OSS Tenant) are not indexed from here, so this document does not claim any specific dependency relationship beyond what is observed in this tap's own manifests.

> **Note:** Index coverage for this repository's ecosystem is partial. An absence of a recorded consumer or dependency above is not proof that none exists — it only reflects what the current graph snapshot could see.

If you are new to OpenFrame as a whole, start with the [Introduction](../getting-started/introduction.md), check the [Prerequisites](../getting-started/prerequisites.md), and then follow the [Quick Start](../getting-started/quick-start.md) guide before coming back here for day-to-day development tasks on this tap.

## What lives in this section

The Development section is organized so you can go from "nothing installed" to "ready to submit a change" in a predictable order:

1. **Environment setup** — installing Homebrew, cloning the tap, and tapping it locally so your changes are testable.
2. **Local development workflow** — iterating on formula/cask definitions and verifying them before pushing.
3. **Security practices** — how the tap and its release artifacts should be handled safely.
4. **Testing** — how to validate formula/cask syntax and installation behavior locally and in CI.
5. **Contributing** — the guidelines and review expectations for pull requests against this tap.

## Quick navigation

| Document | Purpose |
|---|---|
| [Environment Setup](./setup/environment.md) | Install prerequisites and configure your machine to work on this tap |
| [Local Development](./setup/local-development.md) | Day-to-day workflow for editing and testing formula/cask files locally |
| [Security](./security/README.md) | Security considerations and practices for this repository |
| [Testing](./testing/README.md) | How to test tap changes before opening a pull request |
| [Contributing Guidelines](./contributing/guidelines.md) | Expectations and process for contributing changes |

## Related getting-started guides

These guides live outside the Development section but are the most relevant companions when working on this tap, since they describe how end users actually consume what you are building here:

- [Introduction](../getting-started/introduction.md) — what OpenFrame is and how this tap fits in
- [Prerequisites](../getting-started/prerequisites.md) — what needs to be installed before you begin
- [Quick Start](../getting-started/quick-start.md) — fastest path to a working setup
- [First Steps](../getting-started/first-steps.md) — orientation after initial setup
- [Install the OpenFrame client with Homebrew](../getting-started/how-to/install-the-openframe-client-with-homebrew.md) — the end-user flow this tap enables
- [Install a specific OpenFrame client channel (stage or dev)](../getting-started/how-to/install-a-specific-openframe-client-channel-stage-or-dev.md) — working with non-stable channels
- [Upgrade or uninstall the OpenFrame client cask](../getting-started/how-to/upgrade-or-uninstall-the-openframe-client-cask.md) — lifecycle management for installed clients

## How to use this section

- **First time contributing?** Read [Environment Setup](./setup/environment.md) first, then [Local Development](./setup/local-development.md).
- **Making a change to a formula or cask?** Review [Testing](./testing/README.md) so you know how to validate it before opening a PR.
- **Handling secrets, tokens, or release artifacts?** Check [Security](./security/README.md) before you commit anything.
- **Ready to submit?** Follow [Contributing Guidelines](./contributing/guidelines.md) for PR expectations, and open your pull request at [flamingo-stack/homebrew-openframe/pulls](https://github.com/flamingo-stack/homebrew-openframe/pulls).

If you run into a bug in the tap itself (not in the OpenFrame client it installs), file it at [flamingo-stack/homebrew-openframe/issues](https://github.com/flamingo-stack/homebrew-openframe/issues).
