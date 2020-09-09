#!/bin/bash
chmod +x ViewBanner
chmod +x TermuxStyle
cd /data/data/com.termux/files/usr/etc
rm -f bash.bashrc motd
pkg install grep -y

pkg list-installed > log

grep "wget" log
if [ $? = 0 ]; then
   echo -e "\e[92mWget exist"
elif [ $? = 1 ]; then
   pkg install wget -y
else
   echo -e "\e[91mUnknow Error\e[0m"
fi

while [ -z "bash.bashrc" ]
do
   wget https://raw.githubusercontent.com/ZechBron/CustomizeTermux/zCT/bash.bashrc
done

grep "figlet" log
if [ $? = 0 ]; then
   echo "done"
elif [ "$zCh" != "$ChB" ]; then 
   pkg install figlet -y
else
   echo -e "\e[91mUnknown Error\e[0m"
fi

rm -f log

cd $HOME/CustomizeTermux
