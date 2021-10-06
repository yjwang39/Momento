conda config --add channels https://mirrors.nju.edu.cn/anaconda/pkgs/free/
conda config --add channels https://mirrors.nju.edu.cn/anaconda/pkgs/main/
conda config --set show_channel_urls yes
conda config --add channels https://mirrors.nju.edu.cn/anaconda/cloud/conda-forge/
tar -zxvf
./configure --prefix=$HOME/local CFLAGS=-fPIC --enable-netcdf4 -with-netcdf=$HOME/local

# NCO
APP=nco-4.9.9

CC=gcc CXX='' \
NETCDF_INC=$NETCDF/include \
NETCDF_LIB=$NETCDF/liblib \
NETCDF4_ROOT=$NETCDF \
GSL_ROOT=$GSl_ROOT \
LDFLAGS="-L$NETCDF/lib -lnetcdf" \
CFLAGS="-I$HDF_ROOT/include \
-L$HDF_ROOT/lib-I$NETCDF4_ROOT/include \
-L$NETCDF4_ROOT/lib" \
CPPFLAGS="-I$HDF_ROOT/include \
-L$HDF_ROOT/lib  \
-I$NETCDF4_ROOT/include \
-L$NETCDF4_ROOT/lib" 

./configure \
--prefix=$HOME \
--disable-shared \
--enable-netcdf4 2>&1 | tee $APP.config
make 2>&1 | tee $APP.make
make install 2>&1 | tee $APP.install