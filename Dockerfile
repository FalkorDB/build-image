FROM ubuntu:latest

# add redis's repository to apt
RUN apt-get update -y
RUN apt-get install lsb-release curl gpg -y
RUN curl -fsSL https://packages.redis.io/gpg | gpg --dearmor -o /usr/share/keyrings/redis-archive-keyring.gpg
RUN echo "deb [signed-by=/usr/share/keyrings/redis-archive-keyring.gpg] https://packages.redis.io/deb $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/redis.list

RUN apt-get update -y

# install dependencies
RUN apt-get install build-essential wget redis libtool git autoconf automake cmake python3 pip peg lcov -y

# install python requirements
RUN pip install --user redis redisgraph-bulk-loader click behave pathos async_timeout
RUN pip install --user git+https://github.com/renatahodovan/grammarinator.git@7dace5450b7136d641d065f649b406a22ef4d7f7

# install RLTest
RUN pip install git+https://github.com/RedisLabsModules/RLTest.git@master
