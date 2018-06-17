INCLUDE(FindPkgConfig)
PKG_CHECK_MODULES(PC_SPI spi)

FIND_PATH(
    SPI_INCLUDE_DIRS
    NAMES spi/api.h
    HINTS $ENV{SPI_DIR}/include
        ${PC_SPI_INCLUDEDIR}
    PATHS ${CMAKE_INSTALL_PREEFIX}/include
          /usr/local/include
          /usr/include
)

FIND_LIBRARY(
    SPI_LIBRARIES
    NAMES gnuradio-spi
    HINTS $ENV{SPI_DIR}/lib
        ${PC_SPI_LIBDIR}
    PATHS ${CMAKE_INSTALL_PREFIX}/lib
          ${CMAKE_INSTALL_PREFIX}/lib64
          /usr/local/lib
          /usr/local/lib64
          /usr/lib
          /usr/lib64
)

INCLUDE(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(SPI DEFAULT_MSG SPI_LIBRARIES SPI_INCLUDE_DIRS)
MARK_AS_ADVANCED(SPI_LIBRARIES SPI_INCLUDE_DIRS)

