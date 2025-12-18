# Brew

Yet another dangerous brew for you!

## Install
You can install fomulaes and casks as follows:

```sh
brew install draftbrew/tap/<formula|cask>
```

## Unsigned

Some casks are not signed, you should run with `--no-quarantine` option.

```sh
brew install --no-quarantine draftbrew/tap/<cask>
```

Check the target by `brew info <cask>`.
