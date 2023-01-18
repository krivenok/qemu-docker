FROM fedora:37

# QEMU version
ENV VER=7.2.0

RUN dnf update -y
RUN dnf install -y wget xz
RUN wget https://download.qemu.org/qemu-${VER}.tar.xz
RUN tar xvJf qemu-${VER}.tar.xz
WORKDIR qemu-${VER}

RUN dnf install -y make git glib2-devel libfdt-devel pixman-devel zlib-devel bzip2 ninja-build python3 gcc meson diffutils libaio-devel libcap-ng-devel libiscsi-devel capstone-devel  gtk3-devel vte291-devel ncurses-devel libseccomp-devel nettle-devel libattr-devel libjpeg-devel  brlapi-devel libgcrypt-devel lzo-devel snappy-devel librdmacm-devel libibverbs-devel cyrus-sasl-devel libpng-devel     libuuid-devel pulseaudio-libs-devel curl-devel libssh-devel  systemtap-sdt-devel libusbx-devel python3-sphinx acpica-tools binutils g++ SDL2-devel libslirp device-mapper-multipath libgudev-devel liburing-devel daxctl-devel libngspice-devel spice-server-devel genisoimage  SDL2-devel  libtasn1 pam-devel libnfs glusterfs lzfse-devel libzstd-devel libpmem virglrenderer-devel alsa-lib-devel librados-devel librbd-devel libpmem-devel keyutils-libs-devel fuse3-devel libbpf-devel libdrm-devel usbredir-devel libblockdev-mpath-devel SDL2_image libglusterfs-devel gnutls-devel mesa-libgbm-devel numactl-devel libu2f-host-devel libu2f-server-devel u2f-server libu2f-host libu2f-server libnfs-devel libgfapi0 SDL2_image-devel libslirp-devel libgcrypt-devel device-mapper-multipath-devel nettle-devel python3-sphinx_rtd_theme man which
RUN ./configure --target-list=x86_64-softmmu x86_64-linux-user --enable-docs --enable-bpf --enable-vnc --enable-vhost-user-blk-server  --enable-tools
RUN make -j16
RUN make install
