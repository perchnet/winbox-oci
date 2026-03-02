ARG BASE_IMAGE=docker.io/alpine
ARG BASE_VERSION=latest
ARG IMAGE=${BASE_IMAGE}:${BASE_VERSION}

# save our build_files
FROM scratch AS ctx
COPY build_files /build

FROM ${IMAGE} AS builder

# install dependencies
RUN --mount=type=bind,from=ctx,source=/,target=/ctx \
    #--mount=type=tmpfs,dst=/var \
    #--mount=type=tmpfs,dst=/tmp \
    #--mount=type=tmpfs,dst=/run \
    #--mount=type=tmpfs,dst=/boot \
    #--mount=type=cache,dst=/var/cache/libdnf5 \
    #--network=none \
    /ctx/build/01-deps.sh

# get source code
RUN --mount=type=bind,from=ctx,source=/,target=/ctx \
    #--mount=type=tmpfs,dst=/var \
    #--mount=type=tmpfs,dst=/tmp \
    #--mount=type=tmpfs,dst=/run \
    #--mount=type=tmpfs,dst=/boot \
    #--mount=type=cache,dst=/var/cache/libdnf5 \
    #--network=none \
    /ctx/build/02-src.sh

# build
RUN --mount=type=bind,from=ctx,source=/,target=/ctx \
    #--mount=type=tmpfs,dst=/var \
    #--mount=type=tmpfs,dst=/tmp \
    #--mount=type=tmpfs,dst=/run \
    #--mount=type=tmpfs,dst=/boot \
    #--mount=type=cache,dst=/var/cache/libdnf5 \
    #--network=none \
    /ctx/build/03-build.sh

# package
RUN --mount=type=bind,from=ctx,source=/,target=/ctx \
    #--mount=type=tmpfs,dst=/var \
    #--mount=type=tmpfs,dst=/tmp \
    #--mount=type=tmpfs,dst=/run \
    #--mount=type=tmpfs,dst=/boot \
    #--mount=type=cache,dst=/var/cache/libdnf5 \
    --network=none \
    /ctx/build/04-package.sh

FROM scratch
COPY --from=builder /out/ /
