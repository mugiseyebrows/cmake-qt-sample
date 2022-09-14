# cmake-qt-sample

This repository contains variants of build and deploy cmake scripts for qt application

`cpack` branch contains script that uses cmake qt config to install qt plugins and `file(GET_RUNTIME_DEPENDENCIES)` to resolve dependencies and can create nsis installer or zip bundle or install bundle to system with `cmake --install . --prefix=C:/app`

```bash
git clone https://github.com/mugiseyebrows/cmake-qt-sample.git -b cpack cmake-qt-sample-cpack
```

`windeployqt` branch contains script that uses `windeployqt` to create bundle

```bash
git clone https://github.com/mugiseyebrows/cmake-qt-sample.git -b windeployqt cmake-qt-sample-windeployqt
```

`mugideploy` branch contains script that uses `mugideploy` python package to create bundle

```bash
git clone https://github.com/mugiseyebrows/cmake-qt-sample.git -b mugideploy cmake-qt-sample-mugideploy
```

`main` branch contains script that doesn't include deployment

```bash
git clone https://github.com/mugiseyebrows/cmake-qt-sample.git -b main cmake-qt-sample-main
```

