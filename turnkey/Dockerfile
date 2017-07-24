# 二代電子發票平台
#
# https://www.einvoice.nat.gov.tw/APTRNKY/index.html
# https://www.einvoice.nat.gov.tw/APTRNKY/EINVTurnkey_manual.zip
# https://www.einvoice.nat.gov.tw/APTRNKY/EINVTurnkey1.4.8-linux.zip
# 

FROM ubuntu:17.04

# MAINTAINER ikaritw@gmail.com
LABEL maintainer="ikaritw@gmail.com"

# 更新源
# 安装,删除不必要的软件和Apt缓存包列表
RUN apt-get update -qqy && apt-get -qqy install ca-certificates openjdk-8-jre unzip vim

RUN apt-get -qqy install midori ttf-wqy-microhei

# 删除不必要的软件和Apt缓存包列表
RUN apt-get autoclean && apt-get autoremove && rm -rf /var/lib/apt/lists/*

ENV EINVTURNKEY_PATH="/EINVTurnkey" \
EINVTURNKEY_URL="https://www.einvoice.nat.gov.tw/APTRNKY/index.html"

COPY ./EINVTurnkey1.4.8-linux.zip ./EINVTurnkey.zip
COPY run.sh /run.sh

RUN unzip -q ./EINVTurnkey.zip && mv /EINVTurnkey1.4.8-linux $EINVTURNKEY_PATH && rm /EINVTurnkey.zip && chmod a+x $EINVTURNKEY_PATH/linux/*.sct && chmod a+x /run.sh

CMD /run.sh

## http://fabiorehm.com/blog/2014/09/11/running-gui-apps-with-docker/
## https://blog.gslin.org/archives/2016/12/11/7023/%E5%9C%A8-docker-%E8%A3%A1%E9%9D%A2%E8%B7%91-gui-%E7%A8%8B%E5%BC%8F/
## https://read01.com/GPdRME.html
## http://www.infoq.com/cn/articles/talk-about-docker-running-the-chinese-gui-software