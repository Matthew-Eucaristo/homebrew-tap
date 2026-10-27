# homebrew-tap

Homebrew tap for terminal and macOS tools by [Matthew-Eucaristo](https://github.com/Matthew-Eucaristo).

```bash
brew tap matthew-eucaristo/tap
```

| Tool | Install | What it is |
| --- | --- | --- |
| [s1](https://github.com/Matthew-Eucaristo/s1) | `brew install --cask s1` | Voice-first macOS control agent (fast System 1 + LLM System 2, accessibility-native). Ad-hoc signed → or `--no-quarantine`. |
| [flutterkill](https://github.com/Matthew-Eucaristo/flutterkill) | `brew install flutterkill` | npkill-style TUI that reclaims disk space from Flutter/Dart projects (`build/`, `.dart_tool/`, Pods, Gradle state) and machine-wide caches (pub, Gradle, FVM SDKs, Xcode), Trash first, with a measured receipt. Speaks the family `scan --json` / `apply --plan` contract. Built from source. |
| [fell](https://github.com/Matthew-Eucaristo/fell) | `brew install fell` | Finds git worktrees left behind by AI coding agents; strips or retires them to the Trash with a rescue bundle, never touching what an app still tracks. Built from source. |
| [nodekill](https://github.com/Matthew-Eucaristo/nodekill) | `brew install nodekill` | Reclaims disk space from the Node.js footprint: node_modules, framework caches, npm/pnpm/Yarn/Bun stores, npx entries, global packages and old Node versions, through each tool's own command, Trash first. Built from source. |
| [lately](https://github.com/Matthew-Eucaristo/lately) | `brew install lately` | What just happened on my Mac: a classified timeline of crashes, restarts, new background items and permission prompts from the logs macOS keeps. No root, no daemon. macOS only. Built from source. |
| [decruft](https://github.com/Matthew-Eucaristo/decruft) | `brew install decruft` | A better Storage settings screen for developers, in the terminal: one scan of Go, Xcode and simulators, Homebrew, CocoaPods/uv/pip, Docker and Android, plus everything fell, nodekill and flutterkill find, as a storage bar and treemap. Explains what macOS hides (purgeable, System Data, snapshots) and cleans through each tool's own command, Trash first. Installs fell, nodekill and flutterkill too. Built from source. |

## Uninstall leaves nothing behind

```bash
brew uninstall --cask s1          # app + CLI symlink gone — zero residue
brew uninstall --zap --cask s1    # + ~/.s1 + all Library traces wiped

brew uninstall flutterkill        # flutterkill writes no config, cache or state
brew uninstall fell               # fell writes no config, cache or state
brew uninstall nodekill           # nodekill writes no config, cache or state
brew uninstall decruft            # decruft writes no config, cache or state
lately forget && brew uninstall lately   # forget removes its one baseline file first
brew autoremove                   # drops Go if it was only a build dependency

brew untap matthew-eucaristo/tap
```

## How releases land

- **s1**: `releases/v<version>/` holds the signed universal artifacts the cask downloads, served from this repo's `raw.githubusercontent.com` while s1 is private. Bump = new artifact files + url/sha256 here; `scripts/publish-tap.sh` in the s1 repo automates it.
- **flutterkill**: `Formula/flutterkill.rb` builds the tagged source tarball. Bump = new url + sha256 here (steps in the flutterkill repo's RELEASING.md).
- **fell**: `Formula/fell.rb` builds the tagged source tarball the same way (steps in the fell repo's RELEASING.md).
- **nodekill**: `Formula/nodekill.rb`, the same way (steps in the nodekill repo's RELEASING.md).
- **lately**: `Formula/lately.rb`, the same way (steps in the lately repo's RELEASING.md).
- **decruft**: `Formula/decruft.rb`, the same way (steps in the decruft repo's RELEASING.md). It `depends_on` fell, nodekill and flutterkill from this tap, so release those first when their contract changes.
