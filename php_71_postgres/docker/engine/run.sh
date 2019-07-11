#!/bin/bash
service postgresql start
su - postgres -c "/usr/lib/postgresql/9.4/bin/psql -U postgres -c \"ALTER USER postgres with password 'postgres';\""
su - postgres -c "/usr/lib/postgresql/9.4/bin/psql -U postgres -c \"CREATE USER jlr WITH PASSWORD 'jlr';\""
su - postgres -c "/usr/lib/postgresql/9.4/bin/psql -U postgres -c \"CREATE DATABASE jlr_formulaire_v2 WITH  ENCODING='UTF8' OWNER=jlr TEMPLATE=template0 ;\""
su - postgres -c "/usr/lib/postgresql/9.4/bin/psql -U postgres -c \"ALTER SCHEMA public OWNER TO jlr;\" jlr"
su - postgres -c "/usr/lib/postgresql/9.4/bin/psql -U postgres -c \"GRANT ALL PRIVILEGES ON DATABASE jlr to jlr;\""
su - postgres -c "/usr/lib/postgresql/9.4/bin/psql -U postgres -c \"alter user jlr with createdb;\""

su - postgres -c "/usr/lib/postgresql/9.4/bin/psql -U postgres -c \"CREATE USER codeigniter WITH PASSWORD 'codeigniter';\""
su - postgres -c "/usr/lib/postgresql/9.4/bin/psql -U postgres -c \"CREATE DATABASE code_igniter WITH  ENCODING='UTF8' OWNER=codeigniter TEMPLATE=template0 ;\""
su - postgres -c "/usr/lib/postgresql/9.4/bin/psql -U postgres -c \"ALTER SCHEMA public OWNER TO codeigniter;\" codeigniter"
su - postgres -c "/usr/lib/postgresql/9.4/bin/psql -U postgres -c \"GRANT ALL PRIVILEGES ON DATABASE codeigniter to codeigniter;\""
su - postgres -c "/usr/lib/postgresql/9.4/bin/psql -U postgres -c \"alter user codeigniter with createdb;\""

#npm install
rm /run/apache2/apache2.pid
exec /usr/sbin/apache2ctl -D FOREGROUND
