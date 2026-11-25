# How to install the OpenFrame client with Homebrew

This tutorial shows a macOS user how to install the OpenFrame client onto their Mac using Homebrew, Apple's package manager for the command line.

## Prerequisites

- You are using a Mac running macOS.
- Homebrew is installed on your Mac. Check this by opening the Terminal application and running `brew --version`; if you see a version number, Homebrew is installed. If you see "command not found", install Homebrew first from the official Homebrew site before continuing.
- You have access to the Terminal application (found in Applications > Utilities, or via Spotlight search).
- You know which OpenFrame environment you need to connect to, since the client will need to be configured after installation; the material available to this tutorial does not describe that configuration step, so check with your administrator if you are unsure.

> The material available for this tutorial describes only the Homebrew tap repository itself (`flamingo-stack/homebrew-openframe`), and does not include the exact cask name, the install flags, or the post-install configuration flow. Where a step cannot be confirmed from that material, this document says so rather than guessing.

## Steps

1. Open the **Terminal** application on your Mac.
2. Add the OpenFrame Homebrew tap by running `brew tap flamingo-stack/homebrew-openframe` in Terminal. This tells Homebrew where to find the OpenFrame client package.
3. Install the OpenFrame client by running the `brew install` command for the OpenFrame cask. The material available for this tutorial does not specify the exact cask name to pass to `brew install`; confirm the correct package name from your administrator or from the tap's listing before running the install command.
4. Watch the Terminal output while Homebrew downloads and installs the package.
5. Confirm the client is present on your Mac by checking the Applications folder, or by running `brew list` in Terminal and looking for the installed OpenFrame entry.

## Expected result

Homebrew prints its normal download and installation progress in the Terminal window while the OpenFrame client is fetched and installed. The specific success message and final file locations are not shown in the material available for this tutorial, so confirm success by checking that the command finishes without an error and that `brew list` shows the OpenFrame entry afterward.

## Troubleshooting

- **"command not found: brew"**: Homebrew is not installed, or your Terminal session cannot find it. Install Homebrew before repeating these steps.
- **The `brew tap` or `brew install` command reports it cannot find the tap or the package**: double-check you typed `flamingo-stack/homebrew-openframe` exactly, since Homebrew tap and package names are case-sensitive and must match exactly.
- For anything beyond these two messages, the material available for this tutorial does not document further Homebrew error output for this package, so consult your administrator or the tap's own listing for current guidance.

If you need to install a specific release channel of the client instead of the default one, see [Install a specific OpenFrame client channel (stage or dev)](./install-a-specific-openframe-client-channel-stage-or-dev.md). If you later need to upgrade or remove the client, see [Upgrade or uninstall the OpenFrame client cask](./upgrade-or-uninstall-the-openframe-client-cask.md).
