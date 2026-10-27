# Flamingo OpenFrame Homebrew tap

Homebrew tap for the [OpenFrame](https://openframe.ai/) device agent, `openframe-client`, on macOS.

## Install

```sh
brew install --cask flamingo-stack/openframe/openframe-client
```

Install the cask of the platform your tenant is on. All three install the same agent and service, so only one can be installed at a time.

| Platform | Cask |
|---|---|
| openframe.ai | `openframe-client` |
| openframe.miami | `openframe-client@stage` |
| qa.openframe.build | `openframe-client@dev` |

Homebrew 7 loads casks from third-party taps only when they are named in full (`flamingo-stack/openframe/<cask>`), as every command here does. To use the short names, trust the tap once: `brew trust flamingo-stack/openframe`.

Homebrew asks for your password once: the cask registers the system service `com.openframe.client` (a LaunchDaemon). The service stays idle and sends nothing until the device is connected.

## Connect the device

Run the command shown in your OpenFrame tenant under **Devices → Add device**:

```sh
sudo openframe-client auth --serverUrl <tenant host> --initialKey <key> --orgId <organization id> --userId <user id>
```

The device registers within a minute. `sudo openframe-client doctor` checks its health.

## Updates

Updates are delivered by the OpenFrame platform, not by Homebrew. The casks have no version: a new install downloads the platform's current release, and the running agent updates itself from there.

`brew upgrade` skips these casks. `brew upgrade --greedy` and `brew reinstall --cask flamingo-stack/openframe/openframe-client` run the uninstall first: the device is deregistered and returns to the waiting state. Run `auth` again afterwards.

## Uninstall

```sh
brew uninstall --cask flamingo-stack/openframe/openframe-client
```

This stops and removes the service, deregisters the device, removes the integrated tools and deletes the binary. Add `--zap` to also delete the data, logs and service definition.

## More

Full reference for the agent: [openframe-oss-lib `clients/README.md`](https://github.com/flamingo-stack/openframe-oss-lib/blob/main/clients/README.md#openframe-client-device-agent-install-enrol-remove).
