🚀 Arch Linux Minimal Install Guide
===================================

This guide details a minimal installation of Arch Linux tailored for a small SSD (like 15GB), featuring the following key components:

*   **Filesystem:** Btrfs (Subvolumes)
    
*   **Desktop Environment:** COSMIC Desktop (Alpha 7+)
    
*   **Display Manager:** Ly
    
*   **Networking:** NetworkManager
    
*   **Exclusions:** No LUKS Encryption, No Zram, No Timeshift.
    

📝 Prerequisites
----------------

*   A bootable Arch Linux USB drive.
    
*   Target disk identified as /dev/sda (15GB SSD).
    
*   System is booted in **UEFI mode**.
    

Phase 1: Preparation & Partitioning
-----------------------------------

### Verify Boot & Internet

Bash

Plain textANTLR4BashCC#CSSCoffeeScriptCMakeDartDjangoDockerEJSErlangGitGoGraphQLGroovyHTMLJavaJavaScriptJSONJSXKotlinLaTeXLessLuaMakefileMarkdownMATLABMarkupObjective-CPerlPHPPowerShell.propertiesProtocol BuffersPythonRRubySass (Sass)Sass (Scss)SchemeSQLShellSwiftSVGTSXTypeScriptWebAssemblyYAMLXML`   # Verify 64-bit UEFI  cat /sys/firmware/efi/fw_platform_size  # Verify internet connection  ping -c 2 archlinux.org   `

### Partition the Disk (/dev/sda)

We will create two partitions: an EFI partition and a single Btrfs root partition.

PartitionSizeTypePurpose/dev/sda1300MEFI System (ef00)EFI Boot/dev/sda2RemainderLinux filesystem (8300)Btrfs RootBash

Plain textANTLR4BashCC#CSSCoffeeScriptCMakeDartDjangoDockerEJSErlangGitGoGraphQLGroovyHTMLJavaJavaScriptJSONJSXKotlinLaTeXLessLuaMakefileMarkdownMATLABMarkupObjective-CPerlPHPPowerShell.propertiesProtocol BuffersPythonRRubySass (Sass)Sass (Scss)SchemeSQLShellSwiftSVGTSXTypeScriptWebAssemblyYAMLXML`   gdisk /dev/sda  # 1. Create sda1 (300M, ef00)  # 2. Create sda2 (remaining, 8300)  w   `

### Format Partitions & Create Subvolumes

Bash

Plain textANTLR4BashCC#CSSCoffeeScriptCMakeDartDjangoDockerEJSErlangGitGoGraphQLGroovyHTMLJavaJavaScriptJSONJSXKotlinLaTeXLessLuaMakefileMarkdownMATLABMarkupObjective-CPerlPHPPowerShell.propertiesProtocol BuffersPythonRRubySass (Sass)Sass (Scss)SchemeSQLShellSwiftSVGTSXTypeScriptWebAssemblyYAMLXML`   # 1. Format EFI partition  mkfs.fat -F32 /dev/sda1  # 2. Format Btrfs partition  mkfs.btrfs /dev/sda2   `

### Mount Subvolumes

Bash

Plain textANTLR4BashCC#CSSCoffeeScriptCMakeDartDjangoDockerEJSErlangGitGoGraphQLGroovyHTMLJavaJavaScriptJSONJSXKotlinLaTeXLessLuaMakefileMarkdownMATLABMarkupObjective-CPerlPHPPowerShell.propertiesProtocol BuffersPythonRRubySass (Sass)Sass (Scss)SchemeSQLShellSwiftSVGTSXTypeScriptWebAssemblyYAMLXML`   # Mount main partition temporarily to create subvolumes  mount /dev/sda2 /mnt  btrfs subvolume create /mnt/@  btrfs subvolume create /mnt/@home  umount /mnt  # Create final mount point directories  mkdir -p /mnt /mnt/home /mnt/boot  # Mount root subvolume (@)  mount -o noatime,compress=zstd,subvol=@ /dev/sda2 /mnt  # Mount home subvolume (@home)  mount -o noatime,compress=zstd,subvol=@home /dev/sda2 /mnt/home  # Mount EFI partition  mount /dev/sda1 /mnt/boot   `

Phase 2: Base System Installation
---------------------------------

### Install Base Packages

We include btrfs-progs to ensure fsck helpers are available for the initramfs.

Bash

Plain textANTLR4BashCC#CSSCoffeeScriptCMakeDartDjangoDockerEJSErlangGitGoGraphQLGroovyHTMLJavaJavaScriptJSONJSXKotlinLaTeXLessLuaMakefileMarkdownMATLABMarkupObjective-CPerlPHPPowerShell.propertiesProtocol BuffersPythonRRubySass (Sass)Sass (Scss)SchemeSQLShellSwiftSVGTSXTypeScriptWebAssemblyYAMLXML`   pacstrap -K /mnt base linux linux-firmware base-devel btrfs-progs   `

### Configure Fstab & Chroot

Bash

Plain textANTLR4BashCC#CSSCoffeeScriptCMakeDartDjangoDockerEJSErlangGitGoGraphQLGroovyHTMLJavaJavaScriptJSONJSXKotlinLaTeXLessLuaMakefileMarkdownMATLABMarkupObjective-CPerlPHPPowerShell.propertiesProtocol BuffersPythonRRubySass (Sass)Sass (Scss)SchemeSQLShellSwiftSVGTSXTypeScriptWebAssemblyYAMLXML`   genfstab -U /mnt >> /mnt/etc/fstab  arch-chroot /mnt   `

Phase 3: System Configuration
-----------------------------

### Timezone, Localization, Hostname

Bash

Plain textANTLR4BashCC#CSSCoffeeScriptCMakeDartDjangoDockerEJSErlangGitGoGraphQLGroovyHTMLJavaJavaScriptJSONJSXKotlinLaTeXLessLuaMakefileMarkdownMATLABMarkupObjective-CPerlPHPPowerShell.propertiesProtocol BuffersPythonRRubySass (Sass)Sass (Scss)SchemeSQLShellSwiftSVGTSXTypeScriptWebAssemblyYAMLXML`   # Set timezone (change Asia/Kolkata to your location)  ln -sf /usr/share/zoneinfo/Asia/Kolkata /etc/localtime  hwclock --systohc  # Edit /etc/locale.gen to uncomment en_US.UTF-8, then generate locales  locale-gen  echo "LANG=en_US.UTF-8" > /etc/locale.conf  echo "KEYMAP=us" > /etc/vconsole.conf  # Set your hostname  echo "arch-cosmic" > /etc/hostname   `

### Users and Sudo

Bash

Plain textANTLR4BashCC#CSSCoffeeScriptCMakeDartDjangoDockerEJSErlangGitGoGraphQLGroovyHTMLJavaJavaScriptJSONJSXKotlinLaTeXLessLuaMakefileMarkdownMATLABMarkupObjective-CPerlPHPPowerShell.propertiesProtocol BuffersPythonRRubySass (Sass)Sass (Scss)SchemeSQLShellSwiftSVGTSXTypeScriptWebAssemblyYAMLXML`   passwd # Set root password  useradd -m -g users -G wheel rad # Create user 'rad' (change if desired)  passwd rad  pacman -S sudo  EDITOR=nvim visudo # Uncomment the line: %wheel ALL=(ALL) ALL   `

### Install Core Utilities & COSMIC

Choose either intel-ucode or amd-ucode based on your CPU.

Bash

Plain textANTLR4BashCC#CSSCoffeeScriptCMakeDartDjangoDockerEJSErlangGitGoGraphQLGroovyHTMLJavaJavaScriptJSONJSXKotlinLaTeXLessLuaMakefileMarkdownMATLABMarkupObjective-CPerlPHPPowerShell.propertiesProtocol BuffersPythonRRubySass (Sass)Sass (Scss)SchemeSQLShellSwiftSVGTSXTypeScriptWebAssemblyYAMLXML`   pacman -S --noconfirm \      grub efibootmgr \      networkmanager \      intel-ucode || pacman -S amd-ucode \      cosmic ly \      bluez bluez-utils \      pipewire pipewire-pulse   `

### Initial Ramdisk & Bootloader Setup

Bash

Plain textANTLR4BashCC#CSSCoffeeScriptCMakeDartDjangoDockerEJSErlangGitGoGraphQLGroovyHTMLJavaJavaScriptJSONJSXKotlinLaTeXLessLuaMakefileMarkdownMATLABMarkupObjective-CPerlPHPPowerShell.propertiesProtocol BuffersPythonRRubySass (Sass)Sass (Scss)SchemeSQLShellSwiftSVGTSXTypeScriptWebAssemblyYAMLXML`   # Edit mkinitcpio.conf to include the btrfs module  nvim /etc/mkinitcpio.conf  # Change: MODULES=()  to  MODULES=(btrfs)  # Regenerate initramfs image  mkinitcpio -P  # Install GRUB  grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB --recheck  # Generate GRUB configuration  grub-mkconfig -o /boot/grub/grub.cfg   `

### Enable Services

Bash

Plain textANTLR4BashCC#CSSCoffeeScriptCMakeDartDjangoDockerEJSErlangGitGoGraphQLGroovyHTMLJavaJavaScriptJSONJSXKotlinLaTeXLessLuaMakefileMarkdownMATLABMarkupObjective-CPerlPHPPowerShell.propertiesProtocol BuffersPythonRRubySass (Sass)Sass (Scss)SchemeSQLShellSwiftSVGTSXTypeScriptWebAssemblyYAMLXML`   systemctl enable NetworkManager  systemctl enable bluetooth  systemctl enable ly.service  systemctl enable fstrim.timer   `

Phase 4: Finalization
---------------------

Bash

Plain textANTLR4BashCC#CSSCoffeeScriptCMakeDartDjangoDockerEJSErlangGitGoGraphQLGroovyHTMLJavaJavaScriptJSONJSXKotlinLaTeXLessLuaMakefileMarkdownMATLABMarkupObjective-CPerlPHPPowerShell.propertiesProtocol BuffersPythonRRubySass (Sass)Sass (Scss)SchemeSQLShellSwiftSVGTSXTypeScriptWebAssemblyYAMLXML`   exit  umount -R /mnt  reboot   `

Remove the installation media and enjoy your new **Arch Linux** system with **COSMIC Desktop**!    generate readme.md file
