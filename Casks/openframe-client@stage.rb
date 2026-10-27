cask "openframe-client@stage" do
  # The download serves the platform's current release; the agent updates itself from there.
  version :latest
  sha256 :no_check

  url "https://openframe.miami/v0/api/assets/download?agent=client&platform=macos"
  name "OpenFrame Client (stage)"
  desc "Device agent for remote monitoring and management"
  homepage "https://openframe.miami/"

  conflicts_with cask: ["openframe-client", "openframe-client@dev"]
  depends_on :macos

  installer script: {
    executable: "openframe-client",
    args:       ["install"],
    sudo:       true,
  }

  uninstall script: {
              executable:   "openframe-client",
              args:         ["uninstall"],
              sudo:         true,
              must_succeed: false,
            },
            delete: "/usr/local/bin/openframe-client"

  zap delete: [
    "/Library/Application Support/OpenFrame",
    "/Library/LaunchDaemons/com.openframe.client.plist",
    "/Library/Logs/OpenFrame",
  ]

  caveats <<~EOS
    The service waits until the device is connected. Run the command shown in
    your OpenFrame tenant under Devices > Add device:
      sudo openframe-client auth --serverUrl <tenant host> --initialKey <key> --orgId <organization id>
  EOS
end
