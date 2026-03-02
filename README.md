# WinBox OCI image

This repo produces a container image that contains the WinBox GUI for Mikrotik RouterOS.

It is intended to be `COPY`ed into a derived bootc container image, like so:

```dockerfile
FROM ghcr.io/perchnet/winbox-oci:latest AS winbox
FROM ghcr.io/zirconium-dev/zirconium:latest

COPY --from=winbox / /
```

Or you can use bluebuild:

```yaml
name: image
base-image: ghcr.io/zirconium-dev/zirconium
image-version: latest
modules:
  - type: copy
    from: ghcr.io/perchnet/winbox-oci:latest
    src: /
    dest: /
```