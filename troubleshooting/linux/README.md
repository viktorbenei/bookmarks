# Troubleshooting: Linux

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

## Booting from external HDD/SSD

In case you already have an external HDD/SDD with Linux (tested with Ubuntu) installed on it, and you can boot it
on another PC/Mac but you try to boot from it on a new Mac:

1. Create a Live linux USB and boot from that on the target Mac
1. Also connect the external SSD/HDD
1. Then once in the Live linux run:

```
sudo add-apt-repository ppa:yannubuntu/boot-repair && sudo apt-get update
sudo apt-get install -y boot-info && boot-info
```

Source:

- https://ubuntuforums.org/showthread.php?t=2378660
- https://help.ubuntu.com/community/Boot-Info



## Turn off / on built in WiFi card (e.g. when using a WiFi stick)

Source: https://askubuntu.com/questions/168032/how-to-disable-built-in-wifi-and-use-only-usb-wifi-card

Add the following line to `/etc/network/interfaces`:

`iface wlan0 inet manual`

NetworManager doesn't manage interfaces configured in the `interfaces` file. Replace `wlan0` with the interface you want to disable, if it's not the name of the built-in interface. Note: use `ifconfig` to find the name of the built in wifi interface.

Then restart network manager

`sudo service network-manager restart`
