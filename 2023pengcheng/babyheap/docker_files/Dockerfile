FROM ubuntu:23.10

COPY ./ctf.xinetd /etc/xinetd.d/ctf
COPY ../babyheap_patched /pwn/pwn

RUN apt-get update && apt-get -y dist-upgrade

RUN chmod +x /pwn/pwn && apt-get install -y xinetd build-essential openssl libssl-dev autoconf automake libtool gdbserver libc6-dbg&& \
    useradd -m ctf && \
    echo 'ctf - nproc 1500' >>/etc/security/limits.conf

CMD exec /bin/bash -c "chown root:ctf /pwn/pwn && chmod 755 /pwn/pwn && echo $FLAG > /flag && export FLAG=not_flag && FLAG=not_flag && /etc/init.d/xinetd start; trap : TERM INT; sleep infinity & wait"

EXPOSE 10000
