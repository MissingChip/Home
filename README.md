
# Home Sweet Home

configuration files for a homely \*nix experience

just run `make` to sync everything
 - the `config` directory will be synced with `~/.config`
 - files in the `dot` directory will be coptied from `dot/*` to `~/.*`
 - files in this directory will be copied to your home directory (excluding the special ones, of course)
 - `sync.*` will be run with the shell matching the extension name, and a first argument of the destination directory.
