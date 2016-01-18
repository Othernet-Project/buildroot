################################################################################
#
# hwtest
#
################################################################################

HWTEST_VERSION = master
HWTEST_REPO_NAME=CHIP-hwtest
HWTEST_SITE = https://github.com/NextThingCo/$(HWTEST_REPO_NAME)
HWTEST_SITE_METHOD = git
HWTEST_DEPENDENCIES = lshw stress i2c-tools\

define HWTEST_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(HWTEST_DIR)/chip-hwtest/bin/battery.sh $(TARGET_DIR)/usr/bin/battery.sh
	$(INSTALL) -D -m 0755 $(HWTEST_DIR)/chip-hwtest/bin/bitflipcheck.sh $(TARGET_DIR)/usr/bin/bitflipcheck.sh
	$(INSTALL) -D -m 0755 $(HWTEST_DIR)/chip-hwtest/bin/endurance.sh $(TARGET_DIR)/usr/bin/endurance.sh
	$(INSTALL) -D -m 0755 $(HWTEST_DIR)/chip-hwtest/bin/flash_led.sh $(TARGET_DIR)/usr/bin/flash_led.sh
	$(INSTALL) -D -m 0755 $(HWTEST_DIR)/chip-hwtest/bin/hwtest $(TARGET_DIR)/usr/bin/hwtest
	$(INSTALL) -D -m 0755 $(HWTEST_DIR)/chip-hwtest/bin/nand_test.awk $(TARGET_DIR)/usr/bin/nand_test.awk
	$(INSTALL) -D -m 0755 $(HWTEST_DIR)/chip-hwtest/bin/nand_test.sh $(TARGET_DIR)/usr/bin/nand_test.sh
	$(INSTALL) -D -m 0755 $(HWTEST_DIR)/chip-hwtest/bin/power.sh $(TARGET_DIR)/usr/bin/power.sh
	$(INSTALL) -D -m 0755 $(HWTEST_DIR)/chip-hwtest/bin/test_flash_led.sh $(TARGET_DIR)/usr/bin/test_flash_led.sh

	$(INSTALL) -D -m 0644 $(HWTEST_DIR)/chip-hwtest/lib/hwtest/axp_ref.txt $(TARGET_DIR)/usr/lib/hwtest/axp_ref.txt
	$(INSTALL) -D -m 0644 $(HWTEST_DIR)/chip-hwtest/lib/hwtest/dd_ref0.txt $(TARGET_DIR)/usr/lib/hwtest/dd_ref0.txt
	$(INSTALL) -D -m 0644 $(HWTEST_DIR)/chip-hwtest/lib/hwtest/dd_ref1.txt $(TARGET_DIR)/usr/lib/hwtest/dd_ref1.txt
	$(INSTALL) -D -m 0644 $(HWTEST_DIR)/chip-hwtest/lib/hwtest/i2cdetect_ref0.txt $(TARGET_DIR)/usr/lib/hwtest/i2cdetect_ref0.txt
	$(INSTALL) -D -m 0644 $(HWTEST_DIR)/chip-hwtest/lib/hwtest/i2cdetect_ref1.txt $(TARGET_DIR)/usr/lib/hwtest/i2cdetect_ref1.txt
	$(INSTALL) -D -m 0644 $(HWTEST_DIR)/chip-hwtest/lib/hwtest/i2cdetect_ref2.txt $(TARGET_DIR)/usr/lib/hwtest/i2cdetect_ref2.txt
	$(INSTALL) -D -m 0644 $(HWTEST_DIR)/chip-hwtest/lib/hwtest/iw_ref.txt $(TARGET_DIR)/usr/lib/hwtest/iw_ref.txt
	$(INSTALL) -D -m 0644 $(HWTEST_DIR)/chip-hwtest/lib/hwtest/lshw_ref.txt $(TARGET_DIR)/usr/lib/hwtest/lshw_ref.txt
	$(INSTALL) -D -m 0644 $(HWTEST_DIR)/chip-hwtest/lib/hwtest/wifi_ref0.txt $(TARGET_DIR)/usr/lib/hwtest/wifi_ref0.txt
endef

$(eval $(generic-package))
