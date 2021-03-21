# MIsc

## slim

Fix `Failed to Execute login command`:

Comment out `sessiondir` in `/etc/slim.conf`.

Thanks [random forum](https://bbs.archlinux.org/viewtopic.php?id=195138).


# keymap in cli

    dpkg-reconfigure keyboard-configuration
    service keyboard-setup restart 

Manuall:

    vi /etc/default/keyboard
    XKBOPTIONS="caps:escape"

Update initird

    vi /etc/initramfs-tools/initramfs.conf 
    update-initramfs -u
