rm -rf /tmp/coding-environment
cp -r . /tmp/coding-environment
rm -rf /tmp/coding-environment/.vagrant
rm -rf /tmp/coding-environment/.git
rm /tmp/coding-environment/*.box
cd /tmp/coding-environment
rm tools/coding-environment.zip
zip ce.zip -r *
cd -
cp /tmp/coding-environment/ce.zip tools/coding-environment.zip
