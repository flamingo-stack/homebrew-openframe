cask "openframe-client@dev" do
  # The download serves the platform's current release; the agent updates itself from there.
  version :latest
  sha256 :no_check

  url "https://qa.openframe.build/v0/api/assets/download?agent=client&platform=macos"
  name "OpenFrame Client (dev)"
  desc "Device agent for remote monitoring and management"
  homepage "https://qa.openframe.build/"

  conflicts_with cask: ["openframe-client", "openframe-client@stage"]
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
end
