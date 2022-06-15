# HPE_STK
HPE STK running on USB    
Based on HPE Scripting Toolkit 11.60    

## Shell Setting
### grub.cfg, syslinux.cfg, isolinux.cfg
Delete the syntax associated with network(and ipv4 options)   
* Syslinux.cfg, isolinux.cfg - change `media=cdrom` to `media=usb`    
