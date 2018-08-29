################################################################################
#
# socat
#
################################################################################

SOCAT_VERSION = 1.7.3.2
SOCAT_SOURCE = socat-$(SOCAT_VERSION).tar.bz2
SOCAT_SITE = http://www.dest-unreach.org/socat/download
SOCAT_LICENSE = GPLv2
SOCAT_LICENSE_FILES = COPYING
SOCAT_CONF_ENV = \
	sc_cv_termios_ispeed=no \
	sc_cv_sys_crdly_shift=9 \
	sc_cv_sys_tabdly_shift=11 \
	sc_cv_sys_csize_shift=4 \
	sc_cv_type_sizet_basic=4 \
	sc_cv_type_modet_basic=4 \
	sc_cv_type_pidt_basic=3 \
	sc_cv_type_uidt_basic=4 \
	sc_cv_type_gidt_basic=4 \
	sc_cv_type_timet_basic=5 \
	sc_cv_type_socklent_basic=4 \
	sc_cv_type_off_basic=5 \
	sc_cv_type_off64_basic=7 \
	sc_cv_type_dev_basic=8 \
	sc_cv_type_stat_stino_basic=6 \
	sc_cv_type_stat_stnlink_basic=4 \
	sc_cv_type_stat_stsize_basic=5 \
	sc_cv_type_stat_stblksize_basic=5 \
	sc_cv_type_stat_stblocks_basic=5 \
	sc_cv_type_stat64_stdev_basic=8 \
	sc_cv_type_stat64_stino_basic=8 \
	sc_cv_type_stat64_stnlink_basic=4 \
	sc_cv_type_stat64_stsize_basic=7 \
	sc_cv_type_stat64_stblksize_basic=5 \
	sc_cv_type_stat64_stblocks_basic=7 \
	sc_cv_type_struct_timeval_tv_usec=5 \
	sc_cv_type_rlimit_rlimmax_basic=6 \
	sc_cv_typeof_struct_cmsghdr_cmsg_len=4


# We need to run autoconf to regenerate the configure script, in order
# to ensure that the test checking linux/ext2_fs.h works
# properly. However, the package only uses autoconf and not automake,
# so we can't use the normal autoreconf logic.

SOCAT_DEPENDENCIES = host-autoconf

ifeq ($(BR2_PACKAGE_OPENSSL),y)
SOCAT_DEPENDENCIES += openssl
else
SOCAT_CONF_OPTS += --disable-openssl
endif

ifeq ($(BR2_PACKAGE_READLINE),y)
SOCAT_DEPENDENCIES += readline
else
SOCAT_CONF_OPTS += --disable-readline
endif

define SOCAT_RUN_AUTOCONF
	(cd $(@D); $(HOST_DIR)/usr/bin/autoconf)
endef

SOCAT_PRE_CONFIGURE_HOOKS += SOCAT_RUN_AUTOCONF

$(eval $(autotools-package))
