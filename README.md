# Portage overlay for HS apps

This is a [Portage overlay][overlay] to install apps from [Hardcoded Software][hs].

Also, it provides a couple of apps I use myself.

## Install

1. Make sure you have [layman][layman] installed.
2. Run `sudo layman -f -o https://raw.githubusercontent.com/hsoft/portage-overlay/master/repositories.xml -a hsoft`.
3. You can now emerge packages from the overlay. Example: `sudo emerge dupeguru`.

## Packages provided

* `moneyguru`
* `dupeguru`
* `hsaudiotag3k` (needed for `dupeguru`)
* [zbackup](http://zbackup.org/)
* [lxdock](https://github.com/lxdock/lxdock)
* [vimb](https://github.com/fanglingsu/vimb)
* [sassc](https://github.com/sass/sassc)

[overlay]: https://wiki.gentoo.org/wiki/Overlay
[hs]: http://www.hardcoded.net
[layman]: http://wiki.gentoo.org/wiki/Layman

