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

## PyQt5... not yet

Latest versions of dupeGuru use PyQt5 which, on gentoo, is hard to install. So, for now, dupeGuru
packages are outdated. There's a WIP dupeguru-se-3.9.0 ebuild being worked on (you'll need the `qt`
overlay to make it work) but that's some very experimental stuff right there.

[overlay]: https://wiki.gentoo.org/wiki/Overlay
[hs]: http://www.hardcoded.net
[layman]: http://wiki.gentoo.org/wiki/Layman

