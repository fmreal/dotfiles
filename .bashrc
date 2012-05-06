export PATH=/usr/local/bin:/usr/local/sbin/:$PATH
export MANPATH=/opt/local/man:$MANPATH

export PS1="\[\e[1;32m\][\u@\h:\w]\$\[\e[00m\] "

# use zsh
if [ -f /bin/zsh ]; then
    exec /bin/zsh
fi

