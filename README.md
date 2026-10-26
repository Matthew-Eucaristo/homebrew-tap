# homebrew-tap

Homebrew tap for terminal and macOS tools by [Matthew-Eucaristo](https://github.com/Matthew-Eucaristo).

```bash
brew tap matthew-eucaristo/tap
```

| Tool | Install | What it is |
| --- | --- | --- |
| [s1](https://github.com/Matthew-Eucaristo/s1) | `brew install --cask s1` | Voice-first macOS control agent (fast System 1 + LLM System 2, accessibility-native). Ad-hoc signed → or `--no-quarantine`. |
| [flutterkill](https://github.com/Matthew-Eucaristo/flutterkill) | `brew install flutterkill` | npkill-style TUI that reclaims disk space from Flutter/Dart build artifacts and caches. Built from source. |

## Uninstall leaves nothing behind

```bash
brew uninstall --cask s1          # app + CLI symlink gone — zero residue
brew uninstall --zap --cask s1    # + ~/.s1 + all Library traces wiped

brew uninstall flutterkill        # flutterkill writes no config, cache or state
brew autoremove                   # drops Go if it was only a build dependency

brew untap matthew-eucaristo/tap
```

## How releases land

- **s1**: `releases/v<version>/` holds the signed universal artifacts the cask downloads, served from this repo's `raw.githubusercontent.com` while s1 is private. Bump = new artifact files + url/sha256 here; `scripts/publish-tap.sh` in the s1 repo automates it.
- **flutterkill**: `Formula/flutterkill.rb` builds the tagged source tarball. Bump = new url + sha256 here (steps in the flutterkill repo's RELEASING.md).
