################################################################################
#
# Build a kernel with an integrated initial ramdisk
# filesystem based on cpio.
#
################################################################################

ifeq ($(BR2_INITRAMFS_USE_ROOTFS),y)
ROOTFS_INITRAMFS_DEPENDENCIES += rootfs-cpio
endif

ROOTFS_INITRAMFS_POST_TARGETS += linux-rebuild-with-initramfs


# The generic fs infrastructure isn't very useful here.

rootfs-initramfs: $(ROOTFS_INITRAMFS_DEPENDENCIES) $(ROOTFS_INITRAMFS_POST_TARGETS)

rootfs-initramfs-show-depends:
	@echo $(ROOTFS_INITRAMFS_DEPENDENCIES)

.PHONY: rootfs-initramfs rootfs-initramfs-show-depends


ifeq ($(BR2_INITRAMFS_USE_OTHER),y)
ifndef $(BR_ROOTFS_CPIO)

# Define a dummy target for rootfs.cpio so that 
# linux-rebuild-with-iniramfs dependency is 
# satisfied. A test is also preformed so that the
# build does not yield unintended results.
$(BINARIES_DIR)/$(BR2_CPIO_COMPRESSED_FILE): target-finalize
	@$(call MESSAGE,"Using existing rootfs.cpio")
	@test -f $@ || echo "ERROR: '$(BINARIES_DIR)/rootfs.cpio' was not found"

endif
endif


ifeq ($(BR2_TARGET_ROOTFS_INITRAMFS),y)
TARGETS_ROOTFS += rootfs-initramfs
endif
