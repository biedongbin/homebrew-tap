cask "cpampbar" do
  version "1.1.1"
  sha256 "cdcaccfabdb55097c602396ce466952939dfd173ba1a0fc2d60e7f1c196e73ad"

  url "https://github.com/biedongbin/cpamp-start-bar/releases/download/v#{version}/CpampBar-#{version}.app.zip"
  name "CpampBar"
  desc "Menu bar companion for CPA / CLIProxyAPI and CPAMP (CPA-Manager-Plus)"
  homepage "https://github.com/biedongbin/cpamp-start-bar"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :monterey"

  app "CpampBar.app"

  # ad-hoc 签名（无 Developer ID）：解除 Gatekeeper 隔离，免首次手动放行
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/CpampBar.app"]
  end

  zap trash: [
    "~/Library/Application Support/CpampBar",
    "~/Library/Preferences/com.biedongbin.cpampbar.plist",
  ]
end
