################################################################################
#
# cloop
#
################################################################################

CLOOP_VERSION = 5.2
CLOOP_SITE = https://github.com/Othernet-Project/cloop
CLOOP_SITE_METHOD = git
CLOOP_LICENSE = GPLv2 (module), GPLv2+ (advancecomp)
CLOOP_LICENSE_FILES = README advancecomp-1.15/COPYING

CLOOP_DEPENDENCIES = zlib

define CLOOP_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) CFG_OPTS=$(TARGET_CONFIGURE_OPTS) -C $(@D) APPSONLY=yes
endef

define CLOOP_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 -d $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 755 $(@D)/create_compressed_fs $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 755 $(@D)/extract_compressed_fs $(TARGET_DIR)/usr/bin
endef

HOST_CLOOP_DEPENDENCIES = host-zlib

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
