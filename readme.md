You can build application and create bundle using

```bash
mkdir build
cd build
cmake -G Ninja -D CMAKE_BUILD_TYPE=Release ..
cmake --build .
```

cmake's `add_custom_command` uses [mugideploy](https://github.com/mugiseyebrows/mugideploy) to produce `app-version-arch` bundle and `app-version-arch.zip` distributive in build process.