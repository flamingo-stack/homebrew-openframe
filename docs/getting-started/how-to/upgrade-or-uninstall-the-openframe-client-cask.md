# How to upgrade or uninstall the OpenFrame client cask

This tutorial shows an end user who installed the OpenFrame client on macOS using Homebrew how to upgrade the client to a newer version, or remove it completely, using the `brew` command line.

## Prerequisites

- Homebrew is installed on the Mac (check by running `brew --version` in Terminal).
- The OpenFrame client cask was installed through Homebrew from the `flamingo-stack/homebrew-openframe` tap. If you installed the client a different way, these steps do not apply; see `./install-the-openframe-client-with-homebrew.md` for the install steps this tap supports.
- You know which channel of the client you installed (stable, stage, or dev), since upgrade and uninstall commands target the cask name for that channel. If you are not sure, see `./install-a-specific-openframe-client-channel-stage-or-dev.md`.
- Terminal access with permission to run `brew` commands (some steps may prompt for your Mac password to complete privileged actions).

## Steps

1. Open Terminal on your Mac.
2. Check which version of the OpenFrame client cask is currently installed by running `brew list --cask --versions openframe-client` (replace `openframe-client` with the channel-specific cask name if you installed the stage or dev channel).
3. Update Homebrew's own knowledge of available cask versions by running `brew update`.
4. Upgrade the OpenFrame client cask to the latest available version by running `brew upgrade --cask openframe-client` (use the matching channel cask name if applicable).
5. If you instead want to remove the client entirely, run `brew uninstall --cask openframe-client` (use the matching channel cask name if applicable).
6. If Homebrew reports that the cask is still in use or asks for confirmation, follow the prompt shown in Terminal, then re-run the same `brew uninstall --cask` command.
7. Confirm the result by running `brew list --cask` and checking whether `openframe-client` (or the channel-specific name) still appears in the list.

## Expected result

- After an upgrade, `brew list --cask --versions openframe-client` shows the new version number.
- After an uninstall, `openframe-client` no longer appears in the output of `brew list --cask`.

The material available for this tap does not show the exact text Homebrew prints during a successful upgrade or uninstall, so treat the version check and the list check above as your confirmation rather than specific console text.

## Troubleshooting

The material available for this tap does not document specific error messages for cask upgrade or uninstall failures. If a `brew upgrade --cask` or `brew uninstall --cask` command fails or reports a message you do not recognize, read the message Terminal prints carefully, as it comes directly from Homebrew rather than from OpenFrame, and address what it describes (for example, re-running `brew update` first, or retrying the command) before trying again.
