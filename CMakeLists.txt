CMAKE_MINIMUM_REQUIRED(VERSION 2.8)
INCLUDE(FindPkgConfig)

PKG_CHECK_MODULES(SNDFILE REQUIRED sndfile>=1.0.0)
LINK_DIRECTORIES("${SNDFILE_LIBRARY_DIRS}")
INCLUDE_DIRECTORIES("${SNDFILE_INCLUDE_DIRS}" src)

FILE(READ "configure.ac" CONFIG_AC)
STRING(REGEX REPLACE "\\[|\\]" ";" CONFIG_AC "${CONFIG_AC}")
LIST(GET CONFIG_AC 5 VERSION)

SET(LIBS "Ext/libsndfile.a")
SET(exec_prefix "\${prefix}")
SET(libdir "\${exec_prefix}/lib")
SET(includedir "\${prefix}/include")
CONFIGURE_FILE(samplerate.pc.in samplerate.pc @ONLY)
CONFIGURE_FILE(Win32/config.h.in src/config.h @ONLY)

ADD_LIBRARY(samplerate SHARED
    src/samplerate.c
    src/src_linear.c
    src/src_sinc.c
    src/src_zoh.c
)
