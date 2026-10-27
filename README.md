# Flamingo OpenFrame Homebrew tap

Homebrew tap for the [OpenFrame](https://openframe.ai/) device agent, `openframe-client`, on macOS.

## Install

```sh
brew install --cask flamingo-stack/openframe/openframe-client
```

Pre-production platforms have their own cask: `openframe-client@stage` (openframe.miami) and `openframe-client@dev` (qa.openframe.build). Install the one matching your tenant; the three conflict, so only one is installed at a time.

Homebrew asks for your password once: the cask registers the system service `com.openframe.client` (a LaunchDaemon). The service stays idle and sends nothing until the device is connected.

## Connect the device

Run the command shown in your OpenFrame tenant under **Devices → Add device**:

```sh
sudo openframe-client auth --serverUrl <tenant host> --initialKey <key> --orgId <organization id> --userId <user id>
```

The device registers within a minute. `sudo openframe-client doctor` checks its health.

## Updates

Updates are delivered by the OpenFrame platform, not by Homebrew. The casks have no version: a new install downloads the platform's current release, and the running agent updates itself from there.

`brew upgrade` skips these casks. `brew upgrade --greedy` and `brew reinstall --cask openframe-client` run the uninstall first: the device is deregistered and returns to the waiting state. Run `auth` again afterwards.

## Uninstall

```sh
brew uninstall --cask openframe-client
```

This stops and removes the service, deregisters the device, removes the integrated tools and deletes the binary. Add `--zap` to also delete the data, logs and service definition.

## More

Full reference for the agent: [openframe-oss-lib `clients/README.md`](https://github.com/flamingo-stack/openframe-oss-lib/blob/main/clients/README.md#openframe-client-device-agent-install-enrol-remove).
