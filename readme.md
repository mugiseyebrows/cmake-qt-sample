# cmake-qt-sample

This repository contains variants of build and deploy cmake scripts for qt application

[cpack](https://github.com/mugiseyebrows/cmake-qt-sample/tree/cpack) branch contains script that uses cmake qt config to install qt plugins and `file(GET_RUNTIME_DEPENDENCIES)` to resolve dependencies and can create nsis installer or zip bundle or install bundle to system with `cmake --install . --prefix=C:/app`

```bash
git clone https://github.com/mugiseyebrows/cmake-qt-sample.git -b cpack cmake-qt-sample-cpack
```

[windeployqt](https://github.com/mugiseyebrows/cmake-qt-sample/tree/windeployqt) branch contains script that uses [windeployqt](https://doc.qt.io/qt-5/windows-deployment.html) to create bundle

```bash
git clone https://github.com/mugiseyebrows/cmake-qt-sample.git -b windeployqt cmake-qt-sample-windeployqt
```

[mugideploy](https://github.com/mugiseyebrows/cmake-qt-sample/tree/mugideploy) branch contains script that uses [mugideploy](https://github.com/mugiseyebrows/mugideploy) python package to create bundle

```bash
git clone https://github.com/mugiseyebrows/cmake-qt-sample.git -b mugideploy cmake-qt-sample-mugideploy
```

[main](https://github.com/mugiseyebrows/cmake-qt-sample) branch contains script that doesn't include deployment

```bash
git clone https://github.com/mugiseyebrows/cmake-qt-sample.git -b main cmake-qt-sample-main
```

