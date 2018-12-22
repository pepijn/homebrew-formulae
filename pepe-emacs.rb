class PepeEmacs < Formula
  head "https://github.com/pepijn/homebrew-formulae.git"

  def install
    File.open('pepe-emacs', 'w') { |file| file.write(<<~EOS
#!/usr/bin/env bash
set -euo pipefail

exec emacsclient --no-wait --create-frame --alternate-editor=/dev/null "$@"
EOS
                                                    )
    }

    bin.install 'pepe-emacs'
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
        <string>/usr/local/bin/emacs</string>
        <string>--fg-daemon</string>
      </array>
      <key>StandardOutPath</key>
      <string>/Users/#{ENV['USER']}/Library/Logs/#{name}.stdout.log</string>
      <key>StandardErrorPath</key>
      <string>/Users/#{ENV['USER']}/Library/Logs/#{name}.stderr.log</string>

      <key>EnvironmentVariables</key>
      <dict>
        <key>PEPE_AUTOMATIC</key>
        <string>launchctl</string>

        <key>PATH</key>
        <string>/bin:/usr/bin:/usr/local/bin</string>
      </dict>
    </dict>
    </plist>
  EOS
  end
end
