cask "cpampbar" do
  version "1.2.0"
  sha256 "85af02f78f33d4546d572d91d9a326a3df5e58b18087ecb1df0b13e2e92848cf"

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
    run command: "/usr/bin/xattr",
        args: ["-dr", "com.apple.quarantine", "{{appdir}}/CpampBar.app"]
  end

  zap trash: [
    "~/Library/Application Support/CpampBar",
    "~/Library/Preferences/com.biedongbin.cpampbar.plist",
  ]
end
