cask "openframe-client" do
  version "1.5.74"
  sha256 "264b6271f54cda53809a173c3e25491dd2758a43a9358933272e3e70bd25cbbd"

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
