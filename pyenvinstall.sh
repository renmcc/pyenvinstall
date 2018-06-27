#!/bin/bash
which git &> /dev/null || yum -y install git
which gcc &> /dev/null || yum -y install gcc
which make &> /dev/null || yum -y install make
which patch &> /dev/null || yum -y install patch
rpm -q gdbm-devel &> /dev/null || yum -y install gdbm-devel
rpm -q openssl-devel &> /dev/null || yum -y install openssl-devel
rpm -q sqlite-devel &> /dev/null || yum -y install sqlite-devel
rpm -q readline-devel &> /dev/null || yum -y install readline-devel
rpm -q zlib-devel &> /dev/null || yum -y install zlib-devel
rpm -q bzip2-devel &> /dev/null || yum -y install bzip2-devel

export PYENV_ROOT=/opt/pyenv
[ -d /opt/pyenv ] || curl -L -k https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer | bash 

echo -n 'export PYENV_ROOT=/opt/pyenv
export PATH="/opt/pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"' > /etc/profile.d/pyenv.sh

. /etc/profile.d/pyenv.sh

pyenv versions|grep -q 3.5.2 || pyenv install 3.5.2
