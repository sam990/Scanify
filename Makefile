include $(THEOS)/makefiles/common.mk

TWEAK_NAME = Scanify
Scanify_FILES = Tweak.xm
Scanify_FRAMEWORKS = UIKit Foundation
Scanify_PRIVATE_FRAMEWORKS = WiFiKit WiFiKitUI

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
