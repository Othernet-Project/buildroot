################################################################################
#
# Build the iso9660 rockridge root filesystem image
#
################################################################################

ROOTFS_ISOROOT_DEPENDENCIES = host-cdrkit

define ROOTFS_ISOROOT_CMD
    $(UBI_IMAGE_SITE)/mkimagesdir.sh ; \
	$(HOST_DIR)/usr/bin/genisoimage -quiet -R -iso-level 4 $(TARGET_DIR) $(BINARIES_DIR)/images > $@
endef

$(eval $(call ROOTFS_TARGET,isoroot))
