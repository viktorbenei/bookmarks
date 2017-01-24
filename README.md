# Bookmarks

## Linux (Ubuntu 16.04, Kubuntu, Debian stretch)

* Install Broadcom Wifi (proprietary) driver, Mac Mini: http://askubuntu.com/a/626653/331909

> You need to install wireless driver.
> Insert your Ubuntu installation disk or a flash drive and copy these files from the installation disk to your Home directory:

> ```
> pool/main/d/dkms/dkms_XXXXX.deb
> pool/restricted/b/bcmwl/bcmwl-kernel-source_XXXXX.deb
> ```
>
> Then run the following in terminal:
>
> `sudo dpkg -i *.deb`

* Invert the `fn` key mode (default on/off): https://help.ubuntu.com/community/MacBook3-1/Maverick
* Cisco IPSEC VPN: http://askubuntu.com/a/488446/331909
    * In __Ubuntu__ `16.04` / __Debian__ `stretch` : the VPN can work from the UI if all of the following are installed:
        * `sudo apt-get install vpnc network-manager-vpnc network-manager-vpnc-gnome`
    * In __Kubuntu__ 16.04 the VPN works from the UI too, given that `vpnc` and `network-manager-vpnc` (as mentioned here https://help.ubuntu.com/community/VPNClient) are installed; in "Connection editor" there's a "Cisco Compatible VPN (vpnc)" option
    * Note for Kubuntu GUI: leave the "User password" empty, will be asked for when you click "Connect"

## Git

- nice looking git log graph in Terminal/Command Line: `git log --graph --decorate --all`
    - for more ideas see: http://stackoverflow.com/questions/1057564/pretty-git-branch-graphs
