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

  zap trash: [
    "~/Library/Application Support/CpampBar",
    "~/Library/Preferences/com.biedongbin.cpampbar.plist",
  ]
end
