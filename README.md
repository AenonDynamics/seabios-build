seabios encapsulated build environment
========================================

build seabios firmware images within docker container. based on debian buster


Usage
-------------------

### Step 1 - Build docker image ###

```bash
# build docker image using specific seabios release
# the tag/branch name is also used as docker image tag
./seabios-build init 1.13.0
```

### Step 2 - Setup build configuration and run make ###

**Example - Custom Build**

```bash
# set target device
make menuconfig

# build (n+1 core)
make -j5
```

License
------------------------------
The Dockerfile and configuration templates are OpenSource and licensed under the Terms of [Mozilla Public License 2.0](https://opensource.org/licenses/MPL-2.0) - your're welcome to contribute