
make testing in single PC without CORE:

[client-manet.c] send to
[(MASTER) handle_client(void *arg) IN server-manet.c] send to
[(MASTER) m_thread(void *arg) IN server-manet.c] send to
[(SLAVE) slave(void *arg) IN server-manet-slave.c]

Startup sequence: 
[root@localhost server-client-pthread-c]# ./server-manet
[root@localhost server-client-pthread-c]# ./server-manet-slave
[root@localhost server-client-pthread-c]# ./client-manet

++++++++++++++++++++++++++++++++++++++++++++++

make testing by using CORE in single PC:

1. 	在每个节点的主目录创建文件： ctrl.txt, masterip.txt, hosts, 
	根据batman-adv协议，选择 主节点，其它为从节点；要修改 上面3个文件的值

[client-manet.c] send to
[(MASTER) handle_client(void *arg) IN server-manet.c] send to
[(MASTER) m_thread(void *arg) IN server-manet.c] send to
[(SLAVE) slave(void *arg) IN server-manet.c]

Startup sequence: 
[root@localhost server-client-pthread-c]# ./server-manet
[root@localhost server-client-pthread-c]# ./client-manet


[1]
[10.0.0.1] ~ [10.0.0.10]
elect the max IP and max links number as Master, other as Slave.

[2]
Now, the Master is [10.0.0.10],
# execute the following commands in gnome-terminal
echo 10.0.0.10 > /tmp/pycore.40288/n1.conf/masterip.txt
echo 10.0.0.10 > /tmp/pycore.40288/n2.conf/masterip.txt
echo 10.0.0.10 > /tmp/pycore.40288/n3.conf/masterip.txt
echo 10.0.0.10 > /tmp/pycore.40288/n4.conf/masterip.txt
echo 10.0.0.10 > /tmp/pycore.40288/n5.conf/masterip.txt
echo 10.0.0.10 > /tmp/pycore.40288/n6.conf/masterip.txt
echo 10.0.0.10 > /tmp/pycore.40288/n7.conf/masterip.txt
echo 10.0.0.10 > /tmp/pycore.40288/n8.conf/masterip.txt
echo 10.0.0.10 > /tmp/pycore.40288/n9.conf/masterip.txt
echo 10.0.0.10 > /tmp/pycore.40288/n10.conf/masterip.txt
echo 10.0.0.10 > /tmp/pycore.40288/n12.conf/masterip.txt

echo 0 > /tmp/pycore.40288/n1.conf/ctrl.txt
echo 0 > /tmp/pycore.40288/n2.conf/ctrl.txt
echo 0 > /tmp/pycore.40288/n3.conf/ctrl.txt
echo 0 > /tmp/pycore.40288/n4.conf/ctrl.txt
echo 0 > /tmp/pycore.40288/n5.conf/ctrl.txt
echo 0 > /tmp/pycore.40288/n6.conf/ctrl.txt
echo 0 > /tmp/pycore.40288/n7.conf/ctrl.txt
echo 0 > /tmp/pycore.40288/n8.conf/ctrl.txt
echo 0 > /tmp/pycore.40288/n9.conf/ctrl.txt
echo 1 > /tmp/pycore.40288/n10.conf/ctrl.txt

echo "10.0.0.101   mpe.localhost" > /tmp/pycore.40288/n1.conf/hosts
echo "10.0.0.101   mpe.localhost" > /tmp/pycore.40288/n2.conf/hosts
echo "10.0.0.101   mpe.localhost" > /tmp/pycore.40288/n3.conf/hosts
echo "10.0.0.101   mpe.localhost" > /tmp/pycore.40288/n4.conf/hosts
echo "10.0.0.101   mpe.localhost" > /tmp/pycore.40288/n5.conf/hosts
echo "10.0.0.101   mpe.localhost" > /tmp/pycore.40288/n6.conf/hosts
echo "10.0.0.101   mpe.localhost" > /tmp/pycore.40288/n7.conf/hosts
echo "10.0.0.101   mpe.localhost" > /tmp/pycore.40288/n8.conf/hosts
echo "10.0.0.101   mpe.localhost" > /tmp/pycore.40288/n9.conf/hosts
echo "10.0.0.101   mpe.localhost" > /tmp/pycore.40288/n10.conf/hosts

/bin/cp /root/桌面/server-client-pthread-c/m-MPE-manet-testing/server-manet /tmp/pycore.40288/n1.conf
/bin/cp /root/桌面/server-client-pthread-c/m-MPE-manet-testing/server-manet /tmp/pycore.40288/n2.conf
/bin/cp /root/桌面/server-client-pthread-c/m-MPE-manet-testing/server-manet /tmp/pycore.40288/n3.conf
/bin/cp /root/桌面/server-client-pthread-c/m-MPE-manet-testing/server-manet /tmp/pycore.40288/n4.conf
/bin/cp /root/桌面/server-client-pthread-c/m-MPE-manet-testing/server-manet /tmp/pycore.40288/n5.conf
/bin/cp /root/桌面/server-client-pthread-c/m-MPE-manet-testing/server-manet /tmp/pycore.40288/n6.conf
/bin/cp /root/桌面/server-client-pthread-c/m-MPE-manet-testing/server-manet /tmp/pycore.40288/n7.conf
/bin/cp /root/桌面/server-client-pthread-c/m-MPE-manet-testing/server-manet /tmp/pycore.40288/n8.conf
/bin/cp /root/桌面/server-client-pthread-c/m-MPE-manet-testing/server-manet /tmp/pycore.40288/n9.conf
/bin/cp /root/桌面/server-client-pthread-c/m-MPE-manet-testing/server-manet /tmp/pycore.40288/n10.conf

/bin/cp /root/桌面/server-client-pthread-c/m-MPE-manet-testing/client-manet /tmp/pycore.40288/n12.conf

看系统中的vnoded进程占用资源的情况：
top -p `pgrep vnoded | tr "\\n" "," | sed 's/,$//'`
也可以通过ps命令先找到进程号，然后通过进程号来查看：
top -p1212 -p2323

[3] not use the following commands, use terminals in CORE directly.
# execute the following commands in gnome-terminal
cd /tmp/pycore.40288/n1.conf; gnome-terminal --hide-menubar --title=`pwd` --geometry=80x25+0+0 -x bash -c "./server-manet; sleep 10000"
cd /tmp/pycore.40288/n2.conf; gnome-terminal --hide-menubar --title=`pwd` --geometry=80x25+20+80 -x bash -c "./server-manet; sleep 10000"
cd /tmp/pycore.40288/n3.conf; gnome-terminal --hide-menubar --title=`pwd` --geometry=80x25+40+130 -x bash -c "./server-manet; sleep 10000"
gnome-terminal --hide-menubar --title=`pwd` --geometry=80x25+60+180 -x bash -c "cd /tmp/pycore.40288/n4.conf; ./server-manet; sleep 10000"
gnome-terminal --hide-menubar --title=`pwd` --geometry=80x25+80+230 -x bash -c "cd /tmp/pycore.40288/n5.conf; ./server-manet; sleep 10000"
gnome-terminal --hide-menubar --title=`pwd` --geometry=80x25+380+0 -x bash -c "cd /tmp/pycore.40288/n6.conf; ./server-manet; sleep 10000"
gnome-terminal --hide-menubar --title=`pwd` --geometry=80x25+420+80 -x bash -c "cd /tmp/pycore.40288/n7.conf; ./server-manet; sleep 10000"
gnome-terminal --hide-menubar --title=`pwd` --geometry=80x25+460+130 -x bash -c "cd /tmp/pycore.40288/n8.conf; ./server-manet; sleep 10000"
gnome-terminal --hide-menubar --title=`pwd` --geometry=80x25+500+180 -x bash -c "cd /tmp/pycore.40288/n9.conf; ./server-manet; sleep 10000"
gnome-terminal --hide-menubar --title=`pwd` --geometry=80x25+540+230 -x bash -c "cd /tmp/pycore.40288/n10.conf; ./server-manet; sleep 10000"
sleep 3
gnome-terminal --hide-menubar --title=`pwd` -x bash -c "cd /tmp/pycore.40288/n12.conf; ./client-manet; sleep 10000"

cd /root/桌面/server-client-pthread-c/m-MPE-manet-testing

[4]
elect the max IP and max links as Master, other as Slave.
Now, the Master is [10.0.0.9],
# execute the following commands in gnome-terminal
echo 10.0.0.9 > /tmp/pycore.40288/n1.conf/masterip.txt
echo 10.0.0.9 > /tmp/pycore.40288/n2.conf/masterip.txt
echo 10.0.0.9 > /tmp/pycore.40288/n3.conf/masterip.txt
echo 10.0.0.9 > /tmp/pycore.40288/n4.conf/masterip.txt
echo 10.0.0.9 > /tmp/pycore.40288/n5.conf/masterip.txt
echo 10.0.0.9 > /tmp/pycore.40288/n6.conf/masterip.txt
echo 10.0.0.9 > /tmp/pycore.40288/n7.conf/masterip.txt
echo 10.0.0.9 > /tmp/pycore.40288/n8.conf/masterip.txt
echo 10.0.0.9 > /tmp/pycore.40288/n9.conf/masterip.txt
echo 10.0.0.9 > /tmp/pycore.40288/n10.conf/masterip.txt
echo 10.0.0.9 > /tmp/pycore.40288/n12.conf/masterip.txt

echo 0 > /tmp/pycore.40288/n1.conf/ctrl.txt
echo 0 > /tmp/pycore.40288/n2.conf/ctrl.txt
echo 0 > /tmp/pycore.40288/n3.conf/ctrl.txt
echo 0 > /tmp/pycore.40288/n4.conf/ctrl.txt
echo 0 > /tmp/pycore.40288/n5.conf/ctrl.txt
echo 0 > /tmp/pycore.40288/n6.conf/ctrl.txt
echo 0 > /tmp/pycore.40288/n7.conf/ctrl.txt
echo 0 > /tmp/pycore.40288/n8.conf/ctrl.txt
echo 1 > /tmp/pycore.40288/n9.conf/ctrl.txt
echo 0 > /tmp/pycore.40288/n10.conf/ctrl.txt

[5]
elect the max IP and max links as Master, other as Slave.
Now, the Master is [10.0.0.10],
# execute the following commands in gnome-terminal
echo 10.0.0.10 > /tmp/pycore.40288/n1.conf/masterip.txt
echo 10.0.0.10 > /tmp/pycore.40288/n2.conf/masterip.txt
echo 10.0.0.10 > /tmp/pycore.40288/n3.conf/masterip.txt
echo 10.0.0.10 > /tmp/pycore.40288/n4.conf/masterip.txt
echo 10.0.0.10 > /tmp/pycore.40288/n5.conf/masterip.txt
echo 10.0.0.10 > /tmp/pycore.40288/n6.conf/masterip.txt
echo 10.0.0.10 > /tmp/pycore.40288/n7.conf/masterip.txt
echo 10.0.0.10 > /tmp/pycore.40288/n8.conf/masterip.txt
echo 10.0.0.10 > /tmp/pycore.40288/n9.conf/masterip.txt
echo 10.0.0.10 > /tmp/pycore.40288/n10.conf/masterip.txt
echo 10.0.0.10 > /tmp/pycore.40288/n12.conf/masterip.txt

echo 0 > /tmp/pycore.40288/n1.conf/ctrl.txt
echo 0 > /tmp/pycore.40288/n2.conf/ctrl.txt
echo 0 > /tmp/pycore.40288/n3.conf/ctrl.txt
echo 0 > /tmp/pycore.40288/n4.conf/ctrl.txt
echo 0 > /tmp/pycore.40288/n5.conf/ctrl.txt
echo 0 > /tmp/pycore.40288/n6.conf/ctrl.txt
echo 0 > /tmp/pycore.40288/n7.conf/ctrl.txt
echo 0 > /tmp/pycore.40288/n8.conf/ctrl.txt
echo 0 > /tmp/pycore.40288/n9.conf/ctrl.txt
echo 1 > /tmp/pycore.40288/n10.conf/ctrl.txt


//******************** server-manet.c

int ctrl;			//global variable
int changed=0;
int pipe_fd[2];
char *masterip;
char *self_ip;

//read * from client-manet.c
//模拟 流程执行，数据库更新的事件，事件驱动 数据库同步
void *handle_client(void *arg)
{
	bind(listener, self_ip);
	int pipe_write = *((int *)arg);
	while (1) {
		CHK2(client, accept(listener, (struct sockaddr *)&peer, &socklen));
		while (1) {
			CHK2(len, recv(client, clientmsg, CLIENTMSG_SIZE, MSG_NOSIGNAL));
			CHK(write(pipe_write, clientmsg, strlen(clientmsg)));	//send MSG to m_thread(void *arg)
		}
	}
}

int main(int argc, char *argv[])
{
	sprintf(self_ip,"%s",getipaddress("enp13s0"));

	pthread_create(&readctrl, NULL, read_ctrl, NULL);
	pthread_create(&writer, NULL, handle_client, (void *)&pipe_fd[1]);
	while (1) {
			pthread_create(&tid, NULL, master, NULL);	//ctrl==1
		or
			pthread_create(&tid, NULL, slave, NULL);	//ctrl==0
	}
}

void *read_ctrl(void *arg)
{
	while (1) {
		ctrl <- read from ctrl.txt;					//global variable, echo 1 >ctrl.txt
		masterip <- read from masterip.txt;			//global variable, echo 1.1.1.1 >masterip.txt
		master_ip = ip2uint(getipaddress(masterip));
		if (master_ip!=prev_ip) {
			replaceline(hosts, line, "masterip   mpe.localhost");		//update hosts
		}
	}
}

void *slave(void *arg)
{
	connect(sock, masterip);
	while (1)
	{
		if (changed) break;
		recv(sock, buf, BUF_SIZE, MSG_NOSIGNAL);	//read * from master
	}
}

void *master(void *arg)
{
	sprintf(self_ip,"%s",getipaddress("enp13s0"));
	bind(listener, self_ip);
	while (1) {
		if (changed) break;
		CHK2(client, accept(listener, (struct sockaddr *)&peer, &socklen));
		int rt = pthread_create(&reader, NULL, m_thread, (void *)&client);
	}
}

//event_driven, read pipe_fd[0] from handle_client(void *arg) which read * from client-manet.c 
void *m_thread(void *arg)
{
	int client = *((int *)arg);
	CHK(epoll_ctl(epfd, EPOLL_CTL_ADD, pipe_fd[0], &ev));
	//使用epoll模拟 流程执行，数据库更新的事件，事件驱动 数据库同步
	while (1) {		//communication between master & slave
		if (changed) break;
		if((epoll_events_count = epoll_wait(epfd, events, 1, EPOLL_RUN_TIMEOUT)) < 0){
			sleep(1);
			continue;
		}
		for (int i = 0; i < epoll_events_count; i++) {
			if (events[i].data.fd == pipe_fd[0])	//管道读端，从client-manet.c接受信息
			{
				CHK2(res, read(pipe_fd[0], clientmsg, CLIENTMSG_SIZE));
				CHK(send(client, "synchronous data", strlen("synchronous data"), MSG_NOSIGNAL));
			}
		}
	}
}
//******************** server-manet.c


//******************** server-manet-slave.c
int main(int argc, char *argv[])
{
	sprintf(self_ip,"%s",getipaddress("enp13s0"));
	pthread_create(&readctrl, NULL, read_ctrl, NULL);
	while (1) {
		pthread_create(&tid, NULL, slave, NULL);
		pthread_join(tid, &tret);
	} //end while

}

void *read_ctrl(void *arg)
{
	char filename[6] = "hosts";	//set master_ip in /etc/hosts
	uint32_t me_ip = ip2uint(getipaddress("enp13s0"));
	while (1) {
		ctrl <- read from ctrl_slave.txt;			//global variable, echo 0 >ctrl_slave.txt
		masterip <- read from masterip.txt;			//global variable, echo 1.1.1.1 >masterip.txt
		master_ip = ip2uint(getipaddress(masterip));
		if (master_ip!=prev_ip) {
			replaceline(hosts, line, "masterip   mpe.localhost");		//update hosts
		}
	}
}

void *slave(void *arg)
{
	connect(sock, masterip);
	while (1)
	{
		if (changed) break;
		recv(sock, buf, BUF_SIZE, MSG_NOSIGNAL));
	}
}
//******************** server-manet-slave.c


//******************** client-manet.c
int main(int argc, char *argv[])
{
	masterip <- read from masterip.txt;			//global variable, echo 1.1.1.1 >masterip.txt
	connect(sock, masterip);
	CHK(send(sock, "running process, update database", strlen("running process, update database"), 0));
}
//******************** client-manet.c
