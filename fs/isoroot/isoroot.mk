################################################################################
#
# Build the iso9660 rockridge root filesystem image
#
################################################################################

ROOTFS_ISOROOT_DEPENDENCIES = host-cdrkit

define ROOTFS_ISOROOT_CMD
	$(HOST_DIR)/usr/bin/genisoimage -R -iso-level 4 $(TARGET_DIR) > $@
endef

$(eval $(call ROOTFS_TARGET,isoroot))
