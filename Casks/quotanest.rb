cask "quotanest" do
  version "1.0.0"
  sha256 "b4232c308f3f607db201bdcf696945f2e85d300775ffddce77ad762767b76aed"

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
