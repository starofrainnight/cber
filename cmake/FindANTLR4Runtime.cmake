# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

#[=======================================================================[.rst:
FindANTLR4Runtime
------------------------

Find the ANTLR4 Runtime libraries

IMPORTED Targets
^^^^^^^^^^^^^^^^

This module defines :prop_tgt:`IMPORTED` target ``ANTLR4::Runtime``, if
ANTLR4 Runtime has been found.

Result Variables
^^^^^^^^^^^^^^^^

This module defines the following variables:

``ANTLR4RUNTIME_FOUND``
  True if ANTLR4RUNTIME_INCLUDE_DIR & ANTLR4_LIBRARY are found

``ANTLR4RUNTIME_LIBRARIES``
  List of libraries when using ANTLR4 Runtime.

``ANTLR4RUNTIME_INCLUDE_DIRS``
  Where to find the ANTLR4 Runtime headers.

Cache variables
^^^^^^^^^^^^^^^

The following cache variables may also be set:

``ANTLR4RUNTIME_INCLUDE_DIR``
  the ANTLR4 Runtime include directory

``ANTLR4RUNTIME_LIBRARY``
  the absolute path of the ANTLR4 Runtime library
#]=======================================================================]

find_path(ANTLR4RUNTIME_INCLUDE_DIR NAMES "antlr4-runtime/antlr4-runtime.h"
          DOC "The ANTLR4 Runtime include directory"
)

if(ANTLR4RUNTIME_INCLUDE_DIR)
  set(ANTLR4RUNTIME_INCLUDE_DIR ${ANTLR4RUNTIME_INCLUDE_DIR}/antlr4-runtime)
endif()

find_library(ANTLR4RUNTIME_LIBRARY NAMES "antlr4-runtime"
          DOC "The ANTLR4 Runtime library"
)

include("${CMAKE_ROOT}/Modules/FindPackageHandleStandardArgs.cmake")
FIND_PACKAGE_HANDLE_STANDARD_ARGS(ANTLR4RUNTIME
                                  REQUIRED_VARS ANTLR4RUNTIME_LIBRARY ANTLR4RUNTIME_INCLUDE_DIR)
if(ANTLR4RUNTIME_FOUND)
  set(ANTLR4RUNTIME_LIBRARIES ${ANTLR4RUNTIME_LIBRARY})
  set(ANTLR4RUNTIME_INCLUDE_DIRS ${ANTLR4RUNTIME_INCLUDE_DIR})
  if(NOT TARGET ANTLR4::Runtime)
    add_library(ANTLR4::Runtime UNKNOWN IMPORTED)
    set_target_properties(ANTLR4::Runtime PROPERTIES INTERFACE_INCLUDE_DIRECTORIES "${ANTLR4RUNTIME_INCLUDE_DIRS}")
    set_property(TARGET ANTLR4::Runtime APPEND PROPERTY IMPORTED_LOCATION "${ANTLR4RUNTIME_LIBRARY}")
  endif()
endif()

mark_as_advanced(ANTLR4RUNTIME_INCLUDE_DIR ANTLR4RUNTIME_LIBRARY)