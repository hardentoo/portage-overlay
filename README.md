# Portage overlay for HS apps

This is a [Portage overlay][overlay] to install apps from [Hardcoded Software][hs].

## Install

1. Make sure you have [layman][layman] installed.
2. Run `sudo layman -f -o https://raw.githubusercontent.com/hsoft/portage-overlay/master/repositories.xml -a hsoft`.
3. You can now emerge packages from the overlay. Example: `sudo emerge dupeguru-se`.

## Packages provided

* `moneyguru`
* `dupeguru-se`
* `dupeguru-me`
* `dupeguru-pe`
* `send2trash-1.3.0` (gentoo has 1.2.0)
* `hsaudiotag3k` (needed for `dupeguru-me`)

[overlay]: https://wiki.gentoo.org/wiki/Overlay
[hs]: http://www.hardcoded.net
[layman]: http://wiki.gentoo.org/wiki/Layman

