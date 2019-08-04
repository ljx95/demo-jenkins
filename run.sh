#!/bin/bash
#服务名称
SERVER_NAME=demo-jenkins
# 源jar路径,mvn打包完成之后，target目录下的jar包名称，也可选择成为war包，war包可移动到Tomcat的webapps目录下运行，这里使用jar包，用java -jar 命令执行
JAR_NAME=test-jenkins-0.0.1-SNAPSHOT
# 源jar路径
#/usr/local/jenkins_home/workspace--->jenkins 工作目录
#demo 项目目录
#target 打包生成jar包的目录/var/jenkins_home/workspace/$SERVER_NAME/target/test-jenkins-0.0.1-SNAPSHOT.jar
JAR_PATH=/var/jenkins_home/workspace/$SERVER_NAME/target
# 打包完成之后，把jar包移动到运行jar包的目录--->work_daemon，work_daemon这个目录需要自己提前创建
JAR_WORK_PATH=/var/jenkins_home/workspace/$SERVER_NAME/target/

echo "查询进程id-->$SERVER_NAME"
PID=`ps -ef | grep "$SERVER_NAME" | awk '{print $2}'`
echo "得到进程ID：$PID"
echo "结束进程"
for id in $PID
do
	kill -9 $id
	echo "killed $id"
done
echo "结束进程完成"

#复制jar包到执行目录
echo "复制jar包到执行目录:cp $JAR_PATH/$JAR_NAME.jar $JAR_WORK_PATH"
cp $JAR_PATH/$JAR_NAME.jar $JAR_WORK_PATH
echo "复制jar包完成"
cd $JAR_WORK_PATH
#修改文件权限
chmod 755 $JAR_NAME.jar

BUILD_ID=dontKillMe nohup java -jar  $JAR_NAME.jar  &