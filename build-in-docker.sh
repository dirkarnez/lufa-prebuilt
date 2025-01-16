# /bin/bash
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"

function announce () {
    echo "##########################################################################################"
    echo "##############################  $*  #################################"
    echo "##########################################################################################"
}

git clone --branch LUFA-210130 https://github.com/abcminiuser/lufa.git && \
  cd lufa && \
  make && \
  ls
