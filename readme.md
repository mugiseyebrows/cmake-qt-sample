You can build application using

```bash
mkdir build
cd build
cmake -G Ninja -D CMAKE_BUILD_TYPE=Release ..
cmake --build .
```

You can install bundle using
```bash
cmake --install . --prefix=C:/app-1.0.0-win64
```

You can create nsis installer `app-1.0.0-win64.exe` using
```bash
cpack -G NSIS
```

You can create zip distribution `app-1.0.0-win64.zip` using

```bash
cpack -G ZIP
```