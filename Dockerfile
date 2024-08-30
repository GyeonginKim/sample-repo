FROM centos:7.9.2009

# 파일 추가
ADD hello-docker.txt /tmp

USER root

# 리포지토리 설정 파일에서 baseurl을 고정된 URL로 설정
RUN sed -i 's|^mirrorlist=|#mirrorlist=|g' /etc/yum.repos.d/CentOS-Base.repo && \
    sed -i 's|^#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-Base.repo

# IPv4만 사용하도록 설정
RUN echo "ip_resolve=4" >> /etc/yum.conf

# nsswitch.conf 수정
RUN sed -i 's/^hosts:.*/hosts: files dns/' /etc/nsswitch.conf

# 패키지 설치
RUN yum install -y epel-release

