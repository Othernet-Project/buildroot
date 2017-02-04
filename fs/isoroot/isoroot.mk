################################################################################
#
# Build the iso9660 rockridge root filesystem image
#
################################################################################

ROOTFS_ISOROOT_DEPENDENCIES = host-cdrkit

ifeq ($(BR2_PACKAGE_SD_IMAGE),y)
define ROOTFS_ISOROOT_CMD
    $(SD_IMAGE_SITE)/mkimagesdir.sh ; \
	$(HOST_DIR)/usr/bin/genisoimage -quiet -R -iso-level 4 $(TARGET_DIR) $(BINARIES_DIR)/images > $@
endef
endif

ifeq ($(BR2_PACKAGE_UBI_IMAGE),y)
define ROOTFS_ISOROOT_CMD
    $(UBI_IMAGE_SITE)/mkimagesdir.sh ; \
	$(HOST_DIR)/usr/bin/genisoimage -quiet -R -iso-level 4 $(TARGET_DIR) $(BINARIES_DIR)/images > $@
endef
endif

$(eval $(call ROOTFS_TARGET,isoroot))
