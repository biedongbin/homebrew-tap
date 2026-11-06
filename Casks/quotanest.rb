cask "quotanest" do
  version "1.0.0"
  sha256 "c4eaf5624b80c087f22ba1bbe65266bf1f0385ce548efe96a0fc9ceb178a564a"

  url "https://github.com/biedongbin/QuotaNest/releases/download/v#{version}/QuotaNest-#{version}-universal.zip"
  name "QuotaNest"
  desc "Menu bar quota monitor with floating HUD and scheduled API calls"
  homepage "https://github.com/biedongbin/QuotaNest"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on formula: "node"
  depends_on macos: :sonoma

  app "QuotaNest.app"

  postflight_steps do
    run "/usr/bin/xattr",
        args: ["-dr", "com.apple.quarantine", "{{appdir}}/QuotaNest.app"]
  end

  uninstall quit: "local.quotanest"
end
