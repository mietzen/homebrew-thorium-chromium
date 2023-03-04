require "pry-byebug"; binding.pry

cask "thorium-chromium" do
  arch arm: "arm64", intel: "x86-64"

  version "M109.0.5414.120-2"
  sha256 arm:   "1d49f062c8806b282aadec0504bc7b756a2805c82cae41e675206acfae198610",
         intel: "d4ec6db1cd028041166dacb3a121406ce1619ebd965073600f9e43206b42f92b"

  url "https://github.com/Alex313031/Thorium-Special/releases/download/#{version}/Thorium_MacOS_#{arch}.dmg",
      verified: "github.com/Alex313031/Thorium-Special/"
  name "Thorium"
  desc "Thorium - The fastest browser on Earth"
  homepage "https://thorium.rocks/"

  livecheck do
    url "https://api.github.com/repos/Alex313031/Thorium-Special/releases"
    regex(/.*MacOS.*/i)
    strategy :json do |json, regex|
      json["versions"].select { |item| item["name"]&.match?(regex) }
                      .map { |item| item["tag_name"] }
    end
  end

  app "Thorium.app"

  zap trash: [
    "~/Library/Application Support/Thorium",
    "~/Library/Caches/Thorium",
    "~/Library/Preferences/org.chromium.Thorium.plist",
    "~/Library/Saved Application State/org.chromium.Thorium.savedState",
  ]
end
