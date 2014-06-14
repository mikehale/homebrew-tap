require "formula"

class Syncthing < Formula
  homepage "http://syncthing.net/"
  url "https://github.com/calmh/syncthing/releases/download/v0.8.14/syncthing-darwin-amd64-v0.8.14.tar.gz"
  sha1 "e96782948f4715e88858cf03727b1a8a7bfb03f2"

  def install
    bin.install "syncthing"
  end

  test do
    assert_equal "v#{version}", `#{bin}/syncthing -version`.strip.split[1]
  end

  def plist; <<-EOS.undent
    <?xml version="1.0" encoding="UTF-8"?>
      <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
      <plist version="1.0">
      <dict>
        <key>KeepAlive</key>
        <true/>
        <key>Label</key>
        <string>#{plist_name}</string>
        <key>ProgramArguments</key>
        <array>
          <string>#{bin}/syncthing</string>
        </array>
        <key>RunAtLoad</key>
        <true/>
      </dict>
    </plist>
  EOS
  end
end