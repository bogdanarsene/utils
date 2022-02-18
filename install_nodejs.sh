sudo apt install curl

curl -fsSL https://deb.nodesource.com/setup_17.x | sudo -E bash -

sudo apt-get install -y nodejs
node -v
npm -v

sudo npm install -g n
sudo n 16.14.0
hash -r
