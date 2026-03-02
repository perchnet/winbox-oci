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

But if you wanna be silly you probably can just run it with podman: (no idea if you need these args or even if it works lol it's from [here](https://discussion.fedoraproject.org/t/how-can-i-use-podman-to-run-a-wayland-app/1672/2))

```bash
args=(
    # Disable SELinux label to enable mounting runtime socket
    --security-opt label=disable
    # Enable legacy X11
    -v /tmp/.X11-unix/:/tmp/.X11-unix/
    -e DISPLAY=:0
    # Enable xdg runtime for wayland and pulseaudio socket  
    -v /run/user/1000/:/run/user/1000/
    -e XDG_RUNTIME_DIR=/run/user/1000
    -e PULSE_SERVER=/run/user/1000/pulse/native
    # fix XError bad access
    --ipc host
)
podman run ${args[@]} ghcr.io/perchnet/winbox-oci:latest
```