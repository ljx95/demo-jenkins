#!/bin/bash
echo "查询标记"
# 停止容器
docker stop demo-jenkins

# sleep 2s
echo "删除容器"
# 删除容器
docker rm demo-jenkins
echo "删除镜像"
# 删除镜像
#docker rmi demo-jenkins/demo:1.0
echo "构建镜像"
# 构建镜像 . 号表示在当前目录构建
docker build -t demo-jenkins/demo:1.0 .
echo "创建容器并启动"
# 创建容器并启动
docker run -d -p 8888:8888 --name demo-jenkins demo-jenkins/demo:1.0

#IMAGE=demo-jenkins
#docker stop myapp
#sleep 3s
#docker run -d --rm -p 9090:8080 --name myapp ${IMAGE}
