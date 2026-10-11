# Homebrew tap for Gitslice

```bash
brew install gitslice-io/tap/gitslice
```

This installs `gs`, the [Gitslice](https://gitslice.io) CLI, on macOS and
Linux (arm64 and amd64), with its bash, zsh and fish completions.
`brew upgrade gitslice` installs new releases; a Homebrew-installed gs asks
for that instead of replacing itself with `gs upgrade`.

`gs` is also Ghostscript's command name, so the two formulae conflict. Without
Homebrew: `curl -fsSL https://gitslice.io/install.sh | sh`.

## How it stays current

`Formula/gitslice.rb` is written by `bin/update-formula` from a release's
`checksums.txt` at https://gitslice.io/releases. The `update` workflow runs it
hourly (or on demand: `gh workflow run update.yml --repo gitslice-io/homebrew-tap`),
checks that the new formula installs, and commits it. The `test` workflow
installs and tests the formula on macOS and Linux on every push.

The Gitslice source is the slice
[gitslice/gitslice](https://gitslice.io/slices/gitslice/gitslice); this tap only
packages its releases.
