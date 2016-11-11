################################################################################
#
# tar to archive target filesystem
#
################################################################################

TAR_OPTS := $(call qstrip,$(BR2_TARGET_ROOTFS_TAR_OPTIONS))

define ROOTFS_TAR_CMD
    (cd $(TARGET_DIR) ; find . -print0) | sort -z | tar -c$(TAR_OPTS)f $@ --numeric-owner -C $(TARGET_DIR) --mtime="$(KBUILD_BUILD_TIMESTAMP)" --no-recursion --null -T -
endef

$(eval $(call ROOTFS_TARGET,tar))
