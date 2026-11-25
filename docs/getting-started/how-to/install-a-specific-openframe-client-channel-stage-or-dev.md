# How to install a specific OpenFrame client channel (stage or dev)

This tutorial shows an IT operator or engineer how to install a non-production build of the OpenFrame client — the `stage` or `dev` channel — using Homebrew, instead of the default production cask.

> This repository (`flamingo-stack/homebrew-openframe`) is the Homebrew tap that publishes the OpenFrame client casks. The ecosystem graph for this repository records no published artifact pinned by another repository and no recorded consumers (coverage is partial, so this is not proof that nothing depends on it — it only means the graph has nothing fresh to show). The material available for this tap does not include the actual cask source files, so this tutorial documents only what can be said with confidence about installing from a Homebrew tap: the general `brew install`/`tap` workflow. Where the material does not show the exact cask name for the stage or dev channel, that is stated plainly below instead of being guessed.

## Prerequisites

Before you start, confirm each of these:

- You are on macOS, since Homebrew casks target macOS.
- Homebrew is installed. Check by running `brew --version` in a terminal; if it prints no version, install Homebrew first.
- You know whether you want the **stage** channel (pre-production, for testing upcoming releases) or the **dev** channel (active development builds, least stable).
- You have already read how to install the standard production client, described in [Install the OpenFrame client with Homebrew](./install-the-openframe-client-with-homebrew.md), so you understand the baseline `brew install` flow this tutorial adapts.
- You have a terminal application open (Terminal.app, iTerm, or similar) with network access to GitHub, since Homebrew taps and casks are fetched from there.
- If you already installed the default (production) OpenFrame client cask and want to switch channels, be ready to uninstall it first — see [Upgrade or uninstall the OpenFrame client cask](./upgrade-or-uninstall-the-openframe-client-cask.md) — because Homebrew does not let two casks that install the same application coexist cleanly.

## Steps

1. Open your terminal application.
2. Add the tap by running `brew tap flamingo-stack/openframe` (the same tap used for the production install) so Homebrew knows where to find the OpenFrame casks, if it is not already tapped — check with `brew tap` to see your current list of tapped repositories.
3. List the casks available from the tap by running `brew search openframe-client` to see the exact cask names published for the stage and dev channels; the material available here does not show the literal cask filenames, so use this search output as the source of truth rather than guessing a name.
4. Install the channel-specific cask by running `brew install --cask <cask-name-you-found-in-step-3>`, substituting the exact name shown by your search (for example, a name containing `stage` or `dev` as published by the tap).
5. Confirm the install finished by watching the terminal output for Homebrew's completion message after the download and installation steps complete.
6. Verify which cask is installed by running `brew list --cask` and locating the stage or dev cask name in the list, confirming you are not also still running the production cask.

## Expected result

When the install succeeds, Homebrew's terminal output ends with its standard cask-installation success message, and running `brew list --cask` afterwards shows the stage or dev cask name you installed in step 4 in the list of installed casks.

## Troubleshooting

- **`Error: No available cask with the name "..."`**: The cask name you typed does not match what the tap publishes. Re-run `brew search openframe-client` (step 3) and use the exact name it returns.
- **`Error: Cask '...' conflicts with ...`** (or similar conflict message naming the production cask): You already have the production OpenFrame client cask installed. Uninstall it first using the steps in [Upgrade or uninstall the OpenFrame client cask](./upgrade-or-uninstall-the-openframe-client-cask.md), then retry step 4.
- **The tap is not found when you run `brew search`**: Confirm the tap was added successfully by running `brew tap` and checking that `flamingo-stack/openframe` appears; if not, repeat step 2.

The material available for this tap does not document a command-line flag or configuration file for switching channels after installation, so if you need to move from one channel to another, repeat the uninstall-then-install steps described above rather than expecting an in-place channel switch.
