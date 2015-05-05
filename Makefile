
prefix=/usr/local

all:
	@echo "usage: make install"
	@echo "       make uninstall"

install:
	@mkdir -p $(prefix)/bin/
	@echo '#!/bin/bash' > $(prefix)/bin/wtool
	@echo '##$(shell pwd)' >> $(prefix)/bin/wtool
	@echo 'exec "$(shell pwd)/wtool" "$$@"' >> $(prefix)/bin/wtool
	@chmod 755 $(prefix)/bin/wtool
	@chmod 755 wtool
	@echo 'install finished! type "wtool" to show usages.'
uninstall:
	rm -f $(prefix)/bin/wtool
