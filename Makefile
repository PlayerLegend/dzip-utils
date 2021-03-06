LD = $(CC)
PREFIX ?= /usr/local
DESTDIR ?= $(PREFIX)
CFLAGS += -std=c99
PATH := $(CURDIR)/bin/:$(CURDIR)/sbin/:$(PATH)
BUILD_ENV ?= release

export PATH

all: utils

.PHONY: test bin install

include env/$(BUILD_ENV).makefile

SUB_MAKEFILES != find src -type f -name '*.makefile'
include $(SUB_MAKEFILES)

#debug tests test: CFLAGS += -ggdb -Wall -Werror
#utils benchmarks: CFLAGS += -DNDEBUG -O2
#benchmarks: CFLAGS += -O2

#utils debug: $(UTILS_C) $(UTILS_SH)
#debug: $(TESTS_C) $(TESTS_SH)
#benchmarks: $(BENCHMARKS_C)

#$(UTILS_C) $(TESTS_C): LDLIBS += $(CFLAGS)

$(C_PROGRAMS):
	@mkdir -p $(@D)
	$(LD) -o $@ $^ $> $(LDLIBS)

$(SH_PROGRAMS):
	@mkdir -p $(@D)
	cp $< $@
	chmod +x $@

submodules-init:
	git submodule init

utils:
tests:
run-tests:
	make depend
	make clean
	make BUILD_ENV=debug tests utils
	sh run-tests.sh $(RUN_TESTS)
	make clean

clean-fast:
	rm -rf test bin sbin init `find src -name '*.o'`

clean: clean-fast
	rm -rf external boot

depend: clean
	makedepend -Y `find src -name '*.c*' -or -name '*.h*'`

install:
	cp -v bin/* $(DESTDIR)/bin/
#	printf '%s\n' $(UTILS_C) $(UTILS_SH) | cpio -pudm $(DESTDIR)/

install-user:
	make install DESTDIR=$(HOME)/.local

# DO NOT DELETE

src/range/range_atozd.o: src/range/def.h src/range/string.h
src/range/streq.o: src/range/def.h src/range/string.h
src/range/string_init.o: src/range/string.h src/range/def.h
src/range/string.o: src/range/def.h
src/range/strchr.o: src/range/def.h src/range/string.h
src/range/strstr.o: src/range/def.h src/range/string.h
src/range/test/range.test.o: src/range/string.h src/range/def.h
src/range/test/range.test.o: src/range/string.h
src/range/path.o: src/range/def.h
src/range/range_strdup.o: src/range/string.h src/range/def.h
src/range/range_streq_string.o: src/range/string.h src/range/def.h
src/range/range_strstr_string.o: src/range/string.h src/range/def.h
src/range/range_strdup_to_string.o: src/range/string.h src/range/def.h
src/range/path.o: src/range/def.h src/range/path.h
src/range/string_tokenize.o: src/range/def.h src/range/string.h
src/window/string.o: src/range/string.h src/range/def.h src/range/def.h
src/window/string.o: src/window/alloc.h
src/window/path.o: src/range/def.h src/range/string.h src/range/def.h
src/window/path.o: src/range/path.h src/range/string.h src/window/alloc.h
src/window/path.o: src/log/log.h
src/window/alloc.o: src/range/string.h src/range/def.h src/range/def.h
src/window/alloc.o: src/window/alloc.h src/log/log.h
src/window/test/window.test.o: src/range/def.h src/range/string.h
src/window/test/window.test.o: src/range/def.h src/window/alloc.h
src/window/test/window.test.o: src/range/string.h src/window/path.h
src/window/test/window.test.o: src/log/log.h
src/window/test/printf.test.o: src/range/string.h src/range/def.h
src/window/test/printf.test.o: src/range/def.h src/window/printf.h
src/window/printf.o: src/range/def.h src/range/def.h src/window/printf.h
src/window/printf.o: src/window/alloc.h src/window/vprintf.h
src/window/vprintf.o: src/range/def.h src/range/def.h src/window/vprintf.h
src/window/vprintf.o: src/window/alloc.h
src/window/def.o: src/range/def.h
src/window/path.o: src/range/def.h src/range/def.h
src/window/alloc.o: src/range/def.h src/window/def.h
src/window/string.o: src/range/def.h src/range/def.h
src/window/vprintf_append.o: src/range/def.h src/range/def.h
src/window/vprintf_append.o: src/window/vprintf.h src/window/alloc.h
src/window/printf_append.o: src/range/def.h src/range/def.h
src/window/printf_append.o: src/window/printf.h src/window/alloc.h
src/window/printf_append.o: src/window/vprintf.h
src/window/printf.o: src/range/def.h src/range/def.h
src/window/vprintf.o: src/range/def.h src/range/def.h
src/convert/join.o: src/range/def.h src/window/def.h src/window/alloc.h
src/convert/join.o: src/convert/sink.h src/convert/source.h
src/convert/join.o: src/convert/join.h
src/convert/fd/sink.o: src/range/def.h src/window/def.h src/window/alloc.h
src/convert/fd/sink.o: src/convert/source.h src/convert/sink.h
src/convert/fd/sink.o: src/convert/sink.h src/log/log.h
src/convert/fd/source.o: src/range/def.h src/window/def.h
src/convert/fd/source.o: src/convert/source.h src/convert/sink.h
src/convert/fd/source.o: src/range/def.h src/window/def.h src/window/alloc.h
src/convert/fd/source.o: src/convert/source.h src/convert/sink.h
src/convert/fd/source.o: src/convert/source.h src/convert/sink.h
src/convert/fd/source.o: src/log/log.h
src/convert/fd/sink.o: src/range/def.h src/window/def.h src/convert/source.h
src/convert/fd/sink.o: src/convert/sink.h
src/convert/getline.o: src/range/string.h src/range/def.h src/range/string.h
src/convert/getline.o: src/window/def.h src/window/alloc.h
src/convert/getline.o: src/convert/source.h src/convert/getline.h
src/convert/getline.o: src/log/log.h
src/convert/test/cat.test.o: src/range/def.h src/window/def.h
src/convert/test/cat.test.o: src/window/alloc.h src/convert/source.h
src/convert/test/cat.test.o: src/convert/fd/source.h src/convert/sink.h
src/convert/test/cat.test.o: src/convert/fd/sink.h src/log/log.h
src/convert/test/getline.test.o: src/range/def.h src/window/def.h
src/convert/test/getline.test.o: src/window/alloc.h src/convert/source.h
src/convert/test/getline.test.o: src/convert/fd/source.h src/convert/sink.h
src/convert/test/getline.test.o: src/convert/fd/sink.h src/convert/getline.h
src/convert/test/getline.test.o: src/log/log.h
src/convert/test/cat-load-all.test.o: src/range/def.h src/window/def.h
src/convert/test/cat-load-all.test.o: src/window/alloc.h src/convert/source.h
src/convert/test/cat-load-all.test.o: src/convert/fd/source.h
src/convert/test/cat-load-all.test.o: src/convert/sink.h
src/convert/test/cat-load-all.test.o: src/convert/fd/sink.h src/log/log.h
src/convert/source.o: src/range/def.h src/window/def.h src/window/alloc.h
src/convert/source.o: src/convert/source.h src/log/log.h
src/convert/sink.o: src/range/def.h src/window/def.h
src/convert/getline.o: src/range/def.h src/window/def.h src/convert/source.h
src/convert/join.o: src/range/def.h src/window/def.h src/convert/sink.h
src/convert/join.o: src/convert/source.h
src/convert/source.o: src/range/def.h src/window/def.h
src/convert/sink.o: src/range/def.h src/window/def.h src/window/alloc.h
src/convert/sink.o: src/convert/sink.h src/log/log.h
src/dzip/dzip.util.o: src/range/def.h src/window/def.h src/window/alloc.h
src/dzip/dzip.util.o: src/convert/source.h src/convert/fd/source.h
src/dzip/dzip.util.o: src/convert/sink.h src/convert/fd/sink.h
src/dzip/dzip.util.o: src/convert/join.h src/dzip/deflate.h
src/dzip/dzip.util.o: src/dzip/inflate.h src/convert/source.h
src/dzip/dzip.util.o: src/convert/sink.h src/log/log.h
src/dzip/source.o: src/range/def.h src/window/def.h src/convert/source.h
src/dzip/source.o: src/convert/source.h src/dzip/inflate.h src/log/log.h
src/dzip/inflate.o: src/range/def.h src/window/def.h src/convert/source.h
src/dzip/deflate.o: src/range/def.h src/window/def.h
src/dzip/test/dzip-benchmark.test.o: src/range/string.h src/range/def.h
src/dzip/test/dzip-benchmark.test.o: src/window/def.h src/window/alloc.h
src/dzip/test/dzip-benchmark.test.o: src/convert/source.h src/convert/sink.h
src/dzip/test/dzip-benchmark.test.o: src/convert/fd/source.h
src/dzip/test/dzip-benchmark.test.o: src/convert/fd/sink.h src/dzip/deflate.h
src/dzip/test/dzip-benchmark.test.o: src/log/log.h
src/dzip/sink.o: src/range/def.h src/window/def.h src/convert/sink.h
src/dzip/source.o: src/range/def.h src/window/def.h src/convert/source.h
src/dzip/sink.o: src/range/def.h src/window/def.h src/window/alloc.h
src/dzip/sink.o: src/convert/sink.h src/convert/sink.h src/dzip/deflate.h
src/dzip/sink.o: src/log/log.h
src/dzip/inflate.o: src/range/def.h src/window/def.h src/convert/source.h
src/dzip/inflate.o: src/window/alloc.h src/dzip/inflate.h src/dzip/common.h
src/dzip/inflate.o: src/log/log.h src/vluint/vluint.h src/vluint/source.h
src/dzip/deflate.o: src/range/def.h src/window/def.h src/window/alloc.h
src/dzip/deflate.o: src/window/printf.h src/vluint/vluint.h
src/dzip/deflate.o: src/dzip/deflate.h src/dzip/common.h src/log/log.h
src/vluint/source.o: src/range/def.h src/window/def.h src/vluint/vluint.h
src/vluint/source.o: src/convert/source.h
src/vluint/vluint.o: src/range/def.h src/window/def.h src/window/alloc.h
src/vluint/vluint.o: src/vluint/vluint.h src/log/log.h
src/vluint/test/source/output.o: src/range/def.h src/window/def.h
src/vluint/test/source/output.o: src/convert/sink.h src/convert/fd/sink.h
src/vluint/test/source/output.o: src/log/log.h src/vluint/vluint.h
src/vluint/test/source/source.o: src/range/def.h src/window/def.h
src/vluint/test/source/source.o: src/convert/source.h src/convert/fd/source.h
src/vluint/test/source/source.o: src/vluint/source.h
src/vluint/test/base/test.o: src/range/string.h src/range/def.h
src/vluint/test/base/test.o: src/window/def.h src/window/printf.h
src/vluint/test/base/test.o: src/vluint/vluint.h src/log/log.h
src/vluint/vluint.o: src/range/def.h src/window/def.h
src/vluint/source.o: src/range/def.h src/window/def.h src/vluint/vluint.h
src/vluint/source.o: src/convert/source.h src/convert/source.h
src/log/test/log.test.o: src/log/log.h
src/log/log.o: src/log/log.h
