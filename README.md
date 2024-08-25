# ビルド手順

##  1.  VS デベロッパープロンプトを起動

スタートメニューから「すべてのアプリ」を開き、
Visual Studio 2019  の中にある
「x86 Native Tools Command Prompt for VS 2019」を起動

##  2.  パスを引き継いで MSYS シェルを起動

```
set MSYS2_PATH_TYPE=inherit
N:\Msys2x64\msys2_shell.cmd  -full-path -mingw32
```

##  3.  パスを設定

- まず VS のコンパイラが入っているパスを確認する

```
$ which -a cl
/d/ProgramsX86/Microsoft Visual Studio/2019/Community/VC/Tools/MSVC/14.29.30133/bin/HostX86/x86/cl
```

- パスを設定し MSYS の /usr/bin/link
  ではなく VS の link コマンドが使われるようにする

```
export PATH="/d/ProgramsX86/Microsoft Visual Studio/2019/Community/VC/Tools/MSVC/14.29.30133/bin/HostX86/x86:${PATH}"
```

- 設定されたか確認

```
which -a link
```

##  4.  ビルド

```
pushd /path/to/workdir
mkdir -p ffmpeg
cd ffmpeg
time  /path/to/sourcedir/ffmpeg/configure  --prefix=.  --disable-shared --enable-static --enable-gpl --enable-version3  --toolchain=msvc
time  make
popd
```
