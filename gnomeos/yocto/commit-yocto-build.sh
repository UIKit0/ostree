# Copyright (C) 2011 Colin Walters <walters@verbum.org>
#

set -e
set -x

WORKDIR=`pwd`

if test $(id -u) = 0; then
    cat <<EOF
This script should not be run as root.
EOF
    exit 1
fi

usage () {
    echo "$0 BRANCH"
    exit 1
}

BRANCH=$1
test -n "$BRANCH" || usage
shift

OSTREE_REPO=$WORKDIR/repo
BUILD_TAR=$WORKDIR/tmp-eglibc/deploy/images/gnomeos-contents-$BRANCH-qemux86.tar.gz

tempdir=`mktemp -d tmp-commit-yocto-build.XXXXXXXXXX`
cd $tempdir
mkdir fs
cd fs
fakeroot -s ../fakeroot.db tar xf $BUILD_TAR
fakeroot -i ../fakeroot.db ostree --repo=${OSTREE_REPO} commit -s "Build (need ostree git version here)" -b "gnomeos-$BRANCH"
cd "${WORKDIR}"
rm -rf $tempdir