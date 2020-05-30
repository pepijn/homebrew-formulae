class PEpijNl < Formula
  head "https://github.com/pepijn/pepijn.github.io.git"

  depends_on "rbenv"

  def install
    bin.install "_bin/p.epij.nl"
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
        <string>/usr/local/bin/p.epij.nl</string>
        <string>/Users/#{ENV['USER']}/dev/personal/#{name}</string>
      </array>
      <key>StandardOutPath</key>
      <string>/Users/#{ENV['USER']}/Library/Logs/#{name}.stdout.log</string>
      <key>StandardErrorPath</key>
      <string>/Users/#{ENV['USER']}/Library/Logs/#{name}.stderr.log</string>

      <key>EnvironmentVariables</key>
      <dict>
        <key>LANG</key>
        <string>en_US.UTF-8</string>

        <key>PATH</key>
        <string>/bin:/usr/bin:/usr/local/bin</string>
      </dict>
    </dict>
    </plist>
  EOS
  end
end
