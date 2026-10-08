cask "openframe-client" do
  version "1.5.22"
  sha256 "ce0c3b5346a7f5e48f0a329e074ce9f3ea844af2c8098c6058e28ca6875f1e17"

  url "https://openframe.ai/v0/api/assets/download?agent=client&platform=macos&version=#{version}"
  name "OpenFrame Client"
  desc "Device agent for remote monitoring and management"
  homepage "https://openframe.ai/"

  livecheck do
    skip "Updates are delivered by the OpenFrame platform"
  end

  auto_updates true
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
