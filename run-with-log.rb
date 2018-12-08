class RunWithLog < Formula
  head "https://github.com/pepijn/run-with-log.git"

  depends_on "terminal-notifier"

  def install
    bin.install "run-with-log"
  end
end
