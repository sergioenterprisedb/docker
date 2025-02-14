# vim:set ft=dockerfile:
FROM almalinux:9

ARG TOKEN
ENV TOKEN=${TOKEN}

# Install required packages
ENV PGE_VERSION=17.2-1.el9

RUN	curl -1sSLf "https://downloads.enterprisedb.com/${TOKEN}/enterprise/setup.rpm.sh" | bash ; \
    yum -y update ; \
	yum -y --setopt=tsflags=nodocs --setopt=install_weak_deps=0 install \
		hostname rsync tar gettext bind-utils nss_wrapper glibc-locale-source glibc-langpack-en \
		edb-postgresextended17-server-${PGE_VERSION} \
		edb-postgresextended17-${PGE_VERSION} \
		edb-postgresextended17-libs-${PGE_VERSION} \
		edb-postgresextended17-contrib-${PGE_VERSION} \
	; \
	rm -f /etc/yum.repos.d/enterprisedb-*.repo ; \
	rm -fr /tmp/* ; \
	yum -y clean all --enablerepo='*'

# Set environment variables for PostgreSQL
ENV PGDATA=/var/lib/edb/pge-17/data
ENV PGDIR=/usr/edb/pge17
ENV PATH=/usr/edb/pge17/bin:$PATH

# Create PostgreSQL data directory and set permissions
RUN mkdir -p $PGDATA && chown -R postgres:postgres $PGDATA

USER 26
EXPOSE 5432

ENV PGSETUP_INITDB_OPTIONS="--data-encryption" 

# TDE
ENV PGDATAKEYWRAPCMD='openssl enc -e -aes256 -pass pass:ok -out %p'
ENV PGDATAKEYUNWRAPCMD='openssl enc -d -aes256 -pass pass:ok -in %p'

# Initialize database with Transparent Data Encryption (TDE)
RUN ${PGDIR}/bin/initdb -D ${PGDATA} --data-encryption \
    --key-wrap-command="${PGDATAKEYWRAPCMD}" \
    --key-unwrap-command="${PGDATAKEYUNWRAPCMD}"

# Enable listening on all addresses
RUN echo "listen_addresses='*'" >> ${PGDATA}/postgresql.conf && \
    echo "host all all 0.0.0.0/0 md5" >> ${PGDATA}/pg_hba.conf
