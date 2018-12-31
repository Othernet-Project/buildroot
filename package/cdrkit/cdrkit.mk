################################################################################
#
# cdrkit
#
################################################################################

CDRKIT_VERSION = v1.1
CDRKIT_SITE = https://github.com/Othernet-Project/cdrkit
CDRKIT_SITE_METHOD = git
CDRKIT_DEPENDENCIES = libcap bzip2 zlib
CDRKIT_LICENSE = GPLv2
CDRKIT_LICENSE_FILES = COPYING

ifeq ($(BR2_ENDIAN),"BIG")
CDRKIT_CONF_OPTS += -DBITFIELDS_HTOL=1
else
CDRKIT_CONF_OPTS += -DBITFIELDS_HTOL=0
endif

$(eval $(cmake-package))
$(eval $(host-cmake-package))
