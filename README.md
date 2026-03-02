# bri's basic fedora builder container

i use this template (and the image it produces) to build "distroless" OCI images that i can then `COPY` into another container. you can use it too!

basically you just use the template to make a new repo, and add the steps into the scripts to install dependencies, download source code, build some shit, and copy the shit somewhere to be pulled into a new ("distroless") container image that we then push.

most of the steps in the Containerfile are commented out, because i use the base template itself as a base `FROM` image for repos that i use this template for. 

## examples

right now the only repos i'm using this template as-is for are private, but a public example will come soon. if you use it, file an issue and i'll put your project here!

## prior art

i did something similar but less thought-out [here](perchnet/interception-vimproved) to build a key remapping tool as an OCI image for my bootc image

much of the layout of this repo has been inspired and loosely ripped from the [zirconium](zirconium-dev/zirconium) repo. 

—bri✨