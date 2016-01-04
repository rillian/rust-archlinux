FROM base/archlinux
MAINTAINER Ralph Giles <giles@mozilla.com>

# Update base image.
RUN pacman-key --refresh-keys
RUN pacman -Syu --noconfirm
RUN pacman-db-upgrade

# Install dependencies.
RUN pacman -Sy --noconfirm git make gcc python2

# Check out source.
RUN git clone https://github.com/rust-lang/rust

# Update and build.
CMD cd rust && ./configure && make -j $(nproc)
