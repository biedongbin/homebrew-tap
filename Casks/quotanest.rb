cask "quotanest" do
  version "1.0.0"
  sha256 "74d0e007c1e1594be4c4a3f662c88ac4998ef3e8112a016a29a3833b55897603"

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
