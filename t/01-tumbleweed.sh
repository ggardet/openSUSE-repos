#!lib/test-in-container-systemd.sh tumbleweed

set -e

mkdir -p /usr/share/zypp/local/service/openSUSE/repo/
ln -sf /opt/project/opensuse-tumbleweed-repoindex.xml /usr/share/zypp/local/service/openSUSE/repo/repoindex.xml
zypper addservice /usr/share/zypp/local/service/openSUSE/ openSUSE

zypper -vvv ref -s

grep -r baseurl /etc/zypp/repos.d
grep -r baseurl /etc/zypp/repos.d | grep -q cdn.opensuse.org

# make sure we can install a random package
zypper -vvvn in vim-small

echo success
