FROM ubuntu:latest

RUN apt-get update -y

# add redis's repository to apt
RUN apt-get install ca-certificates gnupg lsb-release curl gpg -y && \
	curl -fsSL https://packages.redis.io/gpg | gpg --dearmor -o /usr/share/keyrings/redis-archive-keyring.gpg && \
	echo "deb [signed-by=/usr/share/keyrings/redis-archive-keyring.gpg] https://packages.redis.io/deb $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/redis.list

# Add Docker’s official GPG key:
RUN install -m 0755 -d /etc/apt/keyrings && \
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg && \
chmod a+r /etc/apt/keyrings/docker.gpg

# Use the following command to set up the repository:
RUN echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
    "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
	  tee /etc/apt/sources.list.d/docker.list > /dev/null

# install dependencies
RUN apt-get update -y && \
	apt-get install build-essential clang libomp-dev libc6-dbg wget redis libtool git autoconf automake cmake python3 pip peg lcov openssl libssl-dev -y && \
	apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

# upgrade pip
RUN pip install --upgrade pip

# install python requirements
RUN pip install FalkorDB redis falkordb-bulk-loader click behave pathos async_timeout neo4j==5.12.0 && \
	pip install git+https://github.com/renatahodovan/grammarinator.git@7dace5450b7136d641d065f649b406a22ef4d7f7 && \
	pip install git+https://github.com/RedisLabsModules/RLTest.git@master

