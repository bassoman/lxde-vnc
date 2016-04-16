#bassoman/lxde-vnc

Based on a project by Sidirius/docker-lxde-vnc

Manual Build:
--
    git clone https://github.com/bassoman/lxde-vnc.git
    cd lxde-vnc
    ./build.sh

Run:
--
    docker run -dt --name lxde_vnc -p 5900:5900 -p 5800:5800 -e passwd="*your_password_for_vnc*" bassoman/lxde-vnc
