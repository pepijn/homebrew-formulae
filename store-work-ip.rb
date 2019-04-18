class StoreWorkIp < Formula
  head "https://github.com/pepijn/store-work-ip.git"

  def install
    bin.install name
  end

  def plist; <<~EOS
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
    <dict>
      <key>Label</key>
      <string>#{plist_name}</string>

      <key>RunAtLoad</key>
      <true/>

      <key>ProgramArguments</key>
      <array>
        <string>/usr/local/bin/run-with-log</string>
        <string>#{opt_bin}/#{name}</string>
      </array>
      <key>StandardOutPath</key>
      <string>/Users/#{ENV['USER']}/Library/Logs/#{name}.log</string>
      <key>StandardErrorPath</key>
      <string>/Users/#{ENV['USER']}/Library/Logs/#{name}.log</string>

      <key>StartInterval</key>
      <integer>60</integer><!-- seconds -->

      <key>EnvironmentVariables</key>
      <dict>
        <key>PATH</key>
        <string>/bin:/usr/bin:/usr/sbin:/usr/local/bin</string>
      </dict>
    </dict>
    </plist>
  EOS
  end
end
