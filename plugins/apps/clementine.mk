# This file is part of MXE.
# See index.html for further information.

PKG             := clementine
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 1.3
$(PKG)_CHECKSUM := 55e8d283ed02e3f2376a88b012cd2003e00fef95a98b6a919d67cb57e96b8617
$(PKG)_SUBDIR   := Clementine-$($(PKG)_VERSION)
$(PKG)_FILE     := $(PKG)-$($(PKG)_VERSION).tar.gz
$(PKG)_URL      := https://github.com/$(PKG)-player/$(PKG)/archive/$($(PKG)_VERSION).tar.gz
$(PKG)_DEPS     := gcc boost chromaprint cryptopp dlfcn-win32 fftw glew gst-plugins-bad \
                   gst-plugins-good gst-plugins-ugly libarchive libechonest libid3tag \
                   libmpcdec libplist libusb1 protobuf qtsparkle_qt4 sparsehash

define $(PKG)_UPDATE
    $(call MXE_GET_GITHUB_TAGS, clementine-player/clementine)
endef

define $(PKG)_BUILD
    mkdir '$(1).build'
    cd '$(1).build' && '$(TARGET)-cmake' '$(1)' \
        -DCMAKE_INSTALL_PREFIX=$(PREFIX)/$(TARGET)/apps/$(PKG)
    $(MAKE) -C '$(1).build' -j '$(JOBS)'
    $(MAKE) -C '$(1).build' -j 1 install

    $(if $(BUILD_SHARED),
        $(INSTALL) -d '$(PREFIX)/$(TARGET)/apps/$(PKG)/bin/gstreamer-plugins';
        $(INSTALL) '$(PREFIX)/$(TARGET)/bin/libgstapetag.dll'            '$(PREFIX)/$(TARGET)/apps/$(PKG)/bin/gstreamer-plugins';
        $(INSTALL) '$(PREFIX)/$(TARGET)/bin/libgstapp.dll'               '$(PREFIX)/$(TARGET)/apps/$(PKG)/bin/gstreamer-plugins';
        $(INSTALL) '$(PREFIX)/$(TARGET)/bin/libgstasf.dll'               '$(PREFIX)/$(TARGET)/apps/$(PKG)/bin/gstreamer-plugins';
        $(INSTALL) '$(PREFIX)/$(TARGET)/bin/libgstaudioconvert.dll'      '$(PREFIX)/$(TARGET)/apps/$(PKG)/bin/gstreamer-plugins';
        $(INSTALL) '$(PREFIX)/$(TARGET)/bin/libgstaudiofx.dll'           '$(PREFIX)/$(TARGET)/apps/$(PKG)/bin/gstreamer-plugins';
        $(INSTALL) '$(PREFIX)/$(TARGET)/bin/libgstaudioparsers.dll'      '$(PREFIX)/$(TARGET)/apps/$(PKG)/bin/gstreamer-plugins';
        $(INSTALL) '$(PREFIX)/$(TARGET)/bin/libgstaudioresample.dll'     '$(PREFIX)/$(TARGET)/apps/$(PKG)/bin/gstreamer-plugins';
        $(INSTALL) '$(PREFIX)/$(TARGET)/bin/libgstaudiotestsrc.dll'      '$(PREFIX)/$(TARGET)/apps/$(PKG)/bin/gstreamer-plugins';
        $(INSTALL) '$(PREFIX)/$(TARGET)/bin/libgstautodetect.dll'        '$(PREFIX)/$(TARGET)/apps/$(PKG)/bin/gstreamer-plugins';
        $(INSTALL) '$(PREFIX)/$(TARGET)/bin/libgstcdio.dll'              '$(PREFIX)/$(TARGET)/apps/$(PKG)/bin/gstreamer-plugins';
        $(INSTALL) '$(PREFIX)/$(TARGET)/bin/libgstcoreelements.dll'      '$(PREFIX)/$(TARGET)/apps/$(PKG)/bin/gstreamer-plugins';
        $(INSTALL) '$(PREFIX)/$(TARGET)/bin/libgstdirectsoundsink.dll'   '$(PREFIX)/$(TARGET)/apps/$(PKG)/bin/gstreamer-plugins';
        $(INSTALL) '$(PREFIX)/$(TARGET)/bin/libgstequalizer.dll'         '$(PREFIX)/$(TARGET)/apps/$(PKG)/bin/gstreamer-plugins';
        $(INSTALL) '$(PREFIX)/$(TARGET)/bin/libgstfaad.dll'              '$(PREFIX)/$(TARGET)/apps/$(PKG)/bin/gstreamer-plugins';
        $(INSTALL) '$(PREFIX)/$(TARGET)/bin/libgstflac.dll'              '$(PREFIX)/$(TARGET)/apps/$(PKG)/bin/gstreamer-plugins';
        $(INSTALL) '$(PREFIX)/$(TARGET)/bin/libgstgdp.dll'               '$(PREFIX)/$(TARGET)/apps/$(PKG)/bin/gstreamer-plugins';
        $(INSTALL) '$(PREFIX)/$(TARGET)/bin/libgstgio.dll'               '$(PREFIX)/$(TARGET)/apps/$(PKG)/bin/gstreamer-plugins';
        $(INSTALL) '$(PREFIX)/$(TARGET)/bin/libgsticydemux.dll'          '$(PREFIX)/$(TARGET)/apps/$(PKG)/bin/gstreamer-plugins';
        $(INSTALL) '$(PREFIX)/$(TARGET)/bin/libgstid3demux.dll'          '$(PREFIX)/$(TARGET)/apps/$(PKG)/bin/gstreamer-plugins';
        $(INSTALL) '$(PREFIX)/$(TARGET)/bin/libgstisomp4.dll'            '$(PREFIX)/$(TARGET)/apps/$(PKG)/bin/gstreamer-plugins';
        $(INSTALL) '$(PREFIX)/$(TARGET)/bin/libgstlame.dll'              '$(PREFIX)/$(TARGET)/apps/$(PKG)/bin/gstreamer-plugins';
        $(INSTALL) '$(PREFIX)/$(TARGET)/bin/libgstmad.dll'               '$(PREFIX)/$(TARGET)/apps/$(PKG)/bin/gstreamer-plugins';
        $(INSTALL) '$(PREFIX)/$(TARGET)/bin/libgstogg.dll'               '$(PREFIX)/$(TARGET)/apps/$(PKG)/bin/gstreamer-plugins';
        $(INSTALL) '$(PREFIX)/$(TARGET)/bin/libgstopus.dll'              '$(PREFIX)/$(TARGET)/apps/$(PKG)/bin/gstreamer-plugins';
        $(INSTALL) '$(PREFIX)/$(TARGET)/bin/libgstplayback.dll'          '$(PREFIX)/$(TARGET)/apps/$(PKG)/bin/gstreamer-plugins';
        $(INSTALL) '$(PREFIX)/$(TARGET)/bin/libgstreplaygain.dll'        '$(PREFIX)/$(TARGET)/apps/$(PKG)/bin/gstreamer-plugins';
        $(INSTALL) '$(PREFIX)/$(TARGET)/bin/libgstsouphttpsrc.dll'       '$(PREFIX)/$(TARGET)/apps/$(PKG)/bin/gstreamer-plugins';
        $(INSTALL) '$(PREFIX)/$(TARGET)/bin/libgstspectrum.dll'          '$(PREFIX)/$(TARGET)/apps/$(PKG)/bin/gstreamer-plugins';
        $(INSTALL) '$(PREFIX)/$(TARGET)/bin/libgstspeex.dll'             '$(PREFIX)/$(TARGET)/apps/$(PKG)/bin/gstreamer-plugins';
        $(INSTALL) '$(PREFIX)/$(TARGET)/bin/libgsttaglib.dll'            '$(PREFIX)/$(TARGET)/apps/$(PKG)/bin/gstreamer-plugins';
        $(INSTALL) '$(PREFIX)/$(TARGET)/bin/libgsttcp.dll'               '$(PREFIX)/$(TARGET)/apps/$(PKG)/bin/gstreamer-plugins';
        $(INSTALL) '$(PREFIX)/$(TARGET)/bin/libgsttypefindfunctions.dll' '$(PREFIX)/$(TARGET)/apps/$(PKG)/bin/gstreamer-plugins';
        $(INSTALL) '$(PREFIX)/$(TARGET)/bin/libgstudp.dll'               '$(PREFIX)/$(TARGET)/apps/$(PKG)/bin/gstreamer-plugins';
        $(INSTALL) '$(PREFIX)/$(TARGET)/bin/libgstvolume.dll'            '$(PREFIX)/$(TARGET)/apps/$(PKG)/bin/gstreamer-plugins';
        $(INSTALL) '$(PREFIX)/$(TARGET)/bin/libgstvorbis.dll'            '$(PREFIX)/$(TARGET)/apps/$(PKG)/bin/gstreamer-plugins';
        $(INSTALL) '$(PREFIX)/$(TARGET)/bin/libgstwavpack.dll'           '$(PREFIX)/$(TARGET)/apps/$(PKG)/bin/gstreamer-plugins';
        $(INSTALL) '$(PREFIX)/$(TARGET)/bin/libgstwavparse.dll'          '$(PREFIX)/$(TARGET)/apps/$(PKG)/bin/gstreamer-plugins';

        $(INSTALL) -d '$(PREFIX)/$(TARGET)/apps/$(PKG)/bin/imageformats';
        $(INSTALL) '$(PREFIX)/$(TARGET)/qt/plugins/imageformats/qgif4.dll'     '$(PREFIX)/$(TARGET)/apps/$(PKG)/bin/imageformats';
        $(INSTALL) '$(PREFIX)/$(TARGET)/qt/plugins/imageformats/qjpeg4.dll'    '$(PREFIX)/$(TARGET)/apps/$(PKG)/bin/imageformats';

        '$(TOP_DIR)/tools/copydlldeps.sh' -c \
                                          -d '$(PREFIX)/$(TARGET)/apps/$(PKG)/bin' \
                                          -F '$(PREFIX)/$(TARGET)/apps/$(PKG)/bin' \
                                          -F '$(PREFIX)/$(TARGET)/apps/$(PKG)/bin/gstreamer-plugins' \
                                          -F '$(PREFIX)/$(TARGET)/apps/$(PKG)/bin/imageformats' \
                                          -R '$(PREFIX)/$(TARGET)';
     )
endef

$(PKG)_BUILD_STATIC =
