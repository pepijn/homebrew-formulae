class BashHistoryBackup < Formula
  head "https://github.com/pepijn/bash-history-backup.git"

  def install
    bin.install "bin/#{name}"
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
        <string>#{var}/#{name}</string>
      </array>
      <key>StandardOutPath</key>
      <string>/Users/#{ENV['USER']}/Library/Logs/#{name}.log</string>
      <key>StandardErrorPath</key>
      <string>/Users/#{ENV['USER']}/Library/Logs/#{name}.log</string>

      <key>StartInterval</key>
      <integer>600</integer><!-- seconds -->

      <key>EnvironmentVariables</key>
      <dict>
        <key>PEPE_AUTOMATIC</key>
        <string>launchctl</string>

        <key>PATH</key>
        <string>/bin:/usr/bin:/usr/local/bin:/usr/sbin</string>
      </dict>
    </dict>
    </plist>
  EOS
  end
end
