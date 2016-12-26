################################################################################
#
# cloop
#
################################################################################

CLOOP_VERSION = 4.3-2-br
CLOOP_SITE = https://github.com/Outernet-Project/cloop
CLOOP_SITE_METHOD = git
CLOOP_LICENSE = GPLv2 (module), GPLv2+ (advancecomp)
CLOOP_LICENSE_FILES = README advancecomp-1.15/COPYING

HOST_CLOOP_DEPENDENCIES = host-zlib
CLOOP_DEPENDENCIES = zlib linux

define CLOOP_BUILD_CMDS
    $(MAKE) -C $(@D) $(LINUX_MAKE_FLAGS) KERNEL_DIR=$(LINUX_DIR)
endef

define CLOOP_INSTALL_TARGET_CMDS
    $(INSTALL) -p -m 644 $(@D)/cloop.ko $(TARGET_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/extra/
    depmod -b $(TARGET_DIR) $(LINUX_VERSION_PROBED)
	$(INSTALL) -m 0755 -d $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 755 $(@D)/create_compressed_fs $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 755 $(@D)/extract_compressed_fs $(TARGET_DIR)/usr/bin
endef

define HOST_CLOOP_BUILD_CMDS
	$(HOST_CONFIGURE_OPTS) $(MAKE1) -C $(@D) APPSONLY=yes
endef

define HOST_CLOOP_INSTALL_CMDS
	$(INSTALL) -m 0755 -d $(HOST_DIR)/usr/bin
	$(INSTALL) -m 755 $(@D)/create_compressed_fs $(HOST_DIR)/usr/bin
	$(INSTALL) -m 755 $(@D)/extract_compressed_fs $(HOST_DIR)/usr/bin
endef

$(eval $(generic-package))
$(eval $(host-generic-package))
