# This file is part of MXE.
# See index.html for further information.

PKG             := mosh
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 1.2.5
$(PKG)_CHECKSUM := 1af809e5d747c333a852fbf7acdbf4d354dc4bbc2839e3afe5cf798190074be3
$(PKG)_SUBDIR   := $(PKG)-$($(PKG)_VERSION)
$(PKG)_FILE     := $(PKG)-$($(PKG)_VERSION).tar.gz
$(PKG)_URL      := https://mosh.mit.edu/$($(PKG)_FILE)
$(PKG)_DEPS     := gcc ncurses zlib openssl protobuf plibc # TODO reorder

define $(PKG)_UPDATE
    $(WGET) -q -O- 'https://mosh.mit.edu/' | \
    $(SED) -n 's,.*mosh-\([0-9][^>]*\)\.tar.*,\1,p' | \
    head -1
endef

define $(PKG)_BUILD
    cd '$(1)' && \
        PROTOC='$(PREFIX)/bin/$(TARGET)-protoc' \
        ./configure \
        $(MXE_CONFIGURE_OPTS) \
        CXXFLAGS='-DHAVE_LANGINFO_H -D_POSIX'
    $(MAKE) -C '$(1)' -j '$(JOBS)'
    $(MAKE) -C '$(1)' -j 1 install
endef
