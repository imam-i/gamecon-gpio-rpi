obj-m := gamecon_gpio_rpi.o
KVERSION := `uname -r`

all:
	$(MAKE) -C /lib/modules/$(KVERSION)/build SUBDIRS=$(PWD) modules

install:
	install -m 0755 -d $(DESTDIR)/lib/modules/$(KVERSION)/kernel/gpio
	gzip -c ./gamecon_gpio_rpi.ko > $(DESTDIR)/lib/modules/$(KVERSION)/kernel/gpio/gamecon_gpio_rpi.ko.gz

clean:
	$(MAKE) -C /lib/modules/$(KVERSION)/build SUBDIRS=$(PWD) clean
