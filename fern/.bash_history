diff tryme.ll tryme_cfg.ll 
cat tryme_cfg_inst.ll 
cat tryme_inst.ll 
cat tryme_inst_cfg.ll 
cat tryme_cfg_inst.ll 
diff tryme.ll tryme_cfg_inst.ll 
opt --passes instcombine -S tryme_cfg.ll -o tryme_cfg_inst.ll
diff tryme.ll tryme_cfg_inst.ll 
cat tryme_cfg_inst.ll 
opt --passes adce -S tryme_inst.ll -o tryme_inst_adce.ll
nano tryme_inst_adce.ll 
opt --passes dce -S tryme_inst.ll -o tryme_inst_adce.ll
nano tryme_inst_adce.ll 
htop
top
sudo pacman -S steam
sudo pacman -S spotify
sudo pacman -S spotify-launcher 
sudo pacman -S discord
steam
killall steam
steam
killall steam
top
nvidia-smi 
killall kitt
killall kitty
nvidia-smi 
top
pacman -S telegram-desktop 
sudo pacman -S telegram-desktop 
mkdir -p .config/flameshot
nano .config/flameshot/flameshot.ini
sudo pacman -S flameshot 
flameshot 
sudo pacman -S grim 
grim
grim -h
sudo pacman -S ksnip 
sudo pacman -R ksnip grim 
sudo pacman -S frim
sudo pacman -S grim
flameshot 
ls 
ls desktop/
ls Downloads/
rmdir Downloads/
ls
sudo pacman -S telegram-desktop 
Telegram 
mkdir projects
cd projects/
mkdir kleinmix
cd kleinmix/
nano README
git init
sudo pacman -S git
git init
git add README 
git commit -m "first look into the world"
git config --global user.email "anthon.png@proton.me"
git config --global user.name "Anthon Porath Gretter"
git commit -m "first look into the world"
git branch -M master
git remote add origin git@github.com:anthongretter/kleinmix.git
git push -u origin master 
ssh
sudo pacman -S ssh
sudo pacman -S openssh 
ls ~/.ssh/
git push -u origin master 
cat .config/user-dirs.dirs 
nano .config/user-dirs.dirs 
xdg-user-dirs-update 
ls
nano .config/user-dirs.dirs 
mkdir videos music templates public pictures
ls
nano .config/user-dirs.dirs 
xdg-user-dirs-update 
nano .config/user-dirs.dirs 
ls
rm 20251026_21h05m*
ls
sudo pacman -S zed 
top
cd downloads/
ls
tar -xf jetbrains-toolbox-3.0.1.59888.tar.gz 
ls
cd jetbrains-toolbox-3.0.1.59888/
ls
ls bin/
cd bin/
nano Install-linux-tar.txt 
./jetbrains-toolbox 
cd
./downloads/jetbrains-toolbox-3.0.1.59888/bin/jetbrains-toolbox 
mkdir source
cd source/
ls
git clone https://github.com/ProtonVPN/python-proton-keyring-linux.git
cd python-proton-keyring-linux/
python -m venv venv
./venv/bin/pip -r requirements.txt
./venv/bin/pip install -r requirements.txt
cd ..
git clone https://github.com/ProtonVPN/python-proton-core.git
cd python-proton-core/
python -m venv venv
./venv/bin/pip install -r requirements.txt 
./venv/bin/python setup.py 
./venv/bin/pip install setuptools
./venv/bin/python setup.py 
./venv/bin/python setup.py --help
./venv/bin/python setup.py build
./venv/bin/python setup.py install
cd ..
ls
mkdir python-proton
mv python-proton-* python-proton/.
ls
cd python-proton/
ls
mv python-proton-core/venv .
ls
source venv/bin/activate
python python-proton-keyring-linux/setup.py build
pip install setuptools
deactivate 
./venv/bin/python python-proton-keyring-linux/setup.py build
./venv/bin/python python-proton-keyring-linux/setup.py install
ls
ls proton_keyring_linux.egg-info/
cd bsc/thesis/greendrag/
ls
git sta
git status 
git add .
git commit -m "WIP"
git push
sudo nano /opt/discord/resources/build_info.json 
cd bsc/thesis/
ls
cd experiments/
ls
opt --passes dce --debug-entry-values -S tryme_inst.ll -o tryme_inst_adce.ll
opt --passes dce --debug-entry-values -S tryme_inst.ll
opt --passes dce --debug-entry-values -S tryme.ll
opt --passes dce --enable-debugify -S tryme.ll
opt --passes dce -debug-pass=Arguments -S tryme.ll
opt --passes dce -debug-pass-manager=Arguments -S tryme.ll
man opt 
sudo pacman -S man
man opt 
opt --passes dce -debug=Arguments -S tryme.ll
opt --passes dce -meabi=Arguments -S tryme.ll
man opt
man opt 
opt --passes dce -stats -S tryme.ll
opt -enable-new-pm -instcombine -S tryme.ll 
opt --enable-new-pm -instcombine -S tryme.ll 
opt --passes dce -debug-pass-manager -S tryme.ll -o /dev/null 
opt --passes instcombine,dce -debug-pass-manager -S tryme.ll -o /dev/null 
opt --passes instcombine,DCE -debug-pass-manager -S tryme.ll -o /dev/null 
opt --passes instcombine,dce -debug-pass-manager -S tryme.ll -o /dev/null 
opt --print-passes
opt --passes aa,instcombine,dce -debug-pass-manager -S tryme.ll -o /dev/null 
opt --passes memdep,instcombine,dce -debug-pass-manager -S tryme.ll -o /dev/null 
opt --passes aa-eval,instcombine,dce -debug-pass-manager -S tryme.ll -o /dev/null 
curl -L https://raw.githubusercontent.com/Doc0x1/Discord-Auto-Updater-For-Linux/master/setup_discord_update.sh -o setup_discord_update.sh
chmod +x setup_discord_update.sh
sudo ./setup_discord_update.sh
cd
cd source/
ls
mkdir discord-autoupdater
cd discord-autoupdater/
curl -L https://raw.githubusercontent.com/Doc0x1/Discord-Auto-Updater-For-Linux/master/setup_discord_update.sh -o setup_discord_update.sh
chmod +x setup_discord_update.sh
sudo ./setup_discord_update.sh
sudo pacman -S jq
sudo ./setup_discord_update.sh
discord 
nano setup_discord_update.sh 
cd source/
./downloads/jetbrains-toolbox-3.0.1.59888/bin/jetbrains-toolbox 
cd
./downloads/jetbrains-toolbox-3.0.1.59888/bin/jetbrains-toolbox 
cd source/
ls
tar -xvjf Zotero-7.0.27_linux-x86_64.tar.bz2 
cd Zotero_linux-x86_64/
ls
cd ..
ls
rm -fr Zotero*
ls
git clone https://aur.archlinux.org/paru.git
cd paru/
makepkg -si
paru -S zotero-beta-bin 
cat /tmp/CambridgeCore_Citation_05Nov2025.txt 
journalctl 
htop
sudo pacman -S htop
htop
nmcli
nmcli c down APT402G2. 
nmcli c up APT402G2. 
cd source/
git clone https://github.com/oskarsh/Yin-Yang.git
cd Yin-Yang
# Installs Yin-Yang
./scripts/install.sh
paru -S yin-yang-git 
paru -Syy yin-yang-git 
yin_yang
paru -R yin-yang-git 
mkdir bsc/db2
cd bsc/db2/
git clone git@github.com:alfeu23/T-BD2.git
mv T-BD2/ T
git add arch.mmd 
git commit -m "add: architecture of the design in Mermaid"
git push
git add .
git commit --amend --no-edit 
git push -f
ls search/
flameshot --help
flameshot gui
killall flameshot 
nano .config/hypr/hyprland.conf 
killall flameshot 
ls pictures/
firefox pictures/2025-11-10_00-34.png
killall flameshot 
mv downloads/formulario-validacao-anthon_assinado.pdf documents/.
cd documents/
ls
mv certificado-de-frequência-ITALIANO.pdf historico-escolar-ITALIANO.pdf
mv certificado-de-frequência.pdf historico-escolar.pdf
ls
sudo pacman -S proton-vpn-gtk-app 
cat pictures/ai-present/citations.bib 
cd downloads/
ls
mv AI_Article-1.pdf arvores-decisao_artigo.pdf
mv AI_Presentation.pdf arvores-decisao_apresentacao.pdf
firefox arvores-decisao_artigo.pdf 
firefox arvores-decisao_apresentacao.pdf 
sudo pacman -S telegram-desktop 
Telegram 
sudo pacman -S protobuf
Telegram 
python -m venv venv
./venv/bin/activcate
ls venv/bin/
./venv/bin/activate
chmod +x venv/bin/activate
./venv/bin/activate
source venv/bin/activate
pip install numpy matplotlib seaborn scikit-learn tensorflow h5py pillow
python main.py 
pip install keras-tuner
python main.py 
pip install 'tensorflow[and-cuda]'
source venv/bin/activate
python main.py 
source venv/bin/activate
python main.py 
nvidia-smi 
sudo pacman -S imv
sudo pacman -Syy imv
cd bsc/ai/cat-not-cat/
ls
imv plots/training_history_rede_rasa.png 
sudo pacman -S icu
sudo pacman -S lib32-icu 
imv plots/training_history_rede_rasa.png 
sudo pacman -Syu
imv plots/training_history_rede_rasa.png 
nvidia-smi 
cd bsc/ai/
l;s
ls
cd cat-not-cat/
ls
python main.py 
source venv/bin/activate
python main.py 
cd bsc/ai/cat-not-cat/
ls
nano params.py 
cd bsc/ai/cat-not-cat/
imv plots/training_history_cnn.png 
cd bsc/ai/cat-not-cat/
feh plots/confusion_matrix_cnn.png 
cd bsc/ai/cat-not-cat/
feh plots/training_history_cnn.png 
cd bsc/ai/cat-not-cat/
imv plots/training_history_cnn.png 
sudo pacman -R vimiv 
sudo pacman -S mvi
sudo pacman -S feh
cd bsc/ai/cat-not-cat/
feh plots/training_history_cnn.png 
sudo pacman -S 
sudo pacman -R imv
cd bsc/ai/cat-not-cat/
vimiv plots/training_history_cnn.png 
nvidia-smi 
mv /tmp/AI_deliverable_5.pdf bsc/ai/cat-not-cat/relatorio.pdf
cd bsc/ai/cat-not-cat/
ls
source venv/bin/activate
python main.py 
pip freeze
pip freeze > requirements.txt
ls venv/bin/
ls
rm -fr __pycache__/ report.txt best_cnn_model.h5 
cd bsc/ai/cat-not-cat/
source venv/bin/activate
nano params.py 
nano main.py 
nano params.py 
nano main.py 
nano params.py 
nano main.py 
nano params.py 
nano main.py 
nano params.py 
nano main.py 
nano params.py 
nano 
ls
mv report bsc/ai/cat-not-cat/
cd bsc/ai/cat-not-cat/
rm -fr keras_tuner_dir/
ls
mv report report.txt
source venv/bin/activate
python --v
python -V
nano README.md
ls
zip -r anthon-gato-n-gato.zip . -x "venv/*"
sudo pacman -S zip
zip -r anthon-gato-n-gato.zip . -x "venv/*"
ls
rm anthon-gato-n-gato.zip 
cd ..
mv cat-not-cat/ anthon-gato-n-gato
ls
zip -r anthon-gato-n-gato.zip anthon-gato-n-gato/ -x "anthon-gato-n-gato/venv/*"
ls
mv anthon-gato-n-gato cat-n-cat
ls
unzip anthon-gato-n-gato.zip 
sudo pacman -S unzip
unzip anthon-gato-n-gato.zip 
ls
ls anthon-gato-n-gato
rm -fr anthon-gato-n-gato
ls
unzip anthon-gato-n-gato.zip 
rm -fr anthon-gato-n-gato
cat /tmp/citations.bib 
sudo nano /opt/discord/resources/build_info.json 
paru -S protonup-qt
protonup-qt 
htop
nmcli c down APT402G2.
nmcli c up APT402G2. 
htop
paru -S qtcreator
nano 1
nano 1.py
sudo pacman -S python-scipy 
python 1.py
nano 1.1.py
python 1.1.py 
nano 1.3.py
python 1.3.py 
nano 1.3.py
python 1.3.py 
nano 1.3.py
python 1.3.py 
nano 1.3.py
python 1.3.py 
nano 1.3.py
cd bsc/modsim/
ls
cd genesys/
ls
cd docker/
ls
make run_qt
LIBGL_ALWAYS_SOFTWARE=1 __GLX_VENDOR_LIBRARY_NAME=mesa VK_DRIVER_FILES=/usr/share/vulkan/icd.d/lvp_icd.i686.json:/usr/share/vulkan/icd.d/lvp_icd.x86_64.json make run_qt
make run_gui
nano scripts/qt.sh 
make run_qt
nano scripts/qt.sh 
make run_qt
nano scripts/qt.sh 
make run_qt
nano scripts/qt.sh 
make run_qt
nano scripts/qt.sh 
make run_qt
nano scripts/qt.sh 
make run_qt
nano scripts/qt.sh 
nano scripts/env.sh 
export MESA_LOADER_DRIVER_OVERRIDE=llvmpipe make run_qt

make run_qt
nano scripts/env.sh 
nano scripts/qt.sh 

nano scripts/qt.sh 
cat scripts/qt.sh 
nano scripts/qt.sh 
make run_qt
nano scripts/build.sh 
nano Dockerfile 
bash scripts/build.sh 
nano Dockerfile 
bash scripts/build.sh 
make run_qt
cd bsc/modsim/
git clone git@github.com:anthongretter/genesys.git
cd
cd bsc/modsim/
ls
cd genesys/
ls
cd doc
cd docker/
ls
sudo pacman -S docker
sudo pacman -S devtools
make run_shell
sudo ls /var/run/docker
sudo ls /var/run/
make selector 
nano Makefile 
ls /home/
ls 
ls ..
nano Makefile 
ls scripts/qt.sh 
nano scripts/qt.sh 
make selector 
nano scripts/build.sh 
nano Dockerfile 
bash scripts/build.sh 
bash scripts/qt.sh 
sudo pacman -S xhost
sudo pacman -Ss\ xhost
sudo pacman -Ss xhost
sudo pacman -Ss xorg-xhost
sudo pacman -S xorg-xhost
bash scripts/qt.sh 
sudo pacman -Ss zink
docker run -d genesys-image:latest 

ls
docker ps
bash scripts/shell.sh 
nano scripts/shell.sh 
bash scripts/shell.sh 
docker ps
docker image
docker image inspect genesys-image:latest 
bash scripts/shell.sh 
docker run -it genesys-image:latest bash
source scripts/env.sh 
docker run --name genesys --rm -ti --net=host --ipc=host     -e DISPLAY=$DISPLAY     -e MESA_LOADER_DRIVER_OVERRIDE=$MESA_LOADER_DRIVER_OVERRIDE     -e QT_X11_NO_MITSHM=1     -e XDG_RUNTIME_DIR=/run/user/1001     -v /tmp/.X11-unix:/tmp/.X11-unix     $GENESYS_IMAGE shell
docker run -it genesys-image:latest bash << "echo a"







;

docker run -it genesys-image:latest bash < "echo a"
docker run -it genesys-image:latest bash << "echo a"
;
asd

docker run -it genesys-image:latest bash
nano Dockerfile 
nano scripts/entrypoint.sh 
bash scripts/debug.sh 
docker ps
ls
nano scripts/debug.sh 
make run_debug 
nano scripts/debug.sh 
make run_debug 
cd bsc/modsim/
ls
cd genesys/
ls
cd docker/
nano Dockerfile 
nano scripts/qt.sh 
nano scripts/env.sh 
sudo pacman -S vulkan-intel 
sudo pacman -S nvidia-utils 
vulkaninfo 
sudo pacman -S nvidia-container-toolkit
sudo nvidia-ctk runtime configure --runtime=docker
sudo systemctl restart docker
docker info | grep -A3 Runtimes
ls
nano README.md 
nano scripts/shell.sh 
make run_shell 
nano scripts/shell.sh 
nano scripts/entrypoint.sh 
firefox /tmp/INE5432-07208\ \(20252\)_\ Exercício\ 4.1\ -\ Fragmentação\,\ processamento\ de\ consultas\ e\ atualizaçãoes\ em\ BDD\ \(adaptado\ de\ Elmasri\ \&\ Navathe\,\ 6a\ edição\,\ exercício\ 25.28\)\ _\ Moodle\ UFSC\ -\ Presencial.pdf 
firefo /tmp/INE5432-07208\ \(20252\)_\ Exercício\ 4.2\ -\ Fragmentação\,\ processamento\ de\ consultas\ e\ atualizaçãoes\ em\ BDD\ \(adaptado\ de\ Elmasri\ \&\ Navathe\,\ 6a\ edição\,\ exercício\ 25.29\)\ _\ Moodle\ UFSC\ -\ Presencial.pdf 
firefox /tmp/INE5432-07208\ \(20252\)_\ Exercício\ 4.2\ -\ Fragmentação\,\ processamento\ de\ consultas\ e\ atualizaçãoes\ em\ BDD\ \(adaptado\ de\ Elmasri\ \&\ Navathe\,\ 6a\ edição\,\ exercício\ 25.29\)\ _\ Moodle\ UFSC\ -\ Presencial.pdf 
sudo nano /opt/discord/resources/build_info.json 
sudo pacman -Syu cosmic
reboot 
paru -S gnome-shell-extension-pop-shell-git 
nvidia-smi 
ls
sudo pacman -R cosmic
sudo pacman -R $(pacman -Qdtq)
nano .config/waybar/config
killall waybar 
nvidia-smi
tmux
killall waybar 
waybar 
paru -S ttf-jetbrains-mono ttf-material-design-icons-webfont capitaine-cursors
paru -S wireplumber pipewire-jack pipewire-pulse
paru -S pipewire-jack
paru -S imv wl-clipboard wget tmux brightnessctl grim slurp mpd mpc kpcli
paru -S kpcli
paru -S kpcli --editmenu
man paru
paru -S kpcli --
paru --diffmenu -S kpcli
paru -S kpcli --fm nano
paru -S kpcli --fm nvim
paru -G kpcli
ls
cd kpcli/
ls
nano PKGBUILD 
makepkg -si 
nano PKGBUILD 
cd ..
rm -fr kpcli/
paru -G kpcli
nano kpcli/PKGBUILD 
makepkg -si 
cd kpcli/
makepkg -si 
ls
cd source/paru/
ls
cd bsc
ls
cd
cd source/paru/
ls
cd source/paru/
ls
cd source/paru/
ls
cd source/paru/
ls
cd source/paru/
ls
cd source/paru/
ls
nano .config/kitty/kitty.conf
nmcli
cd .config/waybar/
nano config.old 
sudo pacman -S alacritty 
cd .config/waybar/
ls
mv config config.old
mv style.css style.css.old
rm *bak *save
ls
nano config
nano style.css
nano config
killall waybar 
ls
killall waybar 
killall waybar 
waybar 
cd .config/waybar/
nano config
killall waybar 
waybar 
nano .config/waybar/config.old 
killall wpaperd 
ls
nano 1.1.py 
rm *.py 
feh wpp.png 
ls pictures/
killall wpaperd 
wpaperd -
wpaperd
hyprpaper 
killall wpaperd 
killall hyprpaper 
nano .config/hypr/hyprland.conf 
sha256sum /tmp/README.txt 
nano .bashrc 
nano .config/hypr/hyprpaper.conf 
nano .config/hypr/hyprland.conf 
systemctl enable --now mpd.service 
nano .config/waybar/config
killall waybar 
mpd 
systemctl disable mpd.service 
systemctl stop mpd.service 
systemctl enable --now --user mpd.service 
systemctl enable --now mpd.service 
playerctl --version
playerctl --help
nano .config/waybar/config
mv /tmp/AI_Presentation.pdf arvores-decisao_apresentacao.pdf
firefox arvores-decisao_apresentacao.pdf 
nmcli
nmcli connection down APT402G2. 
nmcli
nmcli connection up APT402G2. 
cd bsc/modsim/
https://github.com/stephankruggg/Genesys-Simulator.git genesys-s
git clone https://github.com/stephankruggg/Genesys-Simulator.git genesys-s
ls
cd bsc/modsim/genesys/
ls
cd docker/
ls
make run_debug 
cd bsc/modsim/genesys/
ls
cd docker/
ls
make run_
systemctl start docker.service 
make run_qt
cd bsc/modsim/
ls
cd genesys/
ls
make run_qt
cd docker/
make run_qt
cd bsc/modsim/genesys/
ls
git sta
git status
nano source/plugins/data/CppCompiler.h
git diff source/plugins/data/CppCompiler.h
nano source/plugins/data/CppCompiler.h
git diff source/plugins/data/CppCompiler.h 
git diff source/plugins/data/CppCompiler.h source/plugins/components/CppForG.cpp
git restore source/plugins/components/CppForG.cpp
git nano source/plugins/components/CppForG.cpp
nano source/plugins/components/CppForG.cpp
git diff source/plugins/data/CppCompiler.h source/plugins/components/CppForG.cpp
git diff source/applications/terminal/examples/smarts/Smart_CppForG.cpp
nano source/applications/terminal/examples/smarts/Smart_CppForG.cpp
git diff source/applications/terminal/examples/smarts/Smart_CppForG.cpp source/plugins/data/CppCompiler.h source/plugins/components/CppForG.cpp
git diff source/applications/terminal/examples/smarts/Smart_CppForG.cpp source/plugins/data/CppCompiler.h source/plugins/components/CppForG.cpp > fix.patch
ls
rm source/applications/gui/qt/GenesysQtGUI/GenesysQtGUI.pro.user*
nano source/applications/gui/qt/GenesysQtGUI/GenesysQtGUI.pro
nano source/applications/gui/qt/GenesysQtGUI/GenesysQtGUI.pro.user
git restore source/applications/gui/qt/GenesysQtGUI/GenesysQtGUI.pro.user
git diff source/applications/gui/qt/GenesysQtGUI/mainwindow_controller.cpp
git restore source/applications/gui/qt/GenesysQtGUI/mainwindow_controller.cpp
git diff source/plugins/components/network/DefaultNode.h
git restore source/plugins/components/network/DefaultNode.h
cat fix.patch 
git diff source/applications/terminal/examples/smarts/Smart_CppForG.cpp source/plugins/data/CppCompiler.h source/plugins/components/CppForG.cpp source/applications/gui/qt/GenesysQtGUI/GenesysQtGUI.pro > fix.patch
nano fix.patch 
git add source/applications/gui/qt/GenesysQtGUI/build/Desktop-Debug/
sudo git add source/applications/gui/qt/GenesysQtGUI/build/Desktop-Debug/
touch source/applications/gui/qt/GenesysQtGUI/build/Desktop-Debug/.gitkeep
sudo touch source/applications/gui/qt/GenesysQtGUI/build/Desktop-Debug/.gitkeep
sudo git add source/applications/gui/qt/GenesysQtGUI/build/Desktop-Debug/.gitkeep
git diff
git diff > runnable.patch
ls
sudo git add source/applications/gui/qt/GenesysQtGUI/build/Desktop-Debug/autoloadplugins.txt
git diff > runnable.patch
cd ..
git clone git@github.com:anthongretter/genesys.git genesys-test
cd genesys-test/
git apply ../genesys/fix.patch
nano source/applications/gui/qt/GenesysQtGUI/GenesysQtGUI.pro
git status
nano ../genesys/fix.patch
git apply ../genesys/fix.patch
cd ..
cdc genesys
cd genesys
git diff 
git diff source/applications/terminal/examples/smarts/Smart_CppForG.cpp source/plugins/data/CppCompiler.h source/plugins/components/CppForG.cpp source/applications/gui/qt/GenesysQtGUI/GenesysQtGUI.pro > fix.patch
cd ..
cd genesys-test/
git apply ../genesys/fix.patch
git status 
git restore .
git status 
git apply ../genesys/runnable.patch
ls
cd docker/
make run_qt
docker ps

make run_qt
nano ../../genesys/runnable.patch 
nano Dockerfile 
git status 
docker image prune debian:latest
docker image prune --help
docker image rm genesys-image:latest 
docker container stop genesys-debug 
docker image rm genesys-image:latest 
make run_qt
ls ./scripts/
./scripts/build.sh
chmod +x ./scripts/build.sh
./scripts/build.sh
nano Dockerfile 
./scripts/build.sh
nano Dockerfile 
./scripts/build.sh
make run_qt
git status 
cp Dockerfile ../../genesys/docker/Dockerfile
cd
cd bsc/modsim/genesys
ls
git status 
git diff source/applications/gui/qt/GenesysQtGUI/GenesysQtGUI.pro.user
git restore source/applications/gui/qt/GenesysQtGUI/GenesysQtGUI.pro.user
git diff > runnable.patch
ls
git diff docker/Dockerfile
nano README.md
zeditor README.md 
firefox README.md
make run_qt
cd docker/
make run_qt
cd bsc/modsim/genesys/
git status 
nano source/applications/gui/qt/GenesysQtGUI/GenesysQtGUI.pro
git diff
git diff source/applications/gui/qt/GenesysQtGUI/GenesysQtGUI.pro
ls
ls temp/
cat temp/test
git status 
cat source/applications/terminal/examples/main.cpp 
rm source/applications/terminal/examples/main.cpp 
git status 
git status
git status 
git status | head
git status | tail
git status 
git status | head
git restore --staged source/applications/gui/qt/GenesysQtGUI/build/Desktop-Debug/
git status
git restore --staged source/applications/gui/qt/GenesysQtGUI/build/Desktop-Debug/.gitkeep
git status 
cat source/applications/terminal/examples/smarts/Smart_CppForG.cpp
nm --help
cd bsc/modsim/genesys
ls
git add fix.patch README.md runnable.patch 
sudo git add fix.patch README.md runnable.patch 
sudo sudo git add fix.patch README.md runnable.patch 
chown anthon:anthon -R .
sudo chown anthon:anthon -R .
sudo sudo git add fix.patch README.md runnable.patch 
sudo git add fix.patch README.md runnable.patch 
git commit -m "Adiciona patches criados e README"
git push 
git add README.md 
git commit --amend --no-edit 
git push
git push -f
flameshot gui
cd bsc/modsim/genesys
git pull
sudo nano /opt/discord/resources/build_info.json 
opt -p "simplifycfg" -print-pipeline-passes
opt -p "simplifycfg" -print-pipeline-passes -S /dev/null
opt -p "loop-unroll" -print-pipeline-passes -S /dev/null
opt -p "gvn" -print-pipeline-passes -S /dev/null
opt -O3 -print-pipeline-passes -S /dev/null
opt -O3 -print-pipeline-passes -S /dev/null | grep gvn
opt --version
opt --legacy
man opt
opt --help
opt --help | grep legacy
opt --bugpoint-enable-legacy-pm 
cd source/
ls
rm -fr Yin-Yang/
ls
htop
sudo pacman -S gephi 
gephi 
cd source/
unzip llvm-20.1.8.zip 
cd llvm-project-llvmorg-20.1.8/
ls
nano README.md 
cd cmake/
ls
nano README.rst 
cd ..
ls
cd llvm
ls
nano README.txt 
ls
cd ..
mkdir build
cd build/
cmake
sudo pacman -S cmake
cmake ../
cmake ../llvm/
cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo -DLLVM_FORCE_ENABLE_STATS ../llvm/
cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo -DLLVM_FORCE_ENABLE_STATS=On ../llvm/
cmake --build .
opt --version
ls 
ls bin/
./bin/opt --version
./bin/opt --print-passes
paru -S jetbrains-toolbox
killall steam discord
killall steam
python
sudo pacman -S telegram-desktop 
which Telegram 
ln -sf /usr/sbin/Telegram /usr/sbin/telegram
sudo ln -sf /usr/sbin/Telegram /usr/sbin/telegram
cd bsc/
ls
firefox ls
ls
unzipls
ls
./build/bin/opt --version
./../build/bin/opt --version
ls ../
cd lib/Transforms/
find . -type f -name "*Pass.cpp"
cd ..
find . -type f -name "*Pass.cpp"
git tag 
killall discord 
killall Discord 
discord 
killall Discord 
killall steam
nano .config/waybar/config
killall waybar\
killall waybar
nano .config/waybar/config
nmcli
nano .config/waybar/style.css
zeditor .config/waybar/
killall waybar 
ls
rm arvores-decisao_apresentacao.pdf ms5-tentaiva-corrigida.pdf 
rm -fr Zomboid/ kpcli/
killall steam
killall waybar 
nano .config/kitty/kitty.conf
sudo pacman -R alacritty 
sudo pacman -R $(pacman -Qdtq)
sudo pacman -Syyu
feh wpp.png 
rm wpp.png 
feh .config/wpp.jpg 
feh .config/wpp2.jpg 
feh pictures/wpp.jpg 
cd .files/
ls -a
mv .* garda/.
ls
mv garda/.git/ .
ls
mkdir -p fern/config
ls fern/config/
ls garda/
ls -a garda/
ls -a fern/
git add .
git commit -m "add: create fern variant"
git push
cd .files/
ls
ls -a
git branch
mkdir garda
mv * garda/.
ls
mkdir fern
ls garda/config/
cp -R ~/.config/hypr ~/.config/kitty ~/.config/user-dirs.dirs ~/.config/waybar ~/.config/wofi/ ~/.config/wpaperd/ ~/pictures/wpp.jpg ~/.config/zed fern/config/.
cd
cp .bash_history .bashrc .nanorc .files/fern/.
mkdir opensource
cd opensource/
git clone git@github.com:anthongretter/zed.git
ls
pactl set-sink-mute @DEFAULT_SINK@ false
sudo pacman -S pavucontrol
sudo pacman -Syy pavucontrol
pavucontrol 
aplay -l
arecord -l
pacmd list-cards
pacmd list-sinks
pacmd list-sources
sudo pacman -S alsa-utils 
aplay -l
arecord -l
systemctl --user restart pulseaudio
systemctl restart pulseaudio
sudo pacman -S sof-firmware 
sudo pacman -Syyu
sudo pacman -Sy archlinux-keyring
sudo pacman -Syu
nano .config/hypr/hyprland.conf 
paru -Syu
pacman 
pacman -Q
cd source/
ls
cd paru/
ls
git pull
makepkg -si
paru -Syyu
hyprpaper 
killall hyprpaper 
hyprpaper 
ls
ls -a
feh pictures/nice.png 
feh pictures/2025-11-10_00-34.png 
feh pictures/wpp.jpg 
nano .config/hypr/hyprpaper.conf 
ls
cd .files
ls
git pull
nano fern/.config/hypr/hyprpaper.conf 
wpaperd
wpaperctl 
wpaperctl get-wallpaper 
wpaperctl get-wallpaper HDMI-0
wpaperctl get-wallpaper HDMI-1
wpaperctl get-wallpaper HDMI
wpaperctl get-wallpaper 1
wpaperctl get-wallpaper 0
wpaperctl get-wallpaper -h
wpaperctl get
wpaperctl reload
hyprpaper 
hyprland-run 
start-hyprland 
killall wpaperd 
hyprpaper 
nano .config/hypr/hyprpaper.conf 
nano .config/hypr/hyprland.conf 
cd .files/
ls
nano Makefile 
ls fern/
hostnamectl hostname 
hostnamectl status 
sudo hostnamectl set-hostname fern
reboot
resreload 
nano /usr/include/hyprland/src/helpers/Splashes.hpp
nano .config/hypr/hyprland.conf 
hyprctl reload 
nano .config/hypr/hyprland.conf 
pavucontrol 
find . -name "DarkSoulsII"
cd ./.local/share/Steam/steamapps/compatdata/335300/pfx/drive_c/users/steamuser/AppData/Roaming/DarkSoulsII
ls
cd 0110000109b8a0ac/
ls
rm DS2SOFS0000.sl2 
cp ~/DS2SOFS0000.sl2 .
systemctl --user status pulseaudio
systemctl --user start pulseaudio
systemctl --user start pipewire
pavucontrol 
pipewire-pulse 
pipewire
systemctl status pipewire
systemctl --user status pipewire
systemctl --user status pipewire-puse
systemctl --user status pipewire-pulse
spotify-launcher 
spotify-launcher -h
spotify-launcher
nmcli
nmcli device wifi connect APT402G2. 
nmcli
alsamixer 
pavucontrol 
sudo pacman -S helvum 
sudo pacman -R helvum 
sudo pacman -S pwvucontrol
paru -S pwvucontrol
paru -Syy pwvucontrol
paru -S wiremix
wiremix 
alsamixer 
cd source/
ls
killall spotify
sudo pacman -S spotify
paru -S spotify
spotify-launcher 
spotify-launcher --verbose
spotify
spotify-launcher --help
spotify-launcher youtube.com
man spotify-launcher
paru -S spotify
paru -R spotify-launcher 
spotify --verbose
spotify 
rm -fr .cache/spotify/
nmcli 
nmcli device wifi connect APT402G2. 
nmcli device wifi rescan 
nmcli device wifi connect APT402G2. 
nmcli device wifi list 
nmcli device wifi connect APT402G2. 
sudo nano /opt/discord/resources/build_info.json 
alsamixer 
nmcli device wifi rescan 
nmcli device wifi list 
alsamixer 
nmcli 
nmcli device wifi connect APT402G2. 
journalctl 
nmcli
cd opensource/
git clone https://github.com/lwfinger/rtl8192ee.git
cd rtl8192ee/
ls
make all
sudo pacman -S linux-headers 
sudo pacman -S linux-firmware
sudo pacman -S bc
sudo pacman -S linux-firmware-realtek 
make all -j8
find . -name "drv_types.h" 
nano Makefile 
ls
ls core/
nano Makefile 
ls
nano Kconfig 
nano Makefile 
make all -j8
nano Makefile 
git status 
git submodule update --init --recursive 
cat Kbuild | grep "\-I"
cat Kconfig | grep "\-I"
nano Kconfig 
ls
nano Makefile 
make all -j8 EXTRA_CFLAGS += -I$(src)/include
make all -j8 EXTRA_CFLAGS+=-I$$(src)/include
make all -j8 EXTRA_CFLAGS += -I$$(src)/include
make all -j8 EXTRA_CFLAGS += -I./include
make all -j8 EXTRA_CFLAGS+=-I./include
ls include/
nmcli
ip link show
sudo pacman -S ethtool
ethtool -i wlp3s0 
iw phy
lspci -k | grep -A3 -i "network\|wireless\|wifi"
cat /etc/modprobe.d/50-blacklist.conf
cat /etc/modprobe.d/nvidia_drm.conf 
modinfo $(ethtool -i wlan0 | awk '/driver/{print $2}') | grep filename
modinfo $(ethtool -i wlp3s0 | awk '/driver/{print $2}') | grep filename
pacman -Qo $(modinfo $(ethtool -i wlan0 | awk '/driver/{print $2}') | awk '/filename/{print $2}')
pacman -Qo $(modinfo $(ethtool -i wlp3s0 | awk '/driver/{print $2}') | awk '/filename/{print $2}')
paru -Ss rtl8192ee
paru -Ss 8192ee
paru -Ss etl8
paru -Ss rtl8
paru -Ss rtl81
paru -Ss rtl8192
nmcli
pacman -Ql linux-firmware | grep rtl8192ee
pacman -Ql linux-firmware
pacman -Qo linux-firmware
pacman -Q linux-firmware
pacman -Q; linux-firmware
pacman -Ql linux-firmware
make all V=1
sudo nano /boot/grub/grub.cfg 
sudo nano /etc/default/grub 
cd opensource/
ls
mv rtl8192ee/ ../source/.
cc
cd ..
cd source/
cd rtl8192ee/
ls
make -j8
nano core/rtw_mlme.c 
nano Makefile 
make -j8
nano Makefile 
make -j8
sudo pacman -S dkms
sudo dkms build 8192ee/1.1
sudo make all -j8
ls -l 
ls -l include/
cd projects/
git clone git@github.com:anthongretter/bMb.git
cd bMb/
ls
make emulation 
cd bsc/
ls
cd thesis/
ls
git pull
find . -name "DarkSoulsIII"
find .local/ -name "DarkSoulsIII"
cd .local/share/Steam/steamapps/compatdata/374320/pfx/drive_c/users/steamuser/AppData/Roaming/DarkSoulsIII
ls
cd 0110000109b8a0ac/
ls
mv ~/DS30000.sl2 .
cd .local/share/Steam/steamapps/common/DARK\ SOULS\ III/
ls
cd Game/
ls
mv /tmp/SeamlessCoop .
mv /tmp/ds3sc_launcher.exe .
ls
cd
cd /tmp/
unzip DS3\ Seamless\ Co-op\ v0.1.1-1895-0-1-1-1741470313.zip 
find .local/ -name "DarkSoulsIII"
cd .local/share/Steam/steamapps/compatdata/374320/pfx/drive_c/users/steamuser/AppData/Roaming/DarkSoulsIII
ls
cd 0110000109b8a0ac/
ls
rm DS30000.sl2 
mv /tmp/DS30000.sl2 .
cd ..
ls
cd ..
find .local/ -name "DarkSoulsIII"
cd
find .local/ -name "DarkSoulsIII"
nano .local/share/Steam/steamapps/common/DARK\ SOULS\ III/Game/SeamlessCoop/ds3sc_settings.ini 
find .local/ -name "DarkSoulsIII"
cd .local/share/Steam/steamapps/compatdata/2353199155/pfx/drive_c/users/steamuser/AppData/Roaming/DarkSoulsIII
ls
cd 0110000109b8a0ac/
ls
rm DS30000.co2 
mv ~/DS30000.co2 .
paru -S discrod-screenaudio
paru -S discord-screenaudio
sudo nano /opt/discord/resources/build_info.json 
nmcli
cd projects/
git clone git@github.com:anthongretter/bMb.git
cd bMb/
git pull
paru -Ss todoist
paru -Ss todoist-rs-git
paru -S todoist-rs-git
todoist 
todoist 
nano .config/.todoist/config.json 
todoist 
paru -R todoist-rs-git 
nano .config/.todoist/config.json 
rm -fr .config/.todoist/
ls .config/.
paru -Ss todoist 
paru -S todoist-appimage 
paru -S proton- 
paru -Ss proton- 
nmcli dev wifi rescan 
nmcli dev wifi connect APT402G2. 
nmcli dev wifi list 
nmcli device down wlp3s0 
nmcli device up wlp3s0 
nmcli
nmcli device wifi connect APT402G2. 
nmcli
nmcli connection delete APT402G2. 
nmcli device wifi connect APT402G2. --ask
nmcli device wifi connect APT402G2. 
nmcli device wifi connect bruh 
nmcli device wifi connect bruh --ask
nmcli device wifi connect APT402G2. 
nmcli connection delete APT402G2. 
nmcli dev wifi connect APT402G2. --ask
reboot
sudo pacman -S xdg-desktop-portal
sudo pacman -S xdg-desktop-portal-wlr
cd /tmp
ls
mv photo_2024-12-17_11-09-08.pdf ~/documents/id.pdf
ls documents/
cd ..
ls
cd
ls
cd downloads/
ls
firefox ../documents/id.pdf 
nmcli device wifi rescan 
sudo nano /opt/discord/resources/build_info.json 
nmcli
nmcli connection down APT402G2. 
nmcli
nmcli device wifi connect APT402G2. 
steam
killall steam
nmcli
nmcli connection down APT402G2. 
nmcli 
nmcli connection up APT402G2. 
nmcli connection up bruh 
nmcli
lspci -knn
dmesg | grep -i firmware
sudo dmesg | grep -i firmware

lspci | grep PCI
lspci -knn
lsusb
iw dev
ip link
dmesg | grep -i wifi
sudo dmesg | grep -i wifi
rfkill list
sudo rfkill list
iwlwifi
lspci | grep -i network
lspci -tv
dmesg | grep -i pci
sudo dmesg | grep -i pci
lspci | grep -i network
lspci -knn
lspci -knn | grep PCI
nmcli
lspci -knn
lsusb
nmcli
nmcli device wifi rescan 
nmcli device wifi 
nmcli device wifi rescan 
nmcli device wifi 
nmcli
[A
nmcli
nano .config/discord/settings.json 
sudo nano /opt/discord/resources/build_info.json 
sudo nano /opt/discord/resources/build_info.json \
sudo nano /opt/discord/resources/build_info.json
nmcli dev wifi connect APT402G2. 
nmcli dev wifi connect res
nmcli dev wifi rescan 
nmcli dev wifi 
nmcli dev wifi connect APT402G2. 
nmcli dev wifi rescan 
nmcli dev wifi 
nmcli dev wifi rescan 
nmcli dev wifi 
nmcli
nmcli dev wifi 
zotero --version
sudo pacman -S clasp
sudo pacman -Ss clasp
paru -Ss clasp
paru -Ss nodejs-google-clasp
paru -S nodejs-google-clasp
npm install -g @google/clasp
sudo npm install -g @google/clasp
clasp -h
clasp login
cd projects/
ls
mkdir docsgit
cd docsgit/
ls
clasp create --type docs --title "Docs as Git"
ls
nano appsscript.json 
clasp push
ls Zotero/
nmcli
zotero --help
nano .zotero/zotero/profiles.ini 
nano .zotero/zotero/9o5g9m2a.default/prefs.js 
nano .zotero/zotero/9o5g9m2a.default/session
nano .zotero/zotero/9o5g9m2a.default/session.json 
nano .zotero/zotero/9o5g9m2a.default/prefs.js 
nano .zotero/zotero/9o5g9m2a.default/retractions.json 
nano .zotero/zotero/9o5g9m2a.default/treePrefs.json 
nano .zotero/zotero/9o5g9m2a.default/extensions.json 
nano .zotero/zotero/9o5g9m2a.default/compatibility.ini 
nano .zotero/zotero/9o5g9m2a.default/times.json 
nmcli device wifi rescan 
nmcli device wifi connect bruh 
nmcli dev wifi rescan 
nmcli dev wifi connect bruh 
rm -fr .cache/mozilla/
alsamixer 
feh pictures/*
alsamixer 
nmcli
nmcli dev wifi rescan q
nmcli dev wifi rescan 
nmcli dev wifi
nmcli dev wifi rescan 
nmcli dev wifi
nmcli dev wifi rescan 
nmcli dev wifi
watch `nmcli dev wifi`
watch nmcli dev wifi
alsamixer 
alsamixer
alsamixer 
cd /lib/modules/6.18.7-arch1-1/build/
ls
nano Makefile 
killall steam
steam
make
make clean 
ls /lib/modules
ls /lib/modules/6.18.7-arch1-1/
cd /lib/modules/6.18.7-arch1-1/build/
ls
lsd
ls
nano Kconfig 
intercept-build make
sudo intercept-build make
cat /lib/modules/6.18.7-arch1-1/build/arch/Kconfig 
sudo pacman -S bear
sudo pacman -Syy bear
nmcli
sudo pacman -S bash-completion 
sudo pacman -Syy bash-completion 
cat /tmp/Exported\ Items.bib 
paru -S anytype
anytype
anytype-bin
anytype-alpha-bin
paru -S anytype
find -h
find --help
find . -name "*anytype*" -f exec
find . -name "*anytype*" -D exec
find . -name "*anytype*" -type exec
find . -name "*anytype*" -type f -executable
find .local -name "*anytype*" -type f -executable
find .local -name "*anytype*"
find .local -name "*Anytype*"
find .local -name "*AnyType*"
find .local -name "*Any*"
find .local -name "*any*"
find .local -name "*anyty*"
find .local -name "*anytype*"
find -D help
cd bsc/
ls
cd thesis/
ls
cd experiments/
ls
cd replication/
ls
feh performance_comparison.png 
paru -S anytype 
find / -name "*anytype*"
nano /usr/share/applications/anytype.desktop 
cp /usr/share/applications/anytype.desktop desktop/. 
ls desktop/
chmod +x desktop/anytype.desktop 
ls desktop/
./desktop/anytype.desktop 
nano desktop/anytype.desktop 
/opt/Anytype/anytype --ozone-platform-hint=auto %U
sudo pacman -S linux-headers 
make clean
sudo make clean
make clean
sudo make clean
grep "^CONFIG_ARM" /lib/modules/$(uname -r)/build/.config
cat /lib/modules/$(uname -r)/build/.config
sudo nano /lib/modules/$(uname -r)/build/.config
make
sudo make
sudo nano /lib/modules/$(uname -r)/build/.config
sudo make
make

make
make
df -h
pacman -Q linux linux-headers
sudo pacman -Syyu
sudo cat /dev/hidraw1 | hexdump -C
alsamixer 
amixer -c 0 cinfo numid=10
alsamui
alsamixer 
aplay -l
alsamixer 
make clean
git add .
git status 
git add .
git restore --staged .idea/
git add .
git status 
git restore --staged .idea/*
git status 
git restore --staged .idea/
git status 
git add .
git status 
git restore --staged .idea/
git status 
git commit --amend 
git --global config core.editor nano
git config --global core.editor nano
git commit --amend 
git push -f
git remote -v
git remote set-url origin git@github.com:anthongretter/hid-driver-fuxi.git
git push -f
git status 
git rm .idea/
git rm -r .idea/
git rm -rf .idea/
git status 
git commit --amend 
git push -f
git status 
sudo pacman -S hid-tools 
sudo hid-recorder /dev/hidraw1
sudo hid-recorder --list
sudo hid-recorder --help
sudo hid-recorder 
ls .ssh/
nano .ssh/config 
rm -fr .ssh/known_hosts
nano .ssh/config 
nano .ssh/known_hosts.old 
nmcli
nmcli con down APT402G2. 
nmcli
mv /tmp/All\ in\ one\ \(all\ game\ versions\)-32444-11-1770897704.zip /tmp/Skyrim\ Together\ Reborn-69993-1-8-0-1762551509.zip /tmp/Vortex-1-1-16-7-1773764130.exe .
ls
cd ..
ls
pwd
unzip Skyrim\ Together\ Reborn-69993-1-8-0-1762551509.zip 
ls
cd SkyrimTogetherReborn
ls
cd ..
ls
rm -fr Skyrim*
ls
mv /tmp/Skyrim\ Together\ Reborn-69993-1-8-0-1762551509.zip .
ls
winecfg 
ls .local/share/Steam/
cd .local/share/Steam/
ls
cd steamapps/
ls
cd common/
ls
cd Proton\ Hotfix/
ls
cd ..
cd Skyrim\ Special\ Edition/
ls
cd ..
mkdir SSETogether
cd SSETogether/
mv ~/Skyrim\ Together\ Reborn-69993-1-8-0-1762551509.zip .
ls
unzip Skyrim\ Together\ Reborn-69993-1-8-0-1762551509.zip 
LS
ls
cd
ls
mv All\ in\ one\ \(all\ game\ versions\)-32444-11-1770897704.zip .local/share/Steam/steamapps/common/Skyrim\ Special\ Edition/Data/.
cd search/
ls
feh *
cd ..
cd pictures/
feh nice.png 
cd .local/share/Steam/
ls
cd steamapps/
ls
cd common/
ls
cd Skyrim\ Special\ Edition/
ls
mv ../SSETogether/Skyrim\ Together\ Reborn-69993-1-8-0-1762551509.zip Data/.
ls
cd Data/
ls
unzip Skyrim\ Together\ Reborn-69993-1-8-0-1762551509.zip 
ls
unzip All\ in\ one\ \(all\ game\ versions\)-32444-11-1770897704.zip 
mv SKSE/Plugins/ .
ls
ls Plugins/
ls
cd ..
ls
ln -s SkyrimSE.exe ~/desktop/.
ls ~/desktop/
sudo pacman -S protontricks 
protontricks 489830 wimecfg
protontricks 489830 winecfg
ls
cd Data/
ls
mv Plugins/ SKSE/.
paru -Ss vortex
paru -S vortex-git
paru -S vortex
protontricks 489830 
protontricks 489830 winecfg
alsamixer 
nmcli
alsamixer 
cd bsc/
ls
cd thesis/
ls
cd tools/
ls
cd
cd opensource/
ls
cd ..
cd source/
ls
cd ..
cd bsc/thesis/
ls
nano Setup.mk 
alsamixer 
cd pictures/
;s
ls
ls -a
feh *
mv /tmp/FormularioRatificacaoTCC.pdf /tmp/tcc-anthon-tcc2-rat.pdf
mv /tmp/tcc-anthon-tcc2-rat.pdf /tmp/tcc-anthon-tcc2.1-rat.pdf
alsamixer 
sudo dmesg | grep -i hid 
sudo dmesg | grep -i Fuxi 
pkg-config --cflags alsa
alsamixer 
wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+
wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
ps
ps -a
sudo dmesg | grep -i Shan 
hyprctl clients 
hyprctl clients | grep steam
hyprctl clients | grep -i steam
hyprctl clients | grep -i stellaris
upower -e
ls /sys/class/power_supply/
evtest
dmesg | grep -i battery
sudo dmesg | grep -i battery
lsusb
sudo usbhid-dump -d 040b:0897
sudo usbhid-dump -d 040b:0897 | hid-decode 
cd projects/hid-fuxi
ls
cd ..
cd hid-fuxih3/
ls
ls /dev/hidraw*
lsusb
cat /dev/hidraw0
sudo cat /dev/hidraw0
udevadm info -q all
udevadm info -q all Weltrend Semiconductor Fuxi-H3
udevadm info -q all "Weltrend Semiconductor Fuxi-H3"
udevadm info -q all "040b:0897"
udevadm info -q all 040b:0897
sudo dmesg | grep -i Fuxi 
hid-decode /dev/hidraw2
nano ~/.bash_history 
sudo cat /dev/hidraw2 | hexdump -C
nano ~/.bash_history 
sudo hid-recorder /dev/hidraw2
alsamixer 
ls
pwd
cat /tmp/Estatística.bibtex 
cat /tmp/Estatística.bibtex | wl-copy 
opt --version
cd bsc/thesis/tools/
ls
./opt --version
./opt -O3 -print-passes ../sandbox/dumpasn1.ll
cat ../sandbox/o3-passes.txt 
nano ../sandbox/o3-passes.txt 
./opt -print-passes
nano ../sandbox/o3-passes.txt 
cd source/
ls
cd llvm-project-llvmorg-20.1.8/
ls
cd
cd bsc/thesis/tools/
ls
./opt -print-pipeline -O3
./opt -O3 -print-pipeline
./opt -O3 -print-pipeline-passes
./opt -O3 -print-pipeline-passes /dev/null
cd bsc/thesis/
;s
l;s
l
cd tools/
lsl
nano ../sandbox/o3-passes-simplified.txt
alsamixer 
nmcli
nmcli dev wifi connect APT402G2. 
alsamu
alsamixer 
sudo nano /opt/discord/resources/build_info.json
alsamixer 
nmcli
alsamixer 
nmcli device wifi 
nmcli device wifi rescan 
nmcli device wifi 
nmcli
nmcli dev wifi connect APT402G2. 
systemctl restart NetworkManager
nmcli dev wifi connect APT402G2. 
nmcli con up APT402G2. 
nmcli con delete APT402G2. 
nmcli dev wifi connect APT402G2. --ask
alsamixer 
nmcli
nmcli connection down APT402G2. 
nmcli
nmcli c up APT402G2. 
nmcli
nmcli dev wifi 
nmcli dev wifi connect APT402G2. 
nmcli
sudo pacman -Ss music
paru -Ss youtube music
ls /tmp/
ls pictures/
feh pictures/*
lsblk
df -h
lsblk
df -h
sudo dmesg | grep -i SATA
sudo dmesg | grep -i sata
sudo dmesg | grep -i /dev/sda
sudo dmesg | grep -i /dev/sd
sudo dmesg | grep -i /dev/s
sudo dmesg | grep -i /dev/
lsblk
nmcli
nmcli c down APT402G2. 
feh pictures/*
alsamixer 
nmcli c down APT402G2. 
nmcli
pavucontrol 
nmcli c up APT402G2. 
alsamixer 
nmcli
nmcli c down Ap
nmcli c down APT402G2. 
alsamixer 
nmcli
nmcli c down APT402G2. 
nmcli
nmcli dev wifi connect APT402G2. 
nmcli
ls
cd .config/unity3d/IronGate/Valheim/
ls
cd worlds
ls
ls -l
chmod 777 tenis.*
ls -l
chmod +x tenis.*
ls -l
nmcli
systemctl restart logmein-hamachi.service 
hamachi lis
hamachi list
hamachi login
hamachi list
hamachi
sudo pacman -Ss hamachi
paru -Ss hamachi
paru -S logmein-hamachi
hamachi 
systemctl start logmein-hamachi.service 
hamachi 
sudo nano /var/lib/logmein-hamachi/h2-engine.cfg
sudo nano /var/lib/logmein-hamachi/h2-engine-override.cfg
systemctl restart logmein-hamachi.service 
hamachi 
hamachi --help
hamachi login
hamachi 
hamachi create "eu maam todos os leel" lulagay
hamachi 
hamachi list
alsamixer 
hamachi 
systemctl start logmein-hamachi.service 
hamachi 
hamachi list
./start_server.sh 
nmclii
nmcli
nano start_server.sh 
./start_server.sh 
nmcli c down APT402G2. 
nmcli
nmcli c up APT402G2. 
nmcli
nmcli dev wifi 
nmcli
nmcli c d APT402G2. 
nmli
nmlci
nmcli
nano .config/waybar/config.old 
nano .config/waybar/config
nano -F .config/waybar/config
nmcli
nano .config/waybar/config
killall waybar 
waybar 
nano .config/waybar/config
waybar 
killall waybar 
waybar -l debug
zeditor .config/waybar/config
killall waybar 
nmcli
killall waybar 
waybar 
nmcli c up APT402G2. 
alsamixer 
nmcli c d APT402G2. 
cd .local/share/Steam/steamapps/common/Valheim\ dedicated\ server/
ls
./start_server.sh 
nmcli c d APT402G2. 
nmcli c up APT402G2. 
nmcli c d APT402G2. 
nmcli c up APT402G2.
htop
nmcli dev wifi 
nmcli c d APT402G2. 
cd .local/share/Steam/steamapps/common/Valheim\ dedicated\ server/
./start_server.sh 
ls /tmp
ls
ls /tmp
nmcli c d APT402G2. 
nmcli c u APT402G2. 
nmcli c d APT402G2. 
cd .local/share/Steam/steamapps/common/Valheim\ dedicated\ server/
./start_server.sh 
cd .local/share/Steam/steamapps/common/Valheim\ dedicated\ server/
./start_server.sh 
alsamixer \
pwd
ls ..
ls
cd ..
ls
cd thesis/
ls
cd ..
nmcli 
nmcli c d APT402G2. 
nmcli c up APT402G2. 
nmcli
nmcli c delete APT402G2. 
nmcli 
nmcli dev wifi connect APT402G2. 
nmcli dev wifi connect APT402G2. --ask
nmcli
nmcli dev wifi 
nmcli
nmcli dev wifi connect APT402G2. 
nmcli
nmcli c d APT402G2. 
cd .local/share/Steam/steamapps/common/Valheim\ dedicated\ server/
./start_server.sh 
nmcli c d APT402G2. 
nmcli c u APT402G2. 
cd .local/share/Steam/steamapps/common/Valheim\ dedicated\ server/
./start_server.sh 
nmcli c u APT402G2. 
nmcli c d APT402G2. 
cd .local/share/Steam/steamapps/common/Valheim\ dedicated\ server/
./start_server.sh 
cd .local/share/Steam/steamapps/common/Valheim\ dedicated\ server/
ls
nano start_server.sh 
scp -h
scp tenis.db tenis.fwl admin@128.168.0.24:/home/admin/Servers/valheim/
scp tenis.db tenis.fwl admin@12892.168.0.24:/home/admin/Servers/valheim/
scp tenis.db tenis.fwl admin@192.168.0.24:/home/admin/Servers/valheim/
ls
firefox Valheim\ Dedicated\ Server\ Manual.pdf 
scp tenis.db tenis.fwl admin@192.168.0.24:/home/admin/Servers/valheim/
./start_server.sh 
scp tenis.db tenis.fwl admin@192.168.0.24:/home/admin/Servers/valheim/
ls -l
./start_server.sh 
ssh admin@192.168.0.24
ssh admin@192.168.0.24
ip addr
ls
cd .local/share/Steam/steamapps/common/Valheim\ dedicated\ server/
ls
l
ls
ls -l
cd
cd .config/unity3d/IronGate/Valheim/worlds_local/
ls
ls -l
scp tenis.db tenis.fwl admin@192.168.0.24:/home/admin/.config/unity3d/IronGate/Valheim/worlds_local/
ssh admin@192.168.0.24
sudo pacman -S pass
pass
pass init 
gpg 
gpg --full-generate-key 
pass init "anthon.png@proton.me"
pass insert vpn/ufsc
sudo pacman -S pass-secret-service
sudo pacman -Ss pass-secret-service
sudo pacman -S strongswan strongswan-libcharon strongswan-starter strongswan-nm strongswan-charon strongswan-swanctl strongswan-pki libcharon-extra-plugins libcharon-extauth-plugins
sudo pacman -Ss strongswan
sudo pacman -S networkmanager-strongswan strongswan
sudo pacman -Ss libcharon
nmcli
systemctl restart NetworkManager
sudo nano /etc/ipsec.conf 
nmcli connection add -h
nmcli connection add type vpn vpn-type strongswan connection.id "ufsc"
nmcli connection edit ufsc 
nmcli connection modify ufsc vpn.secrets "password=A1n6t5h6o9n6" 
nmcli connection edit ufsc 
nmcli c up ufsc 
nmcli connection up ufsc passwd-file <(echo "vpn.secrets.password:$(pass show vpn/ufsc)")
cat .config/waybar/config
nmcli
ip addr
nano .config/waybar/config
killall waybar 
nano .config/waybar/config
killall waybar 
nano .config/waybar/config
killall waybar 
nano .config/waybar/style.css
killall waybar 
cat .config/waybar/config | wl-copy 
nano .config/waybar/config
killall waybar 
nano .config/waybar/config
paru -S scrollmpris-git
killall waybar 
waybar 
nano .config/waybar/config
killall waybar 
nano .config/waybar/config
killall waybar 
waybar 
nano .config/waybar/config
waybar 
nano .config/waybar/config
nano .config/waybar/style.css
killall waybar 
nano .config/waybar/style.css
killall waybar 
nmcli c d ufsc
nmcli c d APT402G2. 
paru -S protonvpn
paru -Ss protonvpn
nmcli c u APT402G2. 
nmcli
nano .config/waybar/style.css
killall waybar 
nano .config/waybar/style.css
nmcli c d APT402G2. 
nmcli c u APT402G2. 
nmcli c up ufsc 
nmcli c up ufsc --ask
nmcli
cd /tmp
ls
unzip ScienceDirect_articles_03May2026_21-19-32.642.zip 
nmcli c d APT402G2. 
ufsc
ssh admin@192.168.0.24
ls
mv ChatGPT\ Image\ May\ 4\,\ 2026\,\ 12_56_52\ PM.png render.png
killall waybar 
ScrollMPRIS --help
killall waybar 
waybar 
killall waybar 
nano .config/waybar/style.css
ScrollMPRIS --help
killall waybar 
alsamixer 
nano .config/waybar/config
ssh admin@192.168.0.24
claude
curl -fsSL https://claude.ai/install.sh | bash
cd bsc/thesis/
ls
cd ..
ls
rm Introduction\ To\ The\ Theory\ Of\ Computation\ -\ Michael\ Sipser.djvu 
mkdir maceta.old
mv maceta/lib maceta/include maceta/Makefile maceta/src maceta.old/.
sudo pacman -S rust
sudo pacman -S rustup
