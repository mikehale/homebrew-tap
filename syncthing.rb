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

  def caveats; <<-EOS.undent
    You can always start syncthing manually by executing `syncthing` in a Terminal.

    Alternatively you can create a launchd script that automatically starts the syncthing daemon at boot and keeps it running.
    An example script would look like this:

    <?xml version="1.0" encoding="UTF-8"?>
      <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
      <plist version="1.0">
      <dict>
        <key>KeepAlive</key>
        <true/>
        <key>Label</key>
        <string>net.syncthing.syncthing</string>
        <key>Program</key>
        <string>/usr/local/bin/syncthing</string>
        <key>RunAtLoad</key>
        <true/>
      </dict>
    </plist>
  EOS
  end
end