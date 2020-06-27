TARGET=hello

-include ./include/config/auto.conf

LDFLAGS = -I ./include/generated/

obj-y := hello.c
obj-$(CONFIG_MYPRINT) += myprint.c

all:$(TARGET)

$(TARGET):$(obj-y) FORCE
	gcc $(LDFLAGS) -o $@ $(obj-y)
	echo $@
	echo $^

defconfig:
	./scripts/conf Kconfig
	./scripts/conf --silentoldconfig Kconfig

menuconfig:
	./scripts/mconf Kconfig
	./scripts/conf --silentoldconfig Kconfig

clean:
	rm $(TARGET)

PHONY += FORCE
FORCE:

.PHONY : $(PHONY)
