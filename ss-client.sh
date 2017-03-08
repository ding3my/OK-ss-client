sudo dnf install python-pip -y
sudo pip install shadowsocks

read -p"input remote host ip:" ip
read -p"input remote host port:" port
read -p"input remote host pass:" pass

cmd="alias sslocal1='sudo killall sslocal ; nohup sslocal -s$ip  -p$port -k$pass -qq &'"
echo $cmd

grep '^#ss-client$' ~/.bashrc || cat << end >>  ~/.bashrc

#ss-client
$cmd
#ss-client
end

mkdir -p ~/.ss-client.d

sudo pip install genpac
genpac --gfwlist-url=https://raw.githubusercontent.com/gfwlist/gfwlist/master/gfwlist.txt -p"SOCKS5 127.0.0.1:1080" > ~/.ss-client.d/gfw.pac
wget https://raw.githubusercontent.com/ding3my/OK-ss-client/master/all.pac -P ~/.ss-client.d
