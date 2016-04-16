#bassoman/lxde-vnc

Based on a project by Sidirius/docker-lxde-vnc

Includes:
--
    Oracle Java SDK 8u77
    Downloads (not installs) Netbeans 8.1

Manual Build:
--
    git clone https://github.com/bassoman/lxde-vnc.git
    cd lxde-vnc
    ./build.sh

Run:
--
    docker run -dt --name lxde_vnc -p 5900:5900 -p 5800:5800 -e passwd="*your_password_for_vnc*" bassoman/lxde-vnc
    docker-compose:
    --
        (TBD)

Other Usage:
--
    After installing desired programs in a running container, commit it to a new one to keep configuration. Still working on how to install GUI programs via the docker build system...
