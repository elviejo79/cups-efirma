CUPS_PPD_DIR?=/usr/share/cups/model
CUPS_BACKEND_DIR?=/usr/lib/cups/backend
PS2PDF?=/usr/bin/epstopdf
MAILX?=/usr/bin/mailx
TMPDIR?=/tmp
JO?=/usr/bin/jo
MITIMBRADO=/usr/bin/mitimbrado.py
Q?=@

install:
	$(Q)echo "Installing to $(DESTDIR)/"
	$(Q)install -D -m644 efirma.ppd $(DESTDIR)/$(CUPS_PPD_DIR)/efirma.ppd
	$(Q)install -D -m755 efirma $(DESTDIR)/$(CUPS_BACKEND_DIR)/efirma
	$(Q)sed -i "s,/usr/bin/epstopdf,$(PS2PDF),g" $(DESTDIR)/$(CUPS_PPD_DIR)/efirma.ppd
	$(Q)sed -i "s,/usr/bin/mailx,$(MAILX),g" $(DESTDIR)/$(CUPS_PPD_DIR)/efirma.ppd
	$(Q)sed -i "s,/tmp,$(TMPDIR),g" $(DESTDIR)/$(CUPS_PPD_DIR)/efirma.ppd

check:
	$(Q)test -x $(PS2PDF)||echo "epstopdf in $(PS2PDF) is not executable"
	$(Q)test -x $(MAILX)||echo "mailx in $(MAILX) is not executable"
	$(Q)test -x $(JO)||echo "JO in $(JO) is not executable"
	$(Q)test -x $(MITIMBRADO)||echo "mitimbrado.py in $(MITIMBRADO) is not executable"
inst_check: check
	$(Q)lpinfo -m | grep -q efirma.ppd || echo "efirma.ppd not available in lpinfo listing"
