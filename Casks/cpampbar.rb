cask "cpampbar" do
  version "1.1.2"
  sha256 "37a336fdb7c311aacbf8647c661a4b870a06e6072023db130dcaad28cf406470"

  url "https://github.com/biedongbin/cpamp-start-bar/releases/download/v#{version}/CpampBar-#{version}.app.zip"
  name "CpampBar"
  desc "Menu bar companion for CPA / CLIProxyAPI and CPAMP (CPA-Manager-Plus)"
  homepage "https://github.com/biedongbin/cpamp-start-bar"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :monterey

  app "CpampBar.app"

  # ad-hoc 签名（无 Developer ID）：解除 Gatekeeper 隔离，免首次手动放行
  postflight_steps do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/CpampBar.app"]
  end

  zap trash: [
    "~/Library/Application Support/CpampBar",
    "~/Library/Preferences/com.biedongbin.cpampbar.plist",
  ]
end
