FROM ubuntu:latest

RUN apt-get update -y

# install dependencies
RUN apt-get install build-essential wget libtool git autoconf automake cmake python3 pip peg lcov -y

# install redis
RUN wget http://download.redis.io/redis-stable.tar.gz
RUN tar -xzvf redis-stable.tar.gz
RUN cd redis-stable && make install

# return to root
WORKDIR /

# remove redis source
RUN rm -rf redis
RUN rm ./redis-stable.tar.gz

# install python requirements
RUN pip install --user redis redisgraph-bulk-loader click behave pathos
RUN pip install --user git+https://github.com/renatahodovan/grammarinator.git@7dace5450b7136d641d065f649b406a22ef4d7f7

# install RLTest
RUN pip install git+https://github.com/RedisLabsModules/RLTest.git@master
