DOWNLOAD_URL=http://www.monogame.net/releases/v3.5.1/monogame-sdk.run
DST_PATH=$(mktemp -d);

echo "Downloading Mono Game";
wget $DOWNLOAD_URL -P $DST_PATH;

echo "Installing MonoGame"
cd $DST_PATH/

chmod +x monogame-sdk.run
sudo ./monogame-sdk.run

echo "done..."



