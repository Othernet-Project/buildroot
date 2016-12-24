################################################################################
#
# Build the iso9660 rockridge root filesystem image
#
################################################################################

ROOTFS_ISOROOT_DEPENDENCIES = host-cdrkit

define ROOTFS_ISOROOT_CMD
	$(HOST_DIR)/usr/bin/genisoimage -r $(TARGET_DIR) > $@
endef

$(eval $(call ROOTFS_TARGET,isoroot))
