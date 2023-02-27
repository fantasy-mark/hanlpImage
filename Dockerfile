FROM python:3.9.0

RUN cd /opt &&\
	wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" https://download.oracle.com/java/18/archive/jdk-18.0.2.1_linux-x64_bin.tar.gz &&\
	tar -zxvf jdk-18.0.2.1_linux-x64_bin.tar.gz	&&\
	rm jdk-18.0.2.1_linux-x64_bin.tar.gz &&\
	export JAVA_HOME=/opt/jdk-18.0.2.1 &&\
	export JRE_HOME=${JAVA_HOME}/jre &&\
	export CLASSPATH=.:${JAVA_HOME}/lib:${JRE_HOME}/lib" &&\
	export PATH=${JAVA_HOME}/bin:$PATH"

RUN pip --no-cache-dir install hanlp[full]

RUN pip install jupyterlab

WORKDIR /jupyter

EXPOSE 8888

CMD ["bash", "-c", "jupyter lab --notebook-dir=/jupyter --ip 0.0.0.0 --no-browser --allow-root"]
