# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

#[=======================================================================[.rst:
FindANTLR4
------------

Find ``antlr4`` executable and provide a macro to generate custom build rules.

The module defines the following variables:

``ANTLR4_EXECUTABLE``
  path to the ``antlr4`` program

``ANTLR4_VERSION``
  version of ``antlr4``

``ANTLR4_FOUND``
  "True" if the program was found

The minimum required version of ``antlr4`` can be specified using the
standard CMake syntax, e.g.  :command:`find_package(antlr4 2.1.3)`.

#]=======================================================================]

find_program(ANTLR4_EXECUTABLE NAMES antlr4 DOC "path to the antlr4 executable")
mark_as_advanced(ANTLR4_EXECUTABLE)

if(ANTLR4_EXECUTABLE)
  # the antlr4 commands should be executed with the C locale, otherwise
  # the message (which are parsed) may be translated
  set(_ANTLR4_SAVED_LC_ALL "$ENV{LC_ALL}")
  set(ENV{LC_ALL} C)

  execute_process(COMMAND ${ANTLR4_EXECUTABLE}
    OUTPUT_VARIABLE ANTLR4_version_output
    ERROR_VARIABLE ANTLR4_version_error
    RESULT_VARIABLE ANTLR4_version_result
    OUTPUT_STRIP_TRAILING_WHITESPACE)

  set(ENV{LC_ALL} ${_ANTLR4_SAVED_LC_ALL})

  if(NOT ${ANTLR4_version_result} EQUAL 0)
    message(SEND_ERROR "Command \"${ANTLR4_EXECUTABLE}\" failed with output:\n${ANTLR4_version_error}")
  else()
    # ANTLR4
    if("${ANTLR4_version_output}" MATCHES "^ANTLR.*Version ([^,]+)")
      set(ANTLR4_VERSION "${CMAKE_MATCH_1}")
    endif()
  endif()
endif()

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(ANTLR4 REQUIRED_VARS  ANTLR4_EXECUTABLE
                                        VERSION_VAR ANTLR4_VERSION)
