# homebrew-tap

Homebrew tap for [s1](https://github.com/Matthew-Eucaristo/s1) — a voice-first
macOS control agent (fast System 1 + LLM System 2, accessibility-native).

```bash
brew tap matthew-eucaristo/s1

brew install s1                 # CLI (s1 command)
brew install --cask s1          # menu-bar app + notch HUD (S1.app)
# ad-hoc signed → or: brew install --cask --no-quarantine s1
```

Uninstall leaves nothing behind:

```bash
brew uninstall s1               # CLI gone — zero residue
brew uninstall --zap --cask s1  # app + ~/.s1 + all Library traces gone
brew untap matthew-eucaristo/s1
```

## How releases land

`releases/v<version>/` holds the signed universal artifacts the formula and
cask download. Served from this repo's `raw.githubusercontent.com` so install
works while s1 is still private — when s1 goes public, urls move to proper
GitHub Release assets (same `Formula/`/`Casks/` files, new url+sha256).

Bump = new artifact files + url/sha256 bump here. `scripts/publish-tap.sh`
in the s1 repo automates it once releases exist.
