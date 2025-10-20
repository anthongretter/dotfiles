opt -S -p verify -stats dumpasn1.ll -o dumpasn1opt.ll
opt -S -p sccp,dce,verify -stats dumpasn1.ll -o dumpasn1opt.ll
opt -S -p sccp,dce,verify,globalopt -stats dumpasn1.ll -o dumpasn1opt.ll
opt -S -O3 -stats dumpasn1.ll -o dumpasn1opt.ll
opt -S -p sccp,dce -time-passes dumpasn1.ll -o dumpasn1opt.ll
opt -S -time-passes dumpasn1.ll -o dumpasn1opt.ll
opt -S -p sccp,adce -time-passes dumpasn1.ll -o dumpasn1opt.ll
opt -S -p sccp,adce,dce,dse,globaldce -time-passes dumpasn1.ll -o dumpasn1opt.ll
opt -S -p sccp,adce,dce,dse -time-passes dumpasn1.ll -o dumpasn1opt.ll
opt -S -p sccp,adce,dce,dse,gvn -time-passes dumpasn1.ll -o dumpasn1opt.ll
opt -S -p sccp,adce,dce,dse,gvn -stats dumpasn1.ll -o dumpasn1opt.ll
opt -S -p sccp,adce,dce,dse,gvn –debug-only=instcombine dumpasn1.ll -o dumpasn1opt.ll
opt -S -p sccp,adce,dce,dse,gvn dumpasn1.ll -o dumpasn1opt.ll
opt -S -p sccp,adce,dce,dse,gvn -print-beforeall dumpasn1.ll -o dumpasn1opt.ll
opt -S -p sccp,adce,dce,dse,gvn -print-before-all dumpasn1.ll -o dumpasn1opt.ll
opt -S -p sccp,adce,dce,dse,gvn -print-before-all dumpasn1.ll
opt -S -p sccp,adce,dce,dse,gvn -print-before-all dumpasn1.ll > all
nano all
opt -S dumpasn1.ll -print-before-all -O2 2>&1 >
/dev/nul
opt -S dumpasn1.ll -print-before-all -O2 2>&1 > /dev/null
opt -S dumpasn1.ll -print-before-all -O2 > all
opt -S dumpasn1.ll -stats -O2
opt -S dumpasn1.ll -stats -O1
opt -S -O3 dumpasn1.ll -o dumpasn1opt.ll
opt -S -O3 -stats dumpasn1.ll -o dumpasn1opt.ll
opt -S -O1 -stats dumpasn1.ll -o dumpasn1opt.ll > o1
nano o1
rm o1 
opt -S -p sccp,adce,dce,dse,gvn -print-changed dumpasn1.ll > all
opt -S -passes="sccp,adce,dce,dse,gvn" -print-changed dumpasn1.ll > all
opt -S -passes="sccp,adce,dce,dse,gvn" -print-changed dumpasn1.ll -o dumpasn1opt.ll 
opt -S -passes="adce" -print-changed dumpasn1.ll -o dumpasn1opt.ll 
opt -S -passes="sccp" -print-changed dumpasn1.ll -o dumpasn1opt.ll 
opt -S -passes="" -print-changed dumpasn1.ll -o dumpasn1opt.ll 
opt -S -passes="sccp" -print-changed dumpasn1.ll -o dumpasn1opt.ll 
opt -S -passes="sccp" -stats dumpasn1.ll -o dumpasn1opt.ll 
nano lua.ll
opt -S -passes="sccp" -stats lua.ll -o luaopt.ll
opt -S -passes="dce" -stats lua.ll -o luaopt.ll
opt -S -passes="adce" -stats lua.ll -o luaopt.ll
opt -S -passes="sccp" -stats lua.ll -o luaopt.ll
opt -S -passes="sccp,dce" -stats lua.ll -o luaopt.ll
opt -S -passes="sccp,simplifycfg,dce" -stats lua.ll -o luaopt.ll
opt -S -passes="sccp,dce,mergefunc" -stats lua.ll -o luaopt.ll
opt -S -passes="sccp,dce,mergefuncs" -stats lua.ll -o luaopt.ll
opt -S -passes="sccp,dce,mergefunc" -stats lua.ll -o luaopt.ll
opt -S -passes="sccp,dce,mergereturn" -stats lua.ll -o luaopt.ll
opt -S -passes="simplifycfg,sccp,dce,mergereturn" -stats lua.ll -o luaopt.ll
opt -S -passes="simplifycfg,sccp,dce,mergereturn,reg2mem" -stats lua.ll -o luaopt.ll
opt -S -passes="reg2mem,simplifycfg,sccp,dce,mergereturn" -stats lua.ll -o luaopt.ll
opt -S -O3 -stats lua.ll -o luaopt.ll
opt -S -passes="sccp" -print-changed lua.ll -o luaopt.ll
opt -S -passes="sccp" -print-changes lua.ll -o luaopt.ll
setxkbmap -layout us -variant intl
sudo nano /opt/discord/resources/build_info.json 
startx 
sudo arandr \
nano .config/bspwm/src/MonitorSetup 
startx 
nmcli
nmcli dev wifi connect CASA --ask
setxkbmap -layout us -variant intl
startx 
nano .config/bspwm/src/MonitorSetup 
lsblk
du -h
df -h
sudo pacman -R $(pacman -Qdtq)
setxkbmap -layout us -variant intl
ls downloads/ | grep *.iso
ls downloads/ | grep iso
ls downloads/
sudo umount usb 
sudo mount /dev/sda usb
sudo mount /dev/sda1 usb
ls
setxkbmap -layout us -variant intl
paru -Syu pulsar
paru -S pulsar
pacman -Q pulsar
paru -S pulsar-bin 
paru -Syyu
df -h
paru -R kwallet qt5-wayland wayland 
paru -R kwallet qt5-wayland wayland dunst kio
paru -R kwallet qt5-wayland kio kguiaddons5
paru -R kwallet kio kcachegrind
paru -Syyu
pacman -Qdtq
sudo pacman -R $(pacman -Qdtq)
paru -Syyu
paru -Syu
du -sh /var/lib/pacman/local/* 
pacman -Qi | grep -E 'Name|Size'
pacman -Qi | awk '/^Name/ {pkg=$2} /^Installed Size/ {printf "%.0f %s\n", $3/1024, pkg}' | sort -rh | head
pacman -Qi | egrep '^(Name|Installed)' | cut -f2 -d':' | tr '\nK' ' \n' | sort -nrk 2 | less 
pacman -Qi | gawk '/^Name/ { x = $3 }; /^Installed Size/ { sub(/Installed Size  *:/, ""); print x":" $0 }' | sort -k2,3nr
pacman -Qi | gawk '/^Name/ { x = $3 }; /^Installed Size/ { sub(/Installed Size  *:/, ""); print x":" $0 }' | sort -k2,3nr | grep MiB
retdec-bin2pat 
pacman -Qi | gawk '/^Name/ { x = $3 }; /^Installed Size/ { sub(/Installed Size  *:/, ""); print x":" $0 }' | sort -k2,3n | grep MiB
pacman -R retdec-bin pulsar-bin julia ghc zig 
sudo pacman -R retdec-bin pulsar-bin julia ghc zig 
sudo pacman -R $(pacman -Qdtq)
paru -Syu
pacman -Qi | gawk '/^Name/ { x = $3 }; /^Installed Size/ { sub(/Installed Size  *:/, ""); print x":" $0 }' | sort -k2,3n | grep MiB
sudo pacman -R alacritty 
paru -Syu
pacman -Qi | gawk '/^Name/ { x = $3 }; /^Installed Size/ { sub(/Installed Size  *:/, ""); print x":" $0 }' | sort -k2,3n | grep MiB
pacman -Qi | gawk '/^Name/ { x = $3 }; /^Installed Size/ { sub(/Installed Size  *:/, ""); print x":" $0 }' | sort -k2,3n
paru -R haskell-*
paru -R haskell
paru -R haskell-*
paru -R haskell-async haskell-.
paru -R haskell-
paru -R haskell-*
pacman -Qdtq haskell
pacman -Qdtq haskell*
pacman -Qdtq 
pacman -Q 
pacman -Qqt
pacman -Qqt | grep haskell
pacman -Qt | grep has
pacman -Qqt | grep has
pacman -Qq | grep has
pacman -Qq | grep haskell
pacman -Qq | grep haskell | sudo pacman -R
pacman -Qq | grep haskell | xargs sudo pacman -R
sudo pacman -R haskell-async 
sudo pacman -R cabal-install 
sudo pacman -R $(pacman -Qdtq)
pacman -Syu
sudo pacman -Syu
paru -Syu
sudo pacman -S archlinux-keyring 
paru -Syu
sudo pacman-key --recv-key D6C9442437365605 --keyserver keyserver.ubuntu.com
sudo pacman-key --lsign-key D6C9442437365605
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'
paru -Syu
sudo pacman -Syu
paru -Syu
lsblk
ls
sudo mount /dev/sda1 usb
ls usb/
cp downloads/Fedora-Workstation-Live-42-1.1.x86_64.iso usb/.
sudo cp downloads/Fedora-Workstation-Live-42-1.1.x86_64.iso usb/.
sudo umount usb 
poweroff 
df -h
lsblk
sudo gparted
startx 
lsblk
df -h
paru -Syu
reboot
setxkbmap -layout us -variant intl
cat /tmp/10.1007_10968987_3-citation.bib 
cat /tmp/slurm.bib 
ssh cluster 
nano .ssh/config 
ssh cluster 
ping baldo.disi.unitn.it 
firefox /tmp/\(1\)\ Tinder.html 
ls
mv Security_deliverable_1.pdf anthon-trabalho1.pdf
sudo nano /opt/discord/resources/build_info.json 
cat /tmp/Exported\ Items.bib 
startx 
cd college/tcc/
ls
opt -S -passes="sccp" -print-changes lua.ll -o luaopt.ll
opt -S -O3 -stats lua.ll -o luaopt.ll
nmcli dev wifi connect bruh --ask
nmcli dev wifi rescan 
nmcli dev wifi connect bruh --ask
paru -S proton-pass-bin 
setxkbmap -layout us -variant intl
nano .config/bspwm/src/KeyBoardL 
cd college/tcc/
mkdir topdown
cd topdown/
ls
zeditor .
startx 
python
python topdown.py 
./venv/bin/pip install numpy
./venv/bin/python -v
./venv/bin/python -V
./venv/bin/python topdown.py 
time ./venv/bin/python topdown.py 
killall zed
lscpu 
time ./venv/bin/python topdown.py 
ssh cluster 
traceroute baldo.disi.unitn.it
ssh cluster 
cat projects/mylang/Makefile 
startx 
proc
nproc
cd college/tcc
opt -O3 -disable-output -debug-pass=Arguments dumpasn1.ll
opt -O3 -disable-output -debug-pass-manager dumpasn1.ll
opt -enable-new-pm=0 -O3 -debug-pass=Arguments dumpasn1.ll
opt -O3 -disable-output -debug-pass-manager Arguments dumpasn1.ll
opt -O3 -disable-output -debug-pass-manager="Arguments" dumpasn1.ll
man opt
opt -O3 -disable-output -debug-pass=Arguments dumpasn1.ll
opt -help
opt -help | grep debug
opt -help | grep debug-pass
opt -help | grep debug-manager
opt -help | grep debug
opt -help | grep PM
opt -O3 -disable-output --bugpoint-enable-legacy-pm -debug-pass=Arguments dumpasn1.ll
opt -O3 -disable-output -debug-pass-manager=Arguments dumpasn1.ll
opt -O3 -disable-output -debug-pass-manager dumpasn1.ll
opt -O3 -disable-output -debug-pass-manager dumpasn1.ll | head
opt -O3 -disable-output -debug-pass-manager dumpasn1.ll | less
opt -O3 -disable-output -debug-pass-manager dumpasn1.ll | nano
head
cat dumpasn1 | head
cat dumpasn1.ll | head
opt -O3 -disable-output -debug-pass-manager dumpasn1.ll | head
opt -O3 -disable-output -debug-pass-manager dumpasn1.ll > a
opt -O3 -disable-output -debug-pass-manager dumpasn1.ll &> a
nano a
cd college/tcc/
ls
opt -O3 -disable-output -debug-pass-manager dumpasn1.ll &> a
nano a
mv a pass-history
mv pass-history heuristics/.
opt -O3 -disable-output -debug-pass-manager dumpasn1.ll 2>&1 | grep "Running pass:" | sed 's/Running pass: //' | sed 's/ on .*//' | awk '!seen[$0]++' > o3_passes_sequence.txt
ls
nano 03
nano o3_passes_sequence.txt 
opt -O3 -disable-output -debug-pass-manager lua.ll 2>&1 | grep "Running pass:" | sed 's/Running pass: //' | sed 's/ on .*//' | awk '!seen[$0]++' > o3_passes_sequence2.txt
nano o3_passes_sequence2.txt 
opt -O3 -disable-output -debug-pass-manager dumpasn1.ll 2>&1 | grep "Running pass:" | sed 's/Running pass: //' | sed 's/ on .*//' | awk '!seen[$0]++' > o3_passes_sequence.txt
nano o3_passes_sequence
nano o3_passes_sequence.txt 
nano o3_all_passes_sequence.txt 
opt -O3 -disable-output -debug-pass-manager dumpasn1.ll 2>&1 | grep -E "(Running pass:|Skipping pass)" | sed -E 's/(Running pass: |Skipping pass |Skipping pass: )//' | sed 's/ on .*//' | sed 's/ due to optnone attribute//' | awk '!seen[$0]++' > o3_all_passes_sequence.txt
nano o3_all_passes_sequence.txt 
opt 
opt -O3 -disable-output -debug-pass=Arguments dumpasn1.ll &> a
nano a
opt -O3 -disable-output -debug-pass=Arguments dumpasn1.ll
opt -O3 -disable-output -print-passes dumpasn1.ll
opt -O3 -disable-output -debug-pass-manager dumpasn1.ll
opt -O3 -disable-output -debug-pass-manager dumpasn1.ll 2>&1 | grep -E "(Running pass:|Skipping pass)" | sed -E 's/(Running pass: |Skipping pass |Skipping pass: )//' | sed 's/ on .*//' | sed 's/ due to optnone attribute//' | awk '!seen[$0]++' > o3_all_passes_sequence.txt
nano o3_all_passes_sequence.txt 
opt -O3 -disable-output -debug-pass-manager dumpasn1.ll 2>&1 | sed 's/\x1b\[[0-9;]*m//g' | grep -E "(Running pass:|Skipping pass)" | sed -E 's/(Running pass: |Skipping pass: |Skipping pass )//' | sed 's/ on .*//' | sed 's/ due to optnone attribute//' | awk '!seen[$0]++' > o3_all_passes_sequence.txt
nano o3_all_passes_sequence.txt 
opt -O3 -disable-output -debug-pass-manager dumpasn1.ll 2>&1 | sed 's/\x1b\[[0-9;]*[mK]//g' | grep -E "(Running pass|Skipping pass)" | sed -E 's/.*(Running pass|Skipping pass):? *//' | awk '{print $1}' | awk '!seen[$0]++' > o3_all_passes_sequence.txt
nano o3_all_passes_sequence.txt 
opt -O3 -disable-output -debug-pass-manager dumpasn1.ll 2>&
opt -O3 -disable-output -debug-pass-manager dumpasn1.ll 2>&1
opt -O3 -disable-output -debug-pass-manager dumpasn1.ll 2>&1 | awk '{print $3}'
opt -O3 -disable-output -debug-pass-manager dumpasn1.ll 2>&1 | awk '{print $3}' | uniq
opt -O3 -disable-output -debug-pass-manager dumpasn1.ll 2>&1 | awk '{print $3}' | uniq | wc -l
opt -O3 -disable-output -debug-pass-manager dumpasn1.ll 2>&1 | awk '{print $3}' | uniq > a
nano a
opt -O3 -disable-output -debug-pass-manager dumpasn1.ll 2>&1 | awk '{!seen[$3]++}'
opt -O3 -disable-output -debug-pass-manager dumpasn1.ll 2>&1 | awk '!seen[$3]++'
opt -O3 -disable-output -debug-pass-manager dumpasn1.ll 2>&1 | awk '{!seen[$3]++}'
opt -O3 -disable-output -debug-pass-manager dumpasn1.ll 2>&1 | awk '!seen[$3]++ {print $3}'
opt -O3 -disable-output -debug-pass-manager dumpasn1.ll 2>&1 | awk '!seen[$3]++ {print $3}' | wc -l
opt -O3 -disable-output -debug-pass-manager lua.ll 2>&1 | awk '!seen[$3]++ {print $3}' | wc -l
startx 
setxkbmap -layout us -variant intl
opt -O3 -disable-output -debug-pass-manager lua.ll 2>&1 | awk '!seen[$3]++ {print $3}' | wc -l
nmcli dev wifi connect bruh --ask
nmcli dev wifi connect APT402G2. --ask
cd college/tcc
clang -O3 -disable-output -debug-pass-manager dumpasn1.c 2>&1 | awk '!seen[$3]++ {print $3}' | wc -l
clang -O3 -disable-output -debug-pass-manager dumpasn1.c 2>&1
opt -O3 -disable-output -debug-pass-manager dumpasn1.ll 2>&1
opt -O3 -disable-output -debug-pass-manager dumpasn1.ll 2>&1 | grep pass | awk '!seen[$3]++ {print $3}' | wc -l
opt -O3 -disable-output -debug-pass-manager lua.ll 2>&1 | grep pass | awk '!seen[$3]++ {print $3}' | wc -l
opt -O3 -disable-output -debug-pass-manager lua.ll 2>&1 | grep pass | awk '!seen[$3]++ {print $3}'
opt -O3 -disable-output -debug-pass-manager lua.ll 2>&1 | grep pass | awk '!seen[$3]++ {print $3}' > luao3 
opt -O3 -disable-output -debug-pass-manager dumpasn1.ll 2>&1 | grep pass | awk '!seen[$3]++ {print $3}' > dumpasn1o3 
diff dumpasn1o3 luao3 
opt -O3 -disable-output -debug-pass-manager dumpasn1.ll 2>&1 | grep pass
opt -O3 -disable-output -debug-pass-manager dumpasn1.ll 2>&1 | grep Running pass
opt -O3 -disable-output -debug-pass-manager dumpasn1.ll 2>&1 | 
opt -O3 -disable-output -debug-pass-manager dumpasn1.ll 2>&1 | grep "Running pass" | awk '!seen[$3]++ {print $3}' 
opt -O3 -disable-output -debug-pass-manager dumpasn1.ll 2>&1 | grep "Running pass" | awk '!seen[$3]++ {print $3}' | wc -l
opt -O3 -disable-output -debug-pass-manager lua.ll 2>&1 | grep "Running pass" | awk '!seen[$3]++ {print $3}' | wc -l
opt -O3 -disable-output -debug-pass-manager lua.ll 2>&1 | grep "pass" | awk '!seen[$3]++ {print $3}' | wc -l
opt -O3 -disable-output -debug-pass-manager dumpasn1.ll 2>&1 | grep "pass" | awk '!seen[$3]++ {print $3}' | wc -l
opt -O2 -disable-output -debug-pass-manager dumpasn1.ll 2>&1 | grep "pass" | awk '!seen[$3]++ {print $3}' | wc -l
opt -O1 -disable-output -debug-pass-manager dumpasn1.ll 2>&1 | grep "pass" | awk '!seen[$3]++ {print $3}' | wc -l
opt -O1 -disable-output -debug-pass-manager lua.ll 2>&1 | grep "pass" | awk '!seen[$3]++ {print $3}' | wc -l
opt -Oz -disable-output -debug-pass-manager lua.ll 2>&1 | grep "pass" | awk '!seen[$3]++ {print $3}' | wc -l
opt -Os -disable-output -debug-pass-manager lua.ll 2>&1 | grep "pass" | awk '!seen[$3]++ {print $3}' | wc -l
opt -O0 -disable-output -debug-pass-manager lua.ll 2>&1 | grep "pass" | awk '!seen[$3]++ {print $3}' | wc -l
opt -O0 -disable-output -debug-pass-manager lua.ll 2>&1 | grep "pass" | awk '!seen[$3]++ {print $3}'
cd college/tcc/
ls
opt -O3 -disable-output -debug-pass-manager lua.ll 2>&1 | awk '!seen[$3]++ {print $3}' | wc -l
opt -O3 -disable-output -debug-pass-manager dumpasn1.ll 2>&1 | awk '!seen[$3]++ {print $3}' | wc -l
opt -O3 -disable-output -debug-pass-manager lua.ll 2>&1 | awk '!seen[$3]++ {print $3}' | wc -l
opt -O3 -disable-output -debug-pass-manager lua.ll 2>&1 | awk '!seen[$3]++ {print $3}' > luao3
opt -O3 -disable-output -debug-pass-manager dumpasn1.ll 2>&1 | awk '!seen[$3]++ {print $3}' > dumpasn1o3
diff dumpasn1o3 luao3 
nano dumpasn1o3 
nmcli
nmcli dev wifi connect APT402G2. --ask
cd college/tcc/
nano luao3 
nmcli dev wifi connect APT402G2. --ask
cd college/tcc/
opt -O3 -disable-output -debug-pass-manager dumpasn1.ll 2>&1 | awk '!seen[$3]++ {print $3}'
opt -O3 -disable-output -debug-pass-manager dumpasn1.ll 2>&1 | grep 'Running Pass:' | awk '!seen[$3]++ {print $3}'
opt -O3 -disable-output -debug-pass-manager dumpasn1.ll 2>&1 | grep 'Running Pass' | awk '!seen[$3]++ {print $3}'
opt -O3 -disable-output -debug-pass-manager dumpasn1.ll 2>&1 | grep 'Running pass' | awk '!seen[$3]++ {print $3}'
opt -O3 -disable-output -debug-pass-manager dumpasn1.ll 2>&1 | grep 'Running pass' | awk '!seen[$3]++ {print $3}' | wc -l
opt -O3 -disable-output -debug-pass-manager dumpasn1.ll 2>&1 | grep 'pass' | awk '!seen[$3]++ {print $3}' | wc -l
opt -O3 -disable-output -debug-pass-manager dumpasn1.ll 2>&1 | grep 'Pass' | awk '!seen[$3]++ {print $3}' | wc -l
opt -O3 -disable-output -debug-pass-manager lua.ll 2>&1 | grep 'Pass' | awk '!seen[$3]++ {print $3}' | wc -l
opt -O3 -disable-output -debug-pass-manager lua.ll 2>&1 | grep 'pass' | awk '!seen[$3]++ {print $3}' | wc -l
opt -O3 -disable-output -debug-pass-manager lua.ll 2>&1 | grep 'pass' | awk '!seen[$3]++ {print $3}' > heuristics/o3-passes.txt
setxkbmap -layout us -variant intl
opt -O3 -print-passes -disable-output < /dev/null
opt -O3 -print-passes -disable-output < /dev/null > o3
nano o3 
opt -print-passes -disable-output < /dev/null > n
diff n o3
opt -O0 -print-passes -disable-output < /dev/null > o0
diff o0 o3
cd college/tcc
opt -O0 -disable-output -debug-pass-manager lua.ll 2>&1 | grep 'pass' | awk '!seen[$3]++ {print $3}'
opt -O1 -disable-output -debug-pass-manager lua.ll 2>&1 | grep 'pass' | awk '!seen[$3]++ {print $3}'
opt -passes="Annotation2MetadataPass,ForceFunctionAttrsPass"
opt -passes="Annotation2MetadataPass,ForceFunctionAttrsPass" lua.ll 
opt -O3 -disable-output -debug-pass-manager lua.ll 2>&1 | grep 'pass' | awk '!seen[$3]++ {print $3}'
opt -print-pipeline-passes -passes="default<O3>" /dev/null
opt -print-pipeline-passes -passes="default<O3>" lua.ll 
nano a
rm a
nano a
rm b
nano b
diff a b
opt -passes="default<O3>" -pass-manager-debug lua.ll 
opt -passes="default<O3>" -disable-output -debug-pass-manager lua.ll 2>&1 | grep 'pass' | awk '!seen[$3]++ {print $3}'
opt -passes="default<O3>" -disable-output -debug-pass-manager lua.ll 2>&1 | grep 'pass' | awk '!seen[$3]++ {print $3}' | wc -l
opt -passes="default<O3>" -disable-output -debug-pass-manager lua.ll 2>&1 | grep 'pass'
opt -passes="default<O3>" -disable-output -debug-pass-manager lua.ll 2>&1 | awk /pass/ '!seen[$3]++ {print $3}' | wc -l
opt -passes="default<O3>" -disable-output -debug-pass-manager lua.ll 2>&1 | awk '/pass/ && !seen[$3]++ { print $3 }' | wc -l
ls
rm ideas o3 -opid-opt.ll n pid-opt.ll pid.ll o0 convertido.mpg 
rm ideas o3 ./-opid-opt.ll n pid-opt.ll pid.ll o0 convertido.mpg 
ls
firefox book
rm book 
cd college/
mkdir ia-se
sudo pacman -S swi-prolog 
nmcli 
nmcli dev wifi rescan 
nmcli dev wifi connect bruh --ask
cd college/ia-se/
swipl
swipl -s model.pl 
startx 
setxkbmap -layout us -variant intl
sudo nano /opt/discord/resources/build_info.json 
cat college/ia-se/model.pl | xclip
cat college/ia-se/model.pl
mv downloads/AI_deliverable_1.pdf college/ia-se/grupo-IA6-L1.pdf
cd college/ia-se/
zip grupo-IA6-L1.pdf model.pl 
ls
zip grupo-IA6-L1.zip grupo-IA6-L1-relatorio.pdf model.pl 
zip grupo-IA6-L1.zip grupo-IA6-L1.pdf model.pl 
ls
mkdir a
cd a
cp ../grupo-IA6-L1.zip .
unzip grupo-IA6-L1.zip 
ls
emacs -nw .
nice 
which nice
nice help
nice -help
nice --help
systemctl 
systemctl status 
chrony
chronyc 
systemctl status 
redshift-gtk 
redshift
redshift -h
redshift -p
redshift
redshift -l  -l -27.59667:-48.54917
redshift -l  -l -27:-48
redshift -l -27:-48
pkill -USR1 redshift
sudo pacman -R redshift 
ls downloads/
nmcli dev wifi rescan 
nmcli dev wifi connect bruh --ask
cd college/tcc/paprevisit/
ls
cd papers/post2015/
ls
setxkbmap -layout us -variant intl
cd projects/
ls
setxkbmap -layout us -variant intl
source <(sed 's/ /_/g' /etc/os-release
source <(sed 's/ /_/g' /etc/os-release)
source <(sed 's/ /_/g' /etc/os-release) && echo $ID
cat /etc/os-release 
ls /etc/ 
setxkbmap -layout us -variant intl
ls
sudo hostnamectl set-hostname europa
startx 
reboot
spotify 
sudo spotify 
nmcli device 
device wifi 
nano .xinitrc 
ls
ls -a
startx 
nano .xinitrc 
htop
killall spotify 
sudo killall spotify 
rebot
reboot
killall bspwm 
startx 
ls
ls usb/
rm -fr downloads/*
rm -fr dotfiles
setxkbmap -layout us -variant intl
loadkeys us-intl
loadkeys us
sudo loadkeys us-intl
sudo loadkeys us
setfont -d
ls
sudo nano /etc/pacman.conf 
pacman -Qdtq
sudo pacman -R $(pacman -Qdtq)
ls
ls .config/
cd .config/
rm -fr VSCodium Electron tmux zsh alacritty xfce4 
ls
rm -fr geany
sudo pacman -Qd
sudo pacman -Qdt
sudo pacman -Qdq
sudo pacman -Qdqt
sudo pacman -Qs
sudo pacman -Qs | grep chao
sudo pacman -R zsh
sudo pacman -R zsh fzf-tab-git 
sudo pacman -R zsh fzf-tab-git zsh-history-substring-search zsh-syntax-highlighting 
zsh
sudo pacman -R zsh fzf-tab-git zsh-history-substring-search zsh-syntax-highlighting zsh-autosuggestions 
ls
cd
rm .zshrc 
ls -a
ls .steam
ls Steam
ls steam
rm -fr .config/bspwm/bspwmrc 
rm -fr .config/bspwm
mkdir .config/bspwm
cp /usr/share/doc/bspwm/examples/bspwmrc .config/bspwm/.
cd .config/
ls
htop
clipcat -h
clipcat-menu 
clipcatctl 
man clipcat
man clipcatctl
man clipcatd
man clipcat-menu
sudo pacman -R clipcat 
df -h
nano .bashrc
nano bspwm/bspwmrc 
cp /usr/share/doc/sxhkd/examples/background_shell/sxhkdrc bspwm/.
cd bspwm/
nano sxhkdrc 
nano /usr/share/doc/sxhkd/examples/background_shell/xinitrc 
nano ~/.xinitrc 
startx 
setfont -d
sudo loadkeys us
cp /usr/share/doc/bspwm/examples/sxhkdrc .config/bspwm/.
mkdir -p .config/sxhkd
mv .config/bspwm/sxhkdrc .config/sxhkd/.
nano .config/sxhkd/sxhkdrc 
startx 
setfont -d
sudo pacman -S xorg-server xf86-video-intel 
startx 
setfont -d
ls
startx
ls
cd .config/
mkdir sway
cp /etc/sway/config sway/.
nano sway/config 
sudo pacman -S swaylock swayidle
nano sway/config 
ls
cat /dev/urandom 
nano .config/kitty/kitty.conf
nano .config/kitty/current-theme.conf 
setxkbmap br
dirname .spacemacs
dirname .config/dotfiles/bspwmrc 
chmod +x .config/dotfiles/common/utils 
./.config/dotfiles/common/utils 
killall sxhkd 
./.config/dotfiles/bspwmrc 
killall sxhkd 
./.config/dotfiles/bspwmrc 
h
spotify 
nvidia-smi 
ls
ls downloads/
ls .config/dotfiles/
cp /usr/share/doc/picom/picom.conf.example .config/dotfiles/common/picom.conf
nano .config/dotfiles/common/picom.conf 
cd .config/dotfiles/
ls
mv sxhkdrc common/.
ls
europa/
cd europa/
ls
nano kittytheme.conf
nano ~/.config/kitty/kitty.conf
nano kittytheme.conf 
feh --bg-max .config/dotfiles/europa/wpp.jpg 
feh --bg-fill .config/dotfiles/europa/wpp.jpg 
feh --bg-scale .config/dotfiles/europa/wpp.jpg 
feh --bg-center .config/dotfiles/europa/wpp.jpg 
ls
arandr 
sudo pamcan -S feh
sudo pacman -S feh
ls
spotify 
cd .config/dotfiles/
ls
pwd
ls
nano bspwmrc 
emacs -nw .
nano bspwmrc 
ls
mkdir utils
mv common/utils utils/helpers
sudo pacman -S xf86-input-synaptics 
grep nvidia /etc/modprobe.d/* /lib/modprobe.d/*
sudo prime-select nvidia
sudo pacman -S nvidia-prime 
prime-run spotify
nvidia-smi 
ls
sudo pacman -S zsh
feh --bg-center .config/dotfiles/europa/wpp.png 
feh --bg-scale .config/dotfiles/europa/wpp.png 
nano .fehbg 
steam
nvidia-smi
pacman -S libibus
sudo pacman -S libibus
killall steam
rm -fr .cache/*
ln -s /usr/lib/libpcre.so /usr/lib64/libpcre.so.3
sudo ln -s /usr/lib/libpcre.so /usr/lib64/libpcre.so.3
ls
arandr 
nano .config/dotfiles/common/
cd .config/dotfiles/common/
nano layout.sh 
nano picom.conf 
nano ../../kitty/kitty.conf
ls
ls
;s
ls
nano .config/kitty/kitty.conf
ls
;s
ls
feh --bg-scale .config/dotfiles/europa/wpp.png 
nano .config/dotfiles/common/picom.conf 
cd .config/dotfiles/common/
xclip -o picom.conf 
nano picom.conf 
nano picom-animations.conf
nano .config/kitty/kitty.conf
cd .config/dotfiles/europa/
ls
nano config.ini 
sudo pacman -S xclip
cat config.ini | xclip -selection clipboard
ls
firefox 
steam
spotify -h
spotify --help
spotify --show-console
spotify --log-file=a
nano a
rm a
rm -fr .config/spotify/
rm -fr .config/spotify
spotify
rm -fr .cache/spotify
spotify
prime-run spotify
steam
firefox 
killall sxhkd 
./.config/dotfiles/bspwmrc 
nvidia-smi
killall steam
gamemoderun steam
prime-run steam
killall steam
prime-run steam
discord 
ls
asda
ls
htop
htop
tmux 
tmux a
killall tmux 
ls
setfont -d
ls
sudo pacman -Rsc sway
sudo pacman -Rsc swaybg
sudo pacman -Rsc swayidle 
sudo pacman -Rsc swaylock 
sudo pacman -S bspwm 
nano .xinitrc 
rm -fr .config/sway
nano .xinitrc 
sudo rm -fr /etc/X11
sudo pacman -S xorg-server
sudo pacman -S xf86-video-intel 
sudo pacman -S xorg
cd .config/
bspwm -h
ls
ls bspwm/
ls sxhkd/
mkdir dotfiles
mv bspwm/bspwmrc dotfiles/.
mv sxhkd/sxhkdrc dotfiles/.
rmdir bspwm/ sxhkd/
cd dotfiles/
ls
nano bspwmrc 
cd
nano .xinitrc 
cd .config/dotfiles/
ls
nano bspwmrc 
sxhkd -c

nano bspwmrc 
echo $0
nano a
./a
chmod +x a
./a
nano a
rm a
ls
mkdir scripts
cd scripts/
ls
sudo pacman -R waybar 
sudo pacman -Rsc waybar 
sudo pacman -R $(pacman -Qdqt)
cd ..
ls
nano bspwmrc 
cd
nano .xinitrc 
sudo pacman -S xorg-xinit 
startx 
cd .config/dotfiles/
nano bspwmrc 
startx 
nano bspwmrc 
startx 
nano bspwmrc 
ls
ls utils/
ls
nano bspwmrc 
startx 
ls
cd ..
ls
sudo pacman -S wayland
sudo pacman -S hyprland
hyprland
reboot
setfont -d
prime-run
sudo pacman -S nvidia-prime 
sudo nano /etc/X11/xorg.conf
sudo nano /etc/X11/xorg.conf.nvidia-xconfig-original 
sudo nano /etc/X11/xorg.conf.d/70-synaptics.conf 
sudo nano /etc/X11/xorg.conf.d/10-nvidia-drm-outputclass.conf 
ls
ls .config/
ls .config/systemd/
nano .config/systemd/user/plasma-river.service 
ls
sudo pacman -R xorg-server
sudo pacman -R $(pacman Qdtq)
sudo pacman -R $(pacman -Qdtq)
sudo pacman -R xorg-xinit xorg*
sudo pacman -Rsq xorg-*
sudo pacman -Rs xorg-*
sudo pacman -Rq xorg-*
sudo pacman -Rs xorg-*
sudo pacman -Rsc xorg-xinit 
sudo pacman -Rsc xorg-setxkbmap 
sudo pacman -Rsc xorg-xauth 
sudo pacman -Rsc x11
sudo pacman -Rsc xserver
sudo pacman -Rsc xclip 
sudo pacman -Rsc keepassxc 
sudo pacman -S xorg-server
sudo pacman -Rsc xorg-server
sudo pacman -Rsc xorg-xrandr 
sudo pacman -S wayland
paru -S newm-atha-git 
paru -Syy newm-atha-git 
paru -S newm-next-git
newm-cmd 
newm-cmd launcher
newm-panel-basic 
paru -R newm-next-git 
paru -S newm-next-git 
paru -Rsc newm-next-git 
cat /etc/X11/xorg.conf
cat /etc/X11/xorg.conf.d/70-synaptics.conf 
sudo pacman -S hyprland
sudo pacman -R hyprland
sudo pacman -S sway
sudo pacman -S hyprland
sudo pacman -Rsc hyprland
sudo pacman -S sway
sudo pacman -S waybar xorg-xwayland wmenu swaybg mako 
sway
qq
llsasdasdsd
ls

ls -a
cat .Xauthority 
rm .Xauthority 
sudo pacman -S wlr-randr 
xrandr --output HDMI-A-1 --primary
nano .config/hypr/hyprland.conf 
nano .config/kitty/kitty.conf
ls
steam
cd .config/hypr/
ls
nano hyprland.conf 
cd ..
cd waybar/
nano style.css 
waybar 
nmcli
waybar 
ls /sys/class/power_supply/
waybar 
ls
setfont -d
hyprland
sudo pacman -S abseil-cpp 
hyprland
nano .config/hypr/hyprland.conf 
nano .config/waybar/config 
nano .config/hypr/hyprland.conf 
nano .config/kanshi/config 
nano .config/hypr/hyprland.conf 
nano .config/kanshi/config 
nano .config/hypr/hyprland.conf 
nano .config/kitty/kitty.conf
pkill waybar && hyprctl dispatch exec waybar 
waybar 
nano .config/waybar/config 
waybar 
sudo pacman -S kanshi 
mkdir .config/kanshi
nano .config/kanshi/config
kanshi
ls
nano ly-session.log 
rm ly-session.log 
ls
ls -a
rm .fehbg 
kanshi
waybar 
systemctl status dunst
sudo pacman -R dunst 
sudo pacman -R $(pacman -Qdtq)
notify-send a
systemctl status 
notify-send a -d
notify-send -healp
notify-send -h
notify-send --help
notify-send -a
notify-send -a 
notify-send -?
sudo pacman -R libnotify 
sudo pacman -R thunar 
notify-send a
thunar
sudo pacman -R mako 
notify-send a
sudo pacman -S mako 
notify-send a -a mako
mako
systemctl stop mako
systemctl status mako
systemctl status
systemctl stop mako.service
systemctl status mako.service
sudo pacman -R mako 
sudo pacman -S rofi
wofi --show drun
sudo pacman -R rofi
sudo pacman -S wofi
wofi --show drun
reboot
hyprctl monitors all
firefox 
firefox &
spotify &
ls
cat ly-session.log 
nano .config/hypr/hyprland.conf 
nano .config/kitty/kitty.conf
ls
hyprpaper 
killall 
hyprpaper 
sudo pacman -S wpaperd 
cd .config/
rm hypr/hyprpaper.conf 
mkdir wpaperd
nano wpaperd/config.toml
nano .config/hypr/hyprland.conf 
wufi -h
wofi -h
wofi --style 
wofi --style --show
wofi --style --show drun
wofi --style --show dmenu
wofi -G --show dmenu
dconf 
hyprpaper 
nano ~/.config/hypr/hyprpaper.conf
hyprpaper 
nano ~/.config/hypr/hyprpaper.conf
hyprpaper 
wpaperd 
nano .config/wpaperd/config.toml 
nano .config/hypr/hyprland.conf 
nano .config/waybar/style.css 
cat .config/waybar/style.css 
cd .config/waybar/
mv style.css style.css.bak
nano style.css
killall waybar && waybar &
nano config 
killall waybar && waybar &
rm style.css
nano style.css
killall waybar && waybar &
cd .. 
cd hypr/
nano hyprland.conf 
cat .config/dotfiles/europa/Xresources 
ls
nano .config/hypr/hyprland.conf 
ls
killall wpaperd && wpaperd &
nano .config/kitty/kitty.conf
ls
nano .config/kitty/kitty.conf
ls
nano .config/kitty/kitty.conf
ls
nano .config/wpaperd/config.toml 
nano .config/hypr/hyprland.conf 
nano .config/kitty/kitty.conf
ls
nano .config/wpaperd/config.toml 
nano .bashrc
nano .config/kitty/current-theme.conf 
nano .config/kitty/kitty.conf
cd .config/kitty/
cd themes/
ls
cd ..
ls
rm -fr themes/
mv current-theme.conf theme.conf
nano theme.conf 
xclip -o
xclip -selection clipboard -o
xclip -o a
xclip
xclip -h
rm theme.conf 
nano theme.conf
killall wpaperd && wpaperd &
wpaperd &
killall wpaperd && wpaperd &
ls
nano .config/kitty/theme.conf 
ls
nano .config/kitty/theme.conf 
nano .config/waybar/config 
nano .config/waybar/style.css
nano .config/kitty/theme.conf 
ls
nano .config/kitty/theme.conf 
nano .config/hypr/hyprland.conf 
ls
nano .config/hypr/hyprland.conf 
ls
cd .config/
ls
ls source/
4
killall waybar && waybar &
nano .bashrc
cat .config/kitty/theme.conf 
ls
nmcli con down APT402G2. 
reboot
nano .bashrc
mkdir .config/wofi
nano .config/wofi/style.css
cat .config/kitty/kitty.conf
cat .config/kitty/theme.conf 
nano .config/wofi/style.css
wofi -show
wofi --show
man wofi
man wofi(7)
man wofi(7).
man wofi 7
man -s 7 wofi
nano .config/hypr/hyprland.conf 
spotify 
killall spotify
hyprctl -h
notify-send a
reboot
nano .config/kitty/theme.conf 
nano .config/waybar/style.css
ls
nano .config/waybar/style.css
ls
nano .config/waybar/style.css
nano .config/kitty/theme.conf 
nano .config/hypr/hyprland.conf 
killall waybar && waybar &
spotify 
 &
rm -fr .cache/spotify
nano .config/hypr/hyprland.conf 
nmcli
ping 8.8.8.8
cd downloads/
firefox CV.pdf 
cd college/
uname -a
git clone https://github.com/rlcancian/Genesys-Simulator.git
firefox downloads/CV.pdf 
nano .config/wofi/style.css 
nmcli
bruconrescan 
nmcli 
nmcli dev wifi list 
sudo pacman -S wl-clipboard 
cat downloads/Energy.bib | wl-copy 
sudo nano /opt/discord/resources/build_info.json 
systemctl restart NetworkManager
nano .config/waybar/config 
sudo pacman -S wine
nmcli dev wifi rescan 
nmcli dev wifi connect bruh 
sudo pacman -S wine
cd college/modsim/
wine arena.exe 
wine arena.exe --enable-archs=i386,x86_64 
wine --version
winetricks dotnet48
sudo pacman -S winetricks 
winetricks dotnet48
file arena.exe 
WINEPREFIX=~/.wine32_arena wine arena.exe
wine arena.exe --enable-archs=i386,x86_64 
WINEPREFIX=~/.wine_arena winetricks settings win10
WINEPREFIX=~/.wine_arena winetricks dotnet48
WINEPREFIX=~/.wine_arena wine arena.exe --enable-archs=i386,x86_64 
WINEPREFIX=~/.wine_arena32
WINEARCH=win32 winecfg
WINEPREFIX=~/.wine_arena32 WINEARCH=win32 winecfg
ls ~
ls -a ~
rm -fr ~/.wine*
sudo nano /etc/pacman.conf 
WINEPREFIX=.wine_arena32 winecfg
WINEPREFIX=$HOME/college/modsim/.wine_arena32 winecfg
WINEPREFIX=$HOME/college/modsim/.wine_arena32 winetricks dotnet48
WINEPREFIX=$HOME/college/modsim/.wine_arena32 winetricks dotnet90
WINEPREFIX=$HOME/college/modsim/.wine_arena32 wine arena.exe 
cat /tmp/10.1007_978-3-319-09967-5_10-citation.bib 
cat /tmp/10.1007_978-3-319-09967-5_10-citation.bib | wl-copy
nano .config/waybar/config 
nano .config/waybar/style.css
killall waybar 
find . -name "drive_c"
cd college/modsim/
ls
sudo pacman -S wine-gecko 
WINEPREFIX=$HOME/college/modsim/.wine_arena32 wine arena.exe 
WINEPREFIX=$HOME/college/modsim/.wine_arena32 wine cmd
WINEPREFIX=$HOME/college/modsim/.wine_arena32 wine dot90
WINEPREFIX=$HOME/college/modsim/.wine_arena32 wine dotnet90
WINEPREFIX=$HOME/college/modsim/.wine_arena32 winetricks dotnet9
WINEPREFIX=$HOME/college/modsim/.wine_arena32 wine arena.exe 
ls
unziip 16.20.10.343_x64.zip 
unzip 16.20.10.343_x64.zip 
ls
mv 16.20.10.343_x64 Arena-16.20.10.343_x64
cd Arena-16.20.10.343_x64/
ls
cd MediaImage/
ls
WINEPREFIX=$HOME/college/modsim/.wine_arena32 wine autorun.exe 
ls
ls Install
ls Install/Arena/
WINEPREFIX=$HOME/college/modsim/.wine_arena32 wine cmd
WINEPREFIX=$HOME/college/modsim/.wine_arena32 wine Arena
WINEPREFIX=$HOME/college/modsim/.wine_arena32 wine autorun.exe 
WINEPREFIX=$HOME/college/modsim/.wine_arena32 wine cmd
WINEPREFIX=$HOME/college/modsim/.wine_arena32 wine regedit
winstart Arena.exe
nano .config/hypr/hyprland.conf 
cd projects/
ls
cd spacemarine/
ls
./spacemarine 
nano spacemarine.c 
nano Makefile 
ls
cd ..
sudo pacman -S neovim
nvim 
mkdir .config/nvim
nvim .config/nvim/init.lua
mkdir -p .config/nvim/lua/config
nvim .config/nvim/lua/config/lazy.lua
mkdir -p .config/nvim/lua/plugins
nvim .config/nvim/lua/config/lazy.lua
rmdir .config/nvim/lua/plugins
nvim .config/nvim/lua/config/lazy.lua
mkdir .config/nvim/lua/config/lazy.lua
nano .config/nvim/lua/config/lazy.lua
nvim .
nano .config/hypr/hyprland.conf 
sudo pacman -S maven 
mvn exec:java
mvn clean
mvn exec:java
mvn clean
mvn compielr
mvn compile
mvn exec:java
nano .config/hypr/hyprland.conf 
cd college/modsim/
ls
ln ms1.doe .wine_arena15/drive_c/users/porath/Links/ms1.doe
firefox ms1.html 
cd .wine_arena15/drive_c/
l;s
l
s
ss
ls
cd users/porath/Documents/
l;s
cd ..
ls
cd ProgramData/
l;s
cd Rockwell\ Software/Arena/
ls
cd. .
cd ..
ls Program\ Files
cd Program\ Files
ls
cd Rockwell\ Software/
ls
cd Arena/
ls
cd Reports/
ls
cd ../..
cd RSCommon/
ls
cd ..
cd users/porath/AppData/
ls
cd Roaming/Rockwell\ Software/VisD/15/
ls
cd ..
ls
cd ..
ls
cd ..
ls
cd ..
;s
ls
l
ls
WINEPREFIX=$HOME/college/modsim/.wine_arena32 wine Arena-15/MediaImage/autorun.exe 
ls
cd college/modsim/
ls
rm -fr 16.20.10.343_x64.zip arena.exe Arena-16.20.10.343_x64/
ls
unzip 15.10.00004.10788-25_x64.zip 
ls -a
mv 15.10.00004.10788-25_x64 Arena-15
ls
WINEPREFIX=$HOME/college/modsim/.wine_arena15 winecfg
WINEPREFIX=$HOME/college/modsim/.wine_arena15 winetricks dotnet48
WINEPREFIX=$HOME/college/modsim/.wine_arena15 wine Arena-15/MediaImage/autorun.exe 
ls .wine_arena15/drive_c/Program\ Files
ls .wine_arena15/drive_c/Program\ Files\ (x86)/
ls .wine_arena15/drive_c/Program\ Files\ \(x86\)/
ls .wine_arena15/drive_c/Program\ Files\ \(x86\)/Rockwell\ Software/
ls .wine_arena15/drive_c/Program\ Files/Rockwell\ Software/Arena/
WINEPREFIX=$HOME/college/modsim/.wine_arena15 wine .wine_arena15/drive_c/Program\ Files/Rockwell\ Software/Arena/Arena.exe
WINEPREFIX=$HOME/college/modsim/.wine_arena15 winetricks dotnet9
WINEPREFIX=$HOME/college/modsim/.wine_arena15 wine .wine_arena15/drive_c/Program\ Files/Rockwell\ Software/Arena/Arena.exe
ls
ls .wine_arena15/drive_c/Program\ Files/Rockwell\ Software/Arena
WINEPREFIX=$HOME/college/modsim/.wine_arena15 wine .wine_arena15/drive_c/Program\ Files/Rockwell\ Software/Arena/expmt.exe 
ls .wine_arena15/drive_c/Program\ Files/Rockwell\ Software/Arena/Add-ins/
ls .wine_arena15/drive_c/Program\ Files/Rockwell\ Software/Arena/
ls Arena-15/MediaImage/Install/
W
WINEPREFIX=$HOME/college/modsim/.wine_arena15 wine cmd
cd college/modsim/
ls
WINEPREFIX=$HOME/college/modsim/.wine_arena15 wine cmd
cd college/modsim/
WINEPREFIX=$HOME/college/modsim/.wine_arena15 wine cmd
cd college/modsim/
WINEPREFIX=$HOME/college/modsim/.wine_arena15 WINEDLLOVERRIDES="ole32,oleaut32,rpcrt4=native,builtin" wine .wine_arena15/drive_c/Program\ Files/Rockwell\ Software/Arena/Arena.exe 
cd college/modsim/
firefox ms1.html 
sudo pacman -S unixodbc 
cd college/modsim/
ls
firefox ms1.html 
ls
cat ms1.out 
cd college/modsim/
cat ms1.out 
cd college/modsim/
WINEPREFIX=$HOME/college/modsim/.wine_arena15 winetricks ole32 oleaut32 rpcrt4 uuid
WINEPREFIX=$HOME/college/modsim/.wine_arena15 winetricks ole32 oleaut32 uuid
WINEPREFIX=$HOME/college/modsim/.wine_arena15 winetricks ole32 oleaut32
WINEPREFIX=$HOME/college/modsim/.wine_arena15  wine .wine_arena15/drive_c/Program\ Files/Rockwell\ Software/Arena/Arena.exe 
sudo pacman -S pdfgrep 
sudo pacman -Syy pdfgrep 
cd projects/termiru/
ls
pdfgrep 17/09/2025 15.09.25-a-21.09.25.pdf
pdfgrep -A 1000 17/09/2025 15.09.25-a-21.09.25.pdf
pdfgrep -A 10 "17/09/2025" 15.09.25-a-21.09.25.pdf | sed '/^$/q'
pdfgrep -A 10 "17/09/2025" 15.09.25-a-21.09.25.pdf | sed '/^18/09/2025/Q'
pdfgrep -A 10 "17/09/2025" 15.09.25-a-21.09.25.pdf | sed '/^18\/09\/2025\/Q'
pdfgrep -A 10 "17/09/2025" 15.09.25-a-21.09.25.pdf | sed '/^18\/09\/2025/Q'
pdfgrep -A 10 "17/09/2025" 15.09.25-a-21.09.25.pdf | sed '#^18/09/2025#Q'
pdfgrep -A 10 "17/09/2025" 15.09.25-a-21.09.25.pdf | sed '#18/09/2025#Q'
pdfgrep -A 10 "17/09/2025" 15.09.25-a-21.09.25.pdf | sed '\#18/09/2025#Q'
pdfgrep -A 10 "17/09/2025" 15.09.25-a-21.09.25.pdf | sed '\#18/09/2025#Q' | head -n -1
nvidia-smi 
sudo pacman -S neofetch
nvidia-smi 
cd downloads/
ls
firefox Data_Banks_II_deliverable_II-1.pdf 
mv Data_Banks_II_deliverable_II-1.pdf anthon-e2.pdf 
nano .config/hypr/hyprland.conf 
WINEPREFIX=$HOME/college/modsim/.wine_arena15  wine .wine_arena15/drive_c/Program\ Files/Rockwell\ Software/Arena/Arena.exe 
cd college/modsim/
winec .wine_arena15/drive_c/Program\ Files/Rockwell\ Software/Arena/Arena.exe 
cd college/modsim/
ls
WINEPREFIX=$HOME/college/modsim/.wine_arena15  wine .wine_arena15/drive_c/Program\ Files/Rockwell\ Software/Arena/Arena.exe 
cd college/modsim/
firefox ms1.html 
cd college/ia-se/
ls
cat model.pl 
sudo pacman -Ss clips
paru -S clips
cd college/modsim/
ls
cd ..
cd ia-se/
ls
clips
cd college/tcc/
ls
cd llvm-project/
ls
paru -S telegram-desktop
paru -S telegram-desktop-bin
paru -R telegram-desktop 
paru -S telegram-desktop-bin
killall waybar 
ls source/
cd source/ghidra
ls
cd Ghidra
ls
cd ..
find . -name "ghidra"
cd
nano .bash_history 
sudo pacman -S ghidra
sudo pacman -Ss llvm2c
paru llvm2c
python
cd examples/
ls
make
make clean
make
make clean
make
make clean
make
make clean
make
make clean
make
make analyze 
make clean
make
make clean
make
make view
make clean
make
make view
make clean
make
make clean
make
make view
make compare
make clean
make
make clean
make
make 
make clean
make debug
make
clang -h
man clang
make
make clean
make
opt -print-passes
opt -print-passes | grep loop
make
opt -print-passes | grep loop
make clean
make
make diff
opt -passes="mem2reg,gvn,instcombine,reassociate,simplifycfg" -print-pipeline -S tiny_loop.ll 
man opt
opt --help
opt --help | grep pipeline
opt -passes="mem2reg,gvn,instcombine,reassociate,simplifycfg" --print-pipeline-passes -S tiny_loop.ll 
opt -passes="simplifycfg,reassociate,instcombine,gvn,mem2reg" --print-pipeline-passes -S tiny_loop.ll 
opt -passes="mem2reg,gvn,instcombine,reassociate,simplifycfg" --debug -S tiny_loop.ll 
opt --help | grep debug
opt -passes="mem2reg,gvn,instcombine,reassociate,simplifycfg" -print-pipeline -S -debug-pass-manager tiny_loop.ll 
opt -passes="mem2reg,gvn,instcombine,reassociate,simplifycfg" -S -debug-pass-manager tiny_loop.ll 
opt -passes="mem2reg,gvn,instcombine,reassociate,simplifycfg" -S -debug-pass-manager -disable-output tiny_loop.ll 
opt -passes="simplifycfg,reassociate,instcombine,gvn,mem2reg" -S -debug-pass-manager -disable-output tiny_loop.ll 
llc -o original.s tiny_loop.ll 
clang -no-pie original.s -o original
make clean
make
llc -o original.s tiny_loop.ll 
clang -no-pie original.s -o original
opt -passes="dce,instcombine" -S -debug-pass-manager -disable-output tiny_loop.ll 
opt -passes="instcombine,dce" -S -debug-pass-manager -disable-output tiny_loop.ll 
make clean
make
opt -passes="instcombine,dce" -S -debug-pass-manager -disable-output tiny_loop.ll 
make clean
make
opt -passes="instcombine,dce" -S -debug-pass-manager -disable-output tiny_loop.ll 
make clean
make
make clean
make
make clean
make
opt -passes="instcombine,dce" -S -debug-pass-manager -disable-output tiny_loop.ll 
opt -passes="instcombine,dce" -S tiny_loop.ll -o instfirst.ll 
opt -passes="dce,instcombine" -S tiny_loop.ll -o dcefirst.ll 
diff instfirst.ll dcefirst.ll 
diff instfirst.ll tiny_loop.ll 
make clean
clang -Xclang -disable-llvm-passes -emit-llvm -S -o tiny_loop.ll tiny_loop.c 
make
opt -passes="indvars,loop-unroll-full" -S tiny_loop.ll -o dcefirst.ll 
nano dcefirst.ll 
rm dcefirst.ll 
opt -passes="indvars,loop-unroll-full" -disable-output -debug-pass-manager -S tiny_loop.ll
make
make diff
rm instfirst.ll 
make clean
make
opt -print-passes | grep instcombine
make
make diff
make
make diff
opt -passes="loop(loop-unroll-full),aggressive-instcombine" -disable-output -debug-pass-manager -S tiny_loop.ll
./tiny_loop-order1 
make
make diff
opt -passes="loop(loop-unroll-full),aggressive-instcombine" -disable-output -debug-pass-manager -S tiny_loop.ll
./tiny_loop-order1 
make
./tiny_loop-order1 
make
./tiny_loop-order1 
make
./tiny_loop-order1 
make
./tiny_loop-order1 
make
./tiny_loop-order1 
make
./tiny_loop-order1 
make
./tiny_loop-order1 
make
./tiny_loop-order1 
make
./tiny_loop-order1 
make
./tiny_loop-order1 
make
./tiny_loop-order1 
make
make diff
opt -passes="mem2reg,sroa" -disable-output -debug-pass-manager -S tiny_loop.ll
./tiny_loop-order1 
make clean
make
make diff
diff tiny_loop-order2.ll tiny_loop.ll 
opt -passes="mem2reg" -S tiny_loop-order1.ll -o 2.ll
opt -passes="mem2reg" -disable-output -debug-pass-manager -S tiny_loop-order1.ll
clang -Xclang -O0 -emit-llvm -S -o tiny_loop.ll tiny_loop.c 
opt -passes="sroa" -S tiny_loop.ll -o 1.ll
opt -passes="mem2reg" -S 1.ll
ls
rm -fr *
clang -O0 -emit-llvm -S simple_example.c -o unopt.ll
clang -O0 -emit-llvm -S passorder.c -o unopt.ll
opt -passes="sroa,mem2reg" -S unopt.ll -o sroa_first.ll
opt -passes="mem2reg,sroa" -S unopt.ll -o mem2reg_first.ll
opt -passes="sroa" -S unopt.ll -o sroa_first.ll
opt -passes="mem2reg" -S unopt.ll -o mem2reg_first.ll
opt -passes="mem2reg" -S sroa_first.ll -o sroa_first.ll
opt -passes="sroa" -S unopt.ll -o sroa_first.ll
opt -passes="sroa,mem2reg" -S unopt.ll -o sroa_first.ll
opt -passes="mem2reg,sroa" -S unopt.ll -o mem2reg_first.ll
llc -o sroa_first.s sroa_first.ll 
llc -o mem2reg_first.s mem2reg_first.ll 
clang -no-pie sroa_first.s -o original
objdump -d sroa_first.s 
nano sroa_first.s
clang -O0 -emit-llvm -S passorder.c -o unopt.ll
opt -passes="sroa,mem2reg" -S unopt.ll -o sroa_first.ll
opt -passes="mem2reg,sroa" -S unopt.ll -o mem2reg_first.ll
llc -o mem2reg_first.s mem2reg_first.ll 
llc -o sroa_first.s sroa_first.ll 
clang -no-pie sroa_first.s -o sroa_first
clang -no-pie mem2reg_first.s -o mem2reg_first
clang -O0 -emit-llvm -S passorder.c -o unopt.ll
opt -passes="mem2reg,sroa" -S unopt.ll -o mem2reg_first.ll
opt -passes="sroa,mem2reg" -S unopt.ll -o sroa_first.ll
llc -o sroa_first.s sroa_first.ll 
llc -o mem2reg_first.s mem2reg_first.ll 
clang -no-pie mem2reg_first.s -o mem2reg_first
clang -no-pie sroa_first.s -o sroa_first
chmod +x build_passorder.sh 
./build_passorder.sh 
opt -passes="sroa" -S unopt.ll -o sroa_only.ll
opt -passes="mem2reg" -S unopt.ll -o mem2reg_only.ll
diff unopt.ll mem2reg_only.ll 
clear
./build_passorder.sh 
opt -passes="mem2reg" -S unopt.ll -o mem2reg_only.ll
opt -passes="sroa" -S unopt.ll -o sroa_only.ll
opt -passes="mem2reg,sroa" -S unopt.ll -print-after-all
./build_passorder.sh 
opt -print-passes | grep dce
./build_passorder.sh 
diff mem2reg_first.ll sroa_first.ll 
opt -passes="dce,loop-unroll-full" -S unopt.ll -print-after-all
opt -passes="dce,loop-unroll-full" -S unopt.ll -print-after-all > log
opt -passes="dce,loop-unroll-full" -S unopt.ll -debug-pass-manager
diff unopt.ll sroa_first.ll 
opt -print-passes | grep unroll
./build_passorder.sh 
opt -passes="instcombine,dce" -S unopt.ll -print-after-all
./build_passorder.sh 
opt -passes="instcombine,dce" -S unopt.ll -print-after-all
./build_passorder.sh 
opt -passes="instcombine,dce" -S unopt.ll -print-after-all
opt -print-passes | grep vectorize
opt -print-passes | grep unroll
./build_passorder.sh 
llc -o 
llc -o sroa_first.s sroa_first.ll 
clang -no-pie sroa_first.s -o sroa_first
clang -no-pie mem2reg_first.s -o mem2reg_first
./build_passorder.sh 
nmcli dev wifi connect bruh 
nano .config/hypr/hyprland.conf 
cd college/ia-se/
ls
nano model.clp 
cat model.clp | wl-copy 
ls
mv downloads/AI_deliverable_3.pdf college/ia-se/grupo-IA6-L1-relatorio.pdf
cd college/ia-se/
ls
mv grupo-IA6-L1-relatorio.pdf grupo-IA6-T1.pdf
zip grupo-IA6-T1.zip grupo-IA6-T1.pdf se.clp 
clips 
clips -h
clips se.clp 
man clips
clips --help
clips
sudo nano /opt/discord/resources/build_info.json 
nano .bashrc
nano .config/kitty/kitty.conf
nano .config/kitty/theme.conf 
ls
ls
cd college/
ls
cd college/
ls
nano .config/waybar/style.css
cat .config/waybar/style.css | wl-copy 
nano .config/waybar/style.css
killall waybar 
nano .config/kitty/kitty.conf
nano .config/waybar/style.css
killall waybar 
pwd
nano .bashrc
rm -fr .config/nvim
cd source/
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1
cd
rm -fr .local/share/nvim
vim
rm -fr .config/nvim
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1
rm -fr .config/nvim
rm -fr .local/share/nvim
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1
vim
rm -fr .local/share/nvim
rm -fr .config/nvim
rm -fr .cache/nvim
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1
vim
ls .config/nvim/
nano .config/nvim/README.md 
rm -fr .config/nvim
rm -fr .cache/nvim
rm -fr .local/share/nvim
git clone -b v2.0 https://github.com/NvChad/NvChad ~/.config/nvim --depth 1
vim
cd .config/
mv wpp.jpg wpp.jpg.back
nvim
nano .config/hypr/hyprland.conf 
nano .config/wpaperd/config.toml
nano .config/hypr/hyprland.conf 
nano .config/wpaperd/config.toml
nano .config/kitty/theme.conf 
nano .config/wpaperd/config.toml
killall wpaperd 
nano .config/wpaperd/config.toml
ls
killall wpaperd 
ls
nano .config/kitty/kitty.conf
ls
killall wpaperd 
nano .config/kitty/kitty.conf
nano .config/
ls
cd college/
ls
cd
nano .bashrc
nano .config/hypr/hyprland.conf 
ls
wpaperd --help
man wpaperd
nano /usr/share/doc/wpaperd/README.md 
nano .config/kitty/kitty.conf
nano .config/kitty/theme.conf
nano .config/kitty/theme.conf
killall wpaperd 
nano .config/wpaperd/config.toml
kitten query-terminal 
ls
cd college/
ls
nano .bashrc
ls
nano .config/kitty/theme.conf
ls
nvim
rm -fr .local/share/nvim
rm -fr .cache/nvim
rm -fr .config/nvim
$XDG_CONFIG_HOME
echo $XDG_CONFIG_HOME
git clone https://github.com/nvim-lua/kickstart.nvim.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim
nvim
sudo pacman -S vim
ls
sudo pacman -S helix 
sudo pacman -S bash-language-server
helix 
sudo pacman -S kakoune
kakoune
kak 
sudo pacman -R kakoune helix nvim vim
sudo pacman -R kakoune helix neovim vim
sudo pacman -S micro
micro
rm -
rm -fr 
rm -fr .local/share/nvim
echo $TERM
micro
mkdir .config/micro/colorschemes
micro .config/kitty/kitty.conf
micro .config/kitty/theme.conf
cd college/
ls
ls
nano .bashrc
ls
cd college/
ls
nano .bashr
nano .bashrc
ncd
cd
nano .bashrc
nano .config/kitty/kitty.conf
ls
cd college/
ls
ls
nano .config/kitty/theme.conf
micro .config/kitty/theme.conf
echo $TERM
ls
;s
ls
column 
sudo pacman -S neofetch
paru -S neofetch
colorscript 
paru -S collumns
paru -S columns
;s
ls
nano .config/kitty/kitty.conf
ls
nano .bashrc
cat .config/waybar/style.css | wl-copy 
micro .config/waybar/style.css
killall waybar 
killall waybar 
nano .config/micro/colorschemes/
nano .config/micro/colorschemes/darkvoid.json
micro
nano .config/micro/colorschemes/darkvoid.json 
micro .config/micro/colorschemes/darkvoid.json 
mv .config/micro/colorschemes/darkvoid.json .config/micro/colorschemes/darkvoid.micro 
rm -fr .config/BraveSoftware
cat .config/kitty/theme.conf 
killall waybar 
nano .config/waybar/config 
cat .config/kitty/
cat .config/waybar/
cat .config/waybar/style.css | wl-copy 
micro .config/waybar/style.css
killall waybar 
micro .config/waybar/style.css
flameshot 
micro
nano .config/kitty/theme.conf
micro .config/kitty/theme.conf
killall waybar 
cat .config/kitty/theme.conf | wl-copy 
ls
cd college/
firefox pictures/.ronara.jpg
micro .bashrc
nano .config/kitty/theme.conf
cd college/
killall waybar 
nano .config/kitty/kitty.conf
ls
ls
nano .bashrc
ls
micro .config/waybar/style.css
micro .config/micro/colorschemes/darkvoid.micro 
ls .config/micro/colorschemes/
micro .config/micro/colorschemes/darkvoid.micro 
cat .config/waybar/style.css | wl-copy 
micro .config/waybar/style.css
ls
micro
micro 
alias nano='nano'
nano .bashrc
alias nano='nano'
nano .bashrc
sudo nano /opt/discord/resources/build_info.json 
micro .config/micro/colorschemes/darkvoid.micro 
micro .bashrc
micro .config/micro/colorschemes/darkvoid.micro 
nano .config/micro/colorschemes/darkvoid.json 
ls
nano .config/micro/colorschemes/darkvoid.json 
ls
nano .config/micro/colorschemes/darkvoid.json 
ls
nano .config/micro/colorschemes/darkvoid.json 
alias nano='nano'
nano .bashrc
nano .config/kitty/kitty.conf
nano .config/kitty/theme.conf
ls
cd college/
nano .bashrc
cd
nano .bashrc
ls
nano .config/kitty/kitty.conf
ls
nano .config/kitty/theme.conf
cd college/
ls
nano .config/kitty/theme.conf
ls
nano .bashrc
ls
micro .config/micro/colorschemes/darkvoid.micro 
ls
nano .bashrc
cd college/
ls
ls
micro .config/micro/colorschemes/darkvoid.micro 
nano .config/kitty/theme.conf
cd college/
ls
mkdir greendrag
cd greendrag/
sudo pacman -S secrets 
freeorg.hsecrets
systemctl status pass-secret-service
nano .config/hypr/hyprland.conf 
sudo pacman -S mermaid-cli 
sudo pacman -Syy mermaid-cli 
sudo pacman - mermaid-cli 
sudo pacman -R mermaid-cli 
ls
nano .config/hypr/hyprland.conf 
d downloads/
cd downloads/
mv CV-2.pdf cv-anthon.pdf
paru -S flameshot
paru -R flameshot 
sudo pacman -S xdg-desktop-portal xdg-desktop-portal-hyprland
paru -S flameshot 
paru -S grim
mkdir -p .config/flameshot/
nano .config/flameshot/flameshot.ini
cd college/eh/
ls
ls final/
cd bash/
ls
nano solution.py 
cd ..
ls
cd symetric/
ls
cd ..
cd morphing/
ls
nano solution.py 
nano test.py 
cd ..
cd pwn/
ls
nano bin.py 
ls[
ls
cd college/eh/
cd reports/
git init
git add README.md
git commit -m "first commit"
git branch -M master
git remote add origin git@github.com:anthongretter/ethical-hacking-reports.git
git push -u origin master
ls
git status 
git add .
git commit -m "first commit"
git branch -M master
git remote add origin git@github.com:anthongretter/ethical-hacking-reports.git
git push -u origin master
df -h
rm -fr .cache/
df -h
cd source/
ls
cd HealthyIG/
ls
killall firef
killall firefox 
ls
cd projects/
ls
cd tests/
ls
cd ..
cd KleinMix/
ls
ls target/
cat pom.xml 
paru -S drawio-desktop-bin 
ls

killall steam
sudo pacman -S keepassxc 
systemctl status keepassxc
keepassxc-cli 
nano ${XDG_DATA_HOME:-$HOME/.local/share}/dbus-1/services/org.freedesktop.secrets.service
ls ${XDG_DATA_HOME:-$HOME/.local/share}/dbus-1/services/org.freedesktop.secrets.service
ls ${XDG_DATA_HOME:-$HOME/.local/share}/dbus-1/services/
ls ${XDG_DATA_HOME:-$HOME/.local/share}/dbus-1/
ls ${XDG_DATA_HOME:-$HOME/.local/share}/
mkdir -p ${XDG_DATA_HOME:-$HOME/.local/share}/dbus-1/services/
nano ${XDG_DATA_HOME:-$HOME/.local/share}/dbus-1/services/org.freedesktop.secrets.service
reboot
sudo pacman -R keepassxc 
rm ${XDG_DATA_HOME:-$HOME/.local/share}/dbus-1/services/org.freedesktop.secrets.service
bison 
man bison[
man bison
llvm-lib --version
llvm-lib -V
llvm-lib -v
llvm-config -v
llvm-config --version
cat projects/mylang/IDEA.md 
nano .config/hypr/hyprland.conf 
cat /tmp/electronics-v13-i05_20251001.bib 
ls
cd college/modsim/
ls
WINEPREFIX=$HOME/college/modsim/.wine_arena15  wine .wine_arena15/drive_c/Program\ Files/Rockwell\ Software/Arena/Arena.exe 
nano .config/hypr/hyprland.conf 
cd college/modsim/
ls
WINEPREFIX=$HOME/college/modsim/.wine_arena15  wine .wine_arena15/drive_c/Program\ Files/Rockwell\ Software/Arena/Arena.exe 
mkdir -p college/ia-ga
ls
python -m venv venv
nano .config/hypr/hyprland.conf 
. /home/porath/college/ia-ga/venv/bin/activate ; clear
pip install geneticalgorithm
chmod +x graphcolorga.py 
./graphcolorga.py 
pip install numpy
pip install matplotlib
./graphcolorga.py 
. /home/porath/college/ia-ga/venv/bin/activate ; clear
[./venv/bin/pip install geneticalgorithm numpy matplotlib]
./graphcolorga.py 
tar -xf GD01_c.tar.gz 
pip install scipy
./graphcolorga.py 
tar -xf Trefethen_20b.tar.gz 
./graphcolorga.py 
git init
git add ,
git add .
git commit -m "Adding everything lol"
git remote add origin git@github.com:anthongretter/graph-coloring-ga.git 
git push -u origin master
cd college/ia-ga/
ls
cd plots/
ls
mv 'convergence_26_fullerene_DELIVERED.png
' convergence_26_fullerene_DELIVERED.png 
cd college/ia-ga/
ls
cd
cd donw
cd downloads/
ls
mv AI_deliverable_3-3.pdf relatorio-grupo-ia6.pdf
firefox relatorio-grupo-ia6.pdf 
. /home/porath/college/ia-ga/venv/bin/activate ; clear
python -v
python --V
python -V
cd plots/
unzip resized-images.zip 
pip freeze
git status 
git add .
git log
git commit -m "Fixing names and removing old graph"
git push
paru -S todoist-bin
todoist 
paru -R todoist-bin 
paru -S todoist-appimage
todoist 
firefox downloads/CV-1.pdf 
firefox downloads/CV.pdf 
downloaddownloads/CV-1.pdf 
ls documents/
mv downloads/CV-2.pdf documents/CV.pdf
firefox downloads/CV-1.pdf 
firefox documents/CV.pdf 
cd downloads/
unzip microdados_enem_2019.zip 
cat DADOS/MICRODADOS_ENEM_2019.csv 
cat DADOS/MICRODADOS_ENEM_2019.csv | grep SC
cat DADOS/MICRODADOS_ENEM_2019.csv | grep Santa\ Catarina
cat DADOS/MICRODADOS_ENEM_2019.csv | grep "Santa Catarina"
cat DADOS/MICRODADOS_ENEM_2019.csv | grep "Pomerode"
cat DADOS/MICRODADOS_ENEM_2019.csv | grep "Blumenau"
cat DADOS/MICRODADOS_ENEM_2019.csv | head
ls
rm -fr DADOS/ DICIONÁRIO/ INPUTS/ LEIA-ME\ E\ DOCUMENTOS\ TÉCNICOS/ PROVAS\ E\ GABARITOS/
ls
df -h
ls
firefox college/modsim/ms2.html 
nano .config/hypr/hyprland.conf 
cd college/modsim/
ls
WINEPREFIX=$HOME/college/modsim/.wine_arena15  wine .wine_arena15/drive_c/Program\ Files/Rockwell\ Software/Arena/Arena.exe 
[A
WINEPREFIX=$HOME/college/modsim/.wine_arena15  wine .wine_arena15/drive_c/Program\ Files/Rockwell\ Software/Arena/Arena.exe 
firefox 
killall firefox 
cd college/tcc/
ls
cd paprevisit/
ls
firefox papers_by_year.png
nano script.py 
ls papers
ls papers/post2015/
ls papers/pre2015/
ls
. /home/porath/college/ia-ga/venv/bin/activate ; clear
nano .config/hypr/hyprland.conf 
cd college/modsim/
WINEPREFIX=$HOME/college/modsim/.wine_arena15  wine .wine_arena15/drive_c/Program\ Files/Rockwell\ Software/Arena/Arena.exe 
killalll steam
nano .config/waybar/style.css 
df -h
du -h college
sudo pacman -S baobab 
df -h
rm -fr .local/share/Trash
df -h
nano .config/hypr/hyprland.conf 
cd college/modsim/
ls
WINEPREFIX=$HOME/college/modsim/.wine_arena15  wine .wine_arena15/drive_c/Program\ Files/Rockwell\ Software/Arena/Arena.exe 
nano .config/hypr/hyprland.conf 
mv downloads/CV-4.pdf cv-anthon.pdf
firefox cv-anthon.pdf 
cd college/modsim/
ls
WINEPREFIX=$HOME/college/modsim/.wine_arena15  wine .wine_arena15/drive_c/Program\ Files/Rockwell\ Software/Arena/Arena.exe 
nano .config/hypr/hyprland.conf 
nano .config/waybar/config 
killall waybar 
cd college/modsim/
WINEPREFIX=$HOME/college/modsim/.wine_arena15  wine .wine_arena15/drive_c/Program\ Files/Rockwell\ Software/Arena/Arena.exe 
cd college/modsim/
ls
WINEPREFIX=$HOME/college/modsim/.wine_arena15  wine .wine_arena15/drive_c/Program\ Files/Rockwell\ Software/Arena/Arena.exe 
cd college/modsim/
ls
firefox ms3.html 
cd college/modsim/
WINEPREFIX=$HOME/college/modsim/.wine_arena15  wine .wine_arena15/drive_c/Program\ Files/Rockwell\ Software/Arena/Arena.exe 
WINEPREFIX=$HOME/college/modsim/.wine_arena15  winetricks mspatcha 
WINEPREFIX=$HOME/college/modsim/.wine_arena15  wine .wine_arena15/drive_c/Program\ Files/Rockwell\ Software/Arena/Arena.exe 
WINEPREFIX=$HOME/college/modsim/.wine_arena15  winetricks dotnet472
WINEPREFIX=$HOME/college/modsim/.wine_arena15  wine .wine_arena15/drive_c/Program\ Files/Rockwell\ Software/Arena/Arena.exe 
ls college/modsim/
ls .config/dotfiles/
mkdir -p .files/config
