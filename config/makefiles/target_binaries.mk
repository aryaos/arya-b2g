# -*- makefile -*-
# vim:set ts=8 sw=8 sts=8 noet:
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

ifndef NO_DIST_INSTALL

ifneq (,$(strip $(PROGRAM)$(SIMPLE_PROGRAMS)))
PROGRAMS_EXECUTABLES = $(SIMPLE_PROGRAMS) $(PROGRAM)
PROGRAMS_DEST ?= $(FINAL_TARGET)
PROGRAMS_TARGET := target
INSTALL_TARGETS += PROGRAMS
endif

ifdef LIBRARY
ifdef DIST_INSTALL
ifdef IS_COMPONENT
$(error Shipping static component libs makes no sense.)
else
DIST_LIBRARY_FILES = $(LIBRARY)
DIST_LIBRARY_DEST ?= $(DIST)/lib
DIST_LIBRARY_TARGET = target
INSTALL_TARGETS += DIST_LIBRARY
endif
endif # DIST_INSTALL
endif # LIBRARY


ifdef SHARED_LIBRARY
SHARED_LIBRARY_FILES = $(SHARED_LIBRARY)
SHARED_LIBRARY_DEST ?= $(FINAL_TARGET)$(if $(IS_COMPONENT),/components)
SHARED_LIBRARY_TARGET = target
INSTALL_TARGETS += SHARED_LIBRARY

ifdef IMPORT_LIBRARY
IMPORT_LIB_FILES = $(IMPORT_LIBRARY)
IMPORT_LIB_DEST ?= $(DIST)/lib
IMPORT_LIB_TARGET = target
INSTALL_TARGETS += IMPORT_LIB
endif

endif # SHARED_LIBRARY

ifneq (,$(strip $(HOST_SIMPLE_PROGRAMS)$(HOST_PROGRAM)))
HOST_PROGRAMS_EXECUTABLES = $(HOST_SIMPLE_PROGRAMS) $(HOST_PROGRAM)
HOST_PROGRAMS_DEST ?= $(DIST)/host/bin
HOST_PROGRAMS_TARGET = host
INSTALL_TARGETS += HOST_PROGRAMS
endif

ifdef HOST_LIBRARY
HOST_LIBRARY_FILES = $(HOST_LIBRARY)
HOST_LIBRARY_DEST ?= $(DIST)/host/lib
HOST_LIBRARY_TARGET = host
INSTALL_TARGETS += HOST_LIBRARY
endif

endif # !NO_DIST_INSTALL

# EOF