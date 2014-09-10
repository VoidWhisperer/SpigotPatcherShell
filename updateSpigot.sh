#!/bin/bash
rm *.bps
hasPatcher=$(ls | grep "SpigotPatcher-1.0.jar")
hasSpigot1649=$(ls | grep "spigot-1649.jar")
if [ "$hasPatcher" == "" ]; then
	echo "No spigot-patcher jar. Downloading."
	wget "http://www.spigotmc.org/spigot-updates/SpigotPatcher-1.0.jar"
else
	echo "Spigot-Patcher jar found."
fi
if [ "$hasSpigot1649" == "" ]; then
	echo "No spigot-1649.jar found - You need a spigot jar build #1649 for this tool to work."
else
	echo "spigot-1649.jar found"
fi
updateCmd=$(curl -s  http://www.spigotmc.org/spigot-updates/)
update1=$(echo "$updateCmd" | grep -o 'spigot\-[0-9+]*[a-z]\.bps')
update=$(echo "$update1" | tail -n 1)
wget "http://www.spigotmc.org/spigot-updates/"$update
java -jar SpigotPatcher-1.0.jar spigot-1649.jar $update spigot.jar
