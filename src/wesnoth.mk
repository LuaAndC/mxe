# This file is part of MXE.
# See index.html for further information.

PKG             := wesnoth
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 1.12.4
$(PKG)_CHECKSUM := bf525060da4201f1e62f861ed021f13175766e074a8a490b995052453df51ea7
$(PKG)_SUBDIR   := $(PKG)-$($(PKG)_VERSION)
$(PKG)_FILE     := $($(PKG)_SUBDIR).tar.bz2
$(PKG)_URL      := http://$(SOURCEFORGE_MIRROR)/project/wesnoth/wesnoth-$(call SHORT_PKG_VERSION,$(PKG))/wesnoth-$($(PKG)_VERSION)/$($(PKG)_FILE)
$(PKG)_DEPS     := gcc boost sdl sdl_image sdl_mixer sdl_ttf sdl_net fontconfig pango vorbis bzip2 zlib libpng dbus readline fribidi

define $(PKG)_UPDATE
    $(WGET) -q -O- 'http://www.wesnoth.org/' | \
    $(SED) -n 's,.*wesnoth-\([0-9][^>]*\)\.tar.*,\1,p' | \
    head -1
endef

define $(PKG)_BUILD
    '$(TARGET)-cmake' \
        -DENABLE_GAME=ON \
        -DENABLE_SERVER=ON \
        '-DSDL_CONFIG=$(TARGET)-sdl-config' \
        $(1) -B'$(1).build'
    '$(MAKE)' -C '$(1).build' VERBOSE=1 -j '$(JOBS)'
    '$(MAKE)' -C '$(1).build' VERBOSE=1 -j 1 install
endef

# because there is no sdl_image shared
$(PKG)_BUILD_SHARED =
