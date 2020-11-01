FROM ubuntu:20.04
WORKDIR /root
RUN apt-get -qq update && apt-get -qq install -y openssh-server openjdk-8-jdk wget
RUN wget https://downloads.apache.org/hadoop/common/hadoop-3.2.1/hadoop-3.2.1.tar.gz && \
	tar -xzvf hadoop-3.2.1.tar.gz && \
	mv hadoop-3.2.1 /usr/local/hadoop && \
    rm hadoop-3.2.1.tar.gz

ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
ENV HADOOP_HOME=/usr/local/hadoop
ENV PATH=$PATH:/usr/local/hadoop/bin:/usr/local/hadoop/sbin

# ssh without key
RUN ssh-keygen -t rsa -f ~/.ssh/id_rsa -P '' && \
    cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys

COPY config/* /tmp/
RUN mv /tmp/* ~/
RUN mkdir ~/input
RUN mv ~/access_log ~/input
RUN chmod +x ~/*.sh
RUN chmod +x ~/*.py

RUN echo '\
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64 \n\
export PATH=${JAVA_HOME}/bin:${PATH} \n\
export HADOOP_CLASSPATH=export HADOOP_CLASSPATH=/usr/lib/jvm/java-7-openjdk-amd64/lib/tools.jar \n\
' >> ~/.bashrc

RUN mkdir /root/src/
VOLUME /root/src/

CMD [ "sh", "-c", "service ssh start; bash"]
