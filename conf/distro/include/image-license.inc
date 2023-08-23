# Unwanted SPDX-License-Identifier GPL-3.0-or-later
INCOMPATIBLE_LICENSE:append = " AGPL-3.0* GPL-3.0* LGPL-3.0*"

# Unwanted identified packages allowed to build and generate QA warnings
INCOMPATIBLE_LICENSE_EXCEPTIONS:append = "\
    autoconf:GPL-3.0-or-later \
    bash:GPL-3.0-or-later \
    bc:GPL-3.0-or-later \
    binutils:GPL-3.0-or-later \
    bison:GPL-3.0-or-later \
    ccache:GPL-3.0-or-later \
    coreutils:GPL-3.0-or-later \
    coreutils-stdbuf:GPL-3.0-or-later \
    diffutils:GPL-3.0-or-later \
    elfutils:GPL-3.0-or-later \
    findutils:GPL-3.0-or-later \
    gawk:GPL-3.0-or-later \
    gdb:GPL-3.0-or-later \
    gdbm:GPL-3.0-or-later \
    gettext:GPL-3.0-or-later \
    gnutls:GPL-3.0-or-later \
    grep:GPL-3.0-or-later \
    libevent:GPL-3.0-or-later \
    libpipeline:GPL-3.0-or-later \
    libunistring:GPL-3.0-or-later \
    m4:GPL-3.0-or-later \
    make:GPL-3.0-or-later \
    readline:GPL-3.0-or-later \
    rsync:GPL-3.0-or-later \
    sed:GPL-3.0-or-later \
    which:GPL-3.0-or-later \
"
