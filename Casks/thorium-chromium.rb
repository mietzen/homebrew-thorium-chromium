cask "thorium-chromium" do
  arch arm: "arm64", intel: "x86-64"

  version "M109.0.5414.120-2"

  on_intel do
    arch_name "x64"
    sha256 "d4ec6db1cd028041166dacb3a121406ce1619ebd965073600f9e43206b42f92b"
  end
  on_arm do
    arch_name "ARM64"
    sha256 "d4e8258a9e91618d2da82968285498f035f31e4912646479c225b1a4ae43675c"
  end

  url "https://github.com/Alex313031/Thorium-Special/releases/download/#{version}/Thorium_MacOS_#{arch_name}.dmg"

  name "Thorium"
  desc "Thorium - The fastest browser on Earth."
  homepage "https://thorium.rocks/"

  conflicts_with cask: [
    "chromium",
    "eloston-chromium",
    "freesmug-chromium"
  ]

  app "Thorium.app"

  zap trash: [
    "~/Library/Application Support/Chromium",
    "~/Library/Caches/Chromium",
    "~/Library/Preferences/org.chromium.Chromium.plist",
    "~/Library/Saved Application State/org.chromium.Chromium.savedState",
  ]

end
