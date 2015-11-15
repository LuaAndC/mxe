# This file is part of MXE.
# See index.html for further information.

PKG             := ravi
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 0.11
$(PKG)_CHECKSUM := eb1164329c277268f006cb1b639887d77c2a8559e737c5206a91975fb0c86578
$(PKG)_SUBDIR   := ravi-$($(PKG)_VERSION)
$(PKG)_FILE     := $($(PKG)_SUBDIR).tar.gz
$(PKG)_URL      := https://github.com/dibyendumajumdar/$(PKG)/archive/$($(PKG)_VERSION).tar.gz
$(PKG)_DEPS     := gcc

define $(PKG)_UPDATE
    $(call MXE_GET_GITHUB_TAGS, dibyendumajumdar/ravi, v)
endef

define $(PKG)_BUILD
    $(TARGET)-cmake '$(1)' -B'$(1).build'
    $(MAKE) -C '$(1).build' -j '$(JOBS)'
    $(MAKE) -C '$(1).build' -j 1 install
endef
