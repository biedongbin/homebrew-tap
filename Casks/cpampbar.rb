cask "cpampbar" do
  version "1.3.0"
  sha256 "9d58e586e5bdc2caba01eb475957ff05d0dd1046d840392e07c789e4addeae30"

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
    run "/usr/bin/xattr",
        args: ["-dr", "com.apple.quarantine", "{{appdir}}/CpampBar.app"]
  end

  zap trash: [
    "~/Library/Application Support/CpampBar",
    "~/Library/Preferences/com.biedongbin.cpampbar.plist",
  ]
end
