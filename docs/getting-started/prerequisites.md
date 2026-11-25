## Prerequisites

This page lists what you need **before** installing the OpenFrame client through this repository's Homebrew tap. `homebrew-openframe` (flamingo-stack/homebrew-openframe) is a [Homebrew tap](https://docs.brew.sh/Taps) — a Git repository of Homebrew formulae/casks. It does not ship application source code, a `package.json`, or a `pom.xml`; it publishes the install recipe (cask) that Homebrew uses to fetch and install the OpenFrame client on your machine.

> **Note on scope:** Because this repository is a Homebrew tap rather than an application or library, there is no build toolchain, package manager lockfile, or runtime dependency graph to configure. The prerequisites below are about your **local machine and Homebrew environment**, not about an application's dependency stack.

---

### 1. Required software and versions

| Requirement | Minimum Version | Purpose | Notes |
|---|---|---|---|
| macOS | Recent supported release | Host operating system | Homebrew and Homebrew Cask target macOS; this tap is for installing the OpenFrame client on Mac. |
| Homebrew | Latest stable | Package manager used to tap and install | Install from [brew.sh](https://brew.sh) if not already present. |
| Command Line Tools for Xcode | Latest available for your macOS version | Required by Homebrew itself | Installed automatically when Homebrew is first set up, or via `xcode-select --install`. |
| Git | Bundled with Command Line Tools | Used by Homebrew to clone/update taps | Verify with `git --version`. |
| Internet access | — | Required to tap the repository and download the cask | Needed for `brew tap` and `brew install` to reach GitHub and the release artifacts. |

> No frontend `package.json` or backend `pom.xml` was found in this repository — it is a Homebrew tap, not an application codebase. There is no Node.js, Java, or other language runtime prerequisite for this repository itself.

---

### 2. System requirements

- **Operating system:** macOS (Homebrew Cask installs are macOS-specific). This tap exists to install the OpenFrame client cask via Homebrew.
- **Architecture:** Whatever architecture your installed Homebrew targets (Apple Silicon or Intel) — use the Homebrew build appropriate for your Mac.
- **Disk space:** Sufficient free space for Homebrew's cache plus the installed OpenFrame client application bundle.
- **Permissions:** A user account able to run `brew` commands and, where prompted by macOS, grant installation permissions for the downloaded application (standard macOS Gatekeeper/privacy prompts may apply to installed casks).

---

### 3. Account / access requirements

- **GitHub access to the tap:** You need network access to `https://github.com/flamingo-stack/homebrew-openframe` so Homebrew can tap and fetch formula/cask definitions.
- **No repository write access needed for installation:** Installing the OpenFrame client only requires read/clone access (public tap usage); you do not need to be a collaborator on the repository to run `brew tap` and `brew install`.
- **Contributor access:** If you intend to modify the tap itself (update the cask, add a new channel/version), you will need appropriate permissions on `https://github.com/flamingo-stack/homebrew-openframe` (e.g., to open a pull request). See `../development/contributing/guidelines.md` for the contribution process.
- **Download source access:** The cask retrieves the OpenFrame client binary from its configured download location at install time; ensure your network/firewall allows outbound access to GitHub and any release/download hosts referenced by the cask.

---

### 4. Environment variables

This tap does not require application-level environment variables to be installed — Homebrew installation is driven by the `brew` CLI itself, not by `.env` configuration in this repository.

The environment variables that matter here are the standard Homebrew/shell variables already on your machine:

| Variable | Purpose | Typical value |
|---|---|---|
| `$PATH` | Must include Homebrew's bin directory so the `brew` command (and the installed OpenFrame client binary, if it exposes a CLI) can be found | `/opt/homebrew/bin` (Apple Silicon) or `/usr/local/bin` (Intel), plus your existing paths |
| `$HOME` | Used by Homebrew and macOS to resolve your user profile and application support directories | Your user home directory |
| `$HOMEBREW_PREFIX` | Set by Homebrew itself; identifies where Homebrew is installed | `/opt/homebrew` or `/usr/local`, depending on Mac architecture |

> If you are also setting up the broader OpenFrame platform (not just this tap), environment variables specific to the OpenFrame client or its runtime configuration are out of scope for this repository. Consult `../development/setup/environment.md` for environment variable guidance relevant to OpenFrame development repositories.

---

### 5. Verification commands

Run these before installing to confirm your machine is ready:

```bash
# Confirm you are on macOS and check the OS version
sw_vers

# Confirm Homebrew is installed and see its version
brew --version

# Confirm Command Line Tools / Git are available
git --version

# Confirm Homebrew's health (diagnoses common setup issues)
brew doctor

# Confirm $PATH includes Homebrew's bin directory
echo "$PATH"
```

Expected outcomes:

- `sw_vers` prints a supported macOS product version.
- `brew --version` prints a Homebrew version string (not "command not found").
- `git --version` prints a Git version (bundled with Command Line Tools).
- `brew doctor` reports "Your system is ready to brew" (or lists warnings you should resolve before proceeding).
- `echo "$PATH"` includes a Homebrew bin directory (`/opt/homebrew/bin` or `/usr/local/bin`).

Once Homebrew is confirmed working, verify you can reach this tap:

```bash
# Tap the repository (adds it as a Homebrew source)
brew tap flamingo-stack/openframe

# List taps to confirm it was added
brew tap
```

If `brew tap` succeeds and the tap appears in the listing, your environment is ready to proceed with installation, covered in `./how-to/install-the-openframe-client-with-homebrew.md`.

---

### What's next

- To install the OpenFrame client cask itself, follow `./how-to/install-the-openframe-client-with-homebrew.md`.
- To install a non-default release channel (stage or dev), see `./how-to/install-a-specific-openframe-client-channel-stage-or-dev.md`.
- To upgrade or remove an existing installation, see `./how-to/upgrade-or-uninstall-the-openframe-client-cask.md`.
- For a general orientation to the OpenFrame getting-started flow, see `./introduction.md` and `./quick-start.md`.
