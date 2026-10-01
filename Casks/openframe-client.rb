cask "openframe-client" do
  version "1.5.0"
  sha256 "d7a4ef7580a8f6903a23f7d7b878e7679c4c5cac7df096fac6eb938033bfbd44"

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
