FROM postgres:10

#ENV PGDATA=/var/lib/pgsql/10/data
#ENV PATH=/usr/pgsql-10/bin:$PATH

COPY libjvm.so /usr/lib/libjvm.so

RUN apt-get -y update && \
	apt-get install wget unzip && \
	wget https://github.com/atris/JDBC_FDW/archive/master.zip && \
	unzip master.zip && \	
	cd JDBC_FDW-master/ && \
	chmod 755 /usr/lib/libjvm.so && \
	make install USE_PGXS=1