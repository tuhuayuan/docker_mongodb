# docker_mongodb
默认是不启用认证，如果改Auth为yes可以指定环境变量MONGODB_PASS作为密码

git clone https://github.com/tuhuayuan/docker_mongodb.git
cd docker_mongodb
docker build -t nbb/mongodb .
docker run -it --rm -p 27017:27017 --env MONGODB_PASS=admin nbb/mongodb
