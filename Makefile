clean: 

all:
	git submodule update --init

RSYNC=rsync -a -f"- .git/" -f"+ *"

install: all
	mkdir -p $(PREFIX)
	$(RSYNC) crashstats $(PREFIX)
	$(RSYNC) wsgi $(PREFIX)
	$(RSYNC) media $(PREFIX)
	$(RSYNC) lib $(PREFIX)
	$(RSYNC) vendor-local $(PREFIX)
	$(RSYNC) vendor $(PREFIX)
	$(RSYNC) bin $(PREFIX)
