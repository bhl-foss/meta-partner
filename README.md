# Brainhoard Linux µPlatform

This repository contains an example Linux Micro Platform partner layer. The use
of this example is to partition FOSS in a manner that it can be updated and build
from upstream.

| MACHINE | DISTRO | Description |
| -- | -- | -- |
| aaeon-boxer-6313 | lmp | Aaeon Boxer-6313 |
| aaeon-boxer-8250ai | lmp | Aaeon Boxer-8250AI |
| adlink-cexpress-bt | lmp | Adlink cExpress-BT |
| adlink-cexpress-sl | lmp | Adlink cExpress-SL |

<!--
WSL2 Notes: clang-native does not always build successfully when other packages
are also being built. In this case, perform 'bitbake clang-native' alone allowing
for it to complete. The root issue appears to be an OOM condition; various memory
setting limits can be used in %USERPROFILE%/.wslconfig to tune the resources allowed.
-->
