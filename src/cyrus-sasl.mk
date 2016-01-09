# This file is part of MXE.
# See index.html for further information.

PKG             := cyrus-sasl
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 2.1.26
$(PKG)_CHECKSUM := 8fbc5136512b59bb793657f36fadda6359cae3b08f01fd16b3d406f1345b7bc3
$(PKG)_SUBDIR   := $(PKG)-$($(PKG)_VERSION)
$(PKG)_FILE     := $(PKG)-$($(PKG)_VERSION).tar.gz
$(PKG)_URL      := ftp://ftp.cyrusimap.org/$(PKG)/$($(PKG)_FILE)
$(PKG)_DEPS     := gcc openssl

define $(PKG)_UPDATE
    $(WGET) -q -O- 'http://cyrusimap.org/' | \
    $(SED) -n "s,.*cyrus-sasl-\\([0-9][^']*\\)\.tar\.gz.*,\\1,p" | \
    $(SORT) -V | \
    tail -1
endef

define $(PKG)_BUILD
    cp '$(PWD)/src/cyrus-sasl-md5global.h' \
        '$(1)/include/md5global.h'

    cd '$(1)' && \
        LIBS="`'$(TARGET)-pkg-config' --libs openssl`" \
        ./configure \
            $(MXE_CONFIGURE_OPTS) \
            --with-openssl='$(PREFIX)/$(TARGET)' \
            --enable-ntlm \
            --enable-login \
            RANLIB='$(TARGET)-ranlib'
    # -j1: errors with ln -s getnameinfo.lo getnameinfo.o
    $(MAKE) -C '$(1)' -j 1
    $(MAKE) -C '$(1)' -j 1 install
endef
