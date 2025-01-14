resource "proxmox_vm_qemu" "ubuntu-tf-k8s-master-cks" {
  count = 1
  name  = "k8s-master-cks-playground"
  desc  = "k8s master node"

  target_node = "my-prox-nuc-03"
  clone       = "ubuntu-22.04.1-live-server-amd64-k8s-deploy-v2"

  os_type = "ubuntu"

  # Default to bios is seabios
  bios = "seabios"

  cores   = 4
  sockets = 1
  cpu     = "host"
  memory  = 4096

  scsihw   = "virtio-scsi-pci"
  bootdisk = "scsi0"

  # Disk settings
  disks {
    scsi {
      scsi0 {
        disk {
          size    = "20"
          storage = "local-lvm"
        }
      }
    }
  }

  # Network settings
  network {
    model  = "virtio"
    bridge = "vmbr0"
  }
  ipconfig0  = "ip=192.168.0.120/24,gw=192.168.0.1"
  nameserver = "192.168.0.168"

  # Specify the cloud-init cdrom storage
  cloudinit_cdrom_storage = "local-lvm"

}

resource "proxmox_vm_qemu" "ubuntu-single-tf-worker-cks" {
  count = 1
  name  = "k8s-worker-${count.index}-cks-playground"
  desc  = "k8s worker node"

  target_node = "my-prox-nuc-03"
  clone       = "ubuntu-22.04.1-live-server-amd64-k8s-deploy-v2"

  os_type = "ubuntu"

  # Default to bios is seabios
  bios = "seabios"

  cores   = 4
  sockets = 1
  cpu     = "host"
  memory  = 4096

  scsihw   = "virtio-scsi-pci"
  bootdisk = "scsi0"

  # Disk settings
  disks {
    scsi {
      scsi0 {
        disk {
          size    = "20"
          storage = "local-lvm"
        }
      }
    }
  }

  # Network settings
  network {
    model  = "virtio"
    bridge = "vmbr0"
  }
  ipconfig0  = "ip=192.168.0.${121 + count.index}/24,gw=192.168.0.1"
  nameserver = "192.168.0.168"

  # Specify the cloud-init cdrom storage
  cloudinit_cdrom_storage = "local-lvm"
}
