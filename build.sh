#!/bin/bash

# 停止容器
sudo docker stop demo-jenkins

# sleep 2s

# 删除容器
sudo docker rm demo-jenkins

# 删除镜像
sudo docker rmi demo-jenkins/demo:1.0

# 构建镜像 . 号表示在当前目录构建
sudo docker build -t demo-jenkins/demo:1.0 .

# 创建容器并启动
sudo docker run -d -p 8888:8888 --name demo-jenkins demo-jenkins/demo:1.0

#!/bin/bash
#IMAGE=demo-jenkins
#docker stop myapp
#sleep 3s
#docker run -d --rm -p 9090:8080 --name myapp ${IMAGE}