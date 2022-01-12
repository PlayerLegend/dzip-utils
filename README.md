# dzip-utils

This source provides the dzip utility, which is used for deflating and inflating streams using the dzip compression format implemented by the [dzip submodule](https://github.com/PlayerLegend/submodule-dzip/)
For a more detailed description of dzip, see the aforementioned submodule.

# Installation

To pull the contents of the submodules, run

git submodule init  
git submodule update  

After that, the commands:

make  
make install  

should be sufficient for building and installing a release version of dzip. The PREFIX and DESTDIR environment variables may be used here to configure the output directory.
