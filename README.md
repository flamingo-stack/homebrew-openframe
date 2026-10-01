# Flamingo OpenFrame Homebrew tap

Homebrew tap for the [OpenFrame](https://openframe.ai/) device agent, `openframe-client`, on macOS.

## Install

```sh
brew install --cask flamingo-stack/openframe/openframe-client
```

Homebrew asks for your password once: the cask registers the system service `com.openframe.client` (a LaunchDaemon). The service stays idle and sends nothing until the device is connected.

## Connect the device

Run the command shown in your OpenFrame tenant under **Devices → Add device**:

```sh
sudo openframe-client auth --serverUrl <tenant host> --initialKey <key> --orgId <organization id> --userId <user id>
```

The device registers within a minute. `sudo openframe-client doctor` checks its health.

## Updates

Updates are delivered by the OpenFrame platform, not by Homebrew. The cask version is the release a new install starts from; the running agent moves ahead of it on its own.

When the cask version changes, `brew upgrade` also upgrades this cask (Homebrew 7 upgrades casks marked `auto_updates`). An upgrade, like `brew reinstall --cask openframe-client`, runs the uninstall first: the device is deregistered and returns to the waiting state. Run `auth` again afterwards, or keep `brew upgrade` away from it with `export HOMEBREW_NO_UPGRADE_AUTO_UPDATES_CASKS=1`.

## Uninstall

```sh
brew uninstall --cask openframe-client
```

This stops and removes the service, deregisters the device, removes the integrated tools and deletes the binary. Add `--zap` to also delete the data, logs and service definition.

## More

Full reference for the agent: [openframe-oss-lib `clients/README.md`](https://github.com/flamingo-stack/openframe-oss-lib/blob/main/clients/README.md#openframe-client-device-agent-install-enrol-remove).
