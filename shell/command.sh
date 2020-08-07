kubectl命令补全
source <(kubectl completion bash)
echo "source <(kubectl completion bash)" >> ~/.bashrc

# 磁盘空间
ncdu

# 使用说明
tldr 

# 请求模拟
httpie

# 美观的diff
diff-so-fancy

# 容器信息
portainer
ctop
lazydocker

# 系统信息查看
glances

# 模糊搜索
fzf

# 跳转目录
j && z

# 强大的grep
ripgrep

# 强大的find
fd

# 进程后台运行
nohup、screen、supervisor、disown pm2

# curl
curl -svk 'http://127.0.0.1/pabc2/ddd/n/dataset/?flt0_1=1300' -H Host:aaaa.abdo.com

正则非
（(?=p)、(?!p)、(?<=p)和(?<!p)）
/^(?=.*hello)(?!.*world).*$/im.test(page)

iptables日志输出调试 RAW链表
iptables -t raw -A PREROUTING -p icmp -j TRACE
iptables -t raw -A OUTPUT -p icmp -j TRACE

批量查看证书状态
for i in `cat just.com.cn | awk '{print $1".just.com.cn"}'`;do echo $i; timeout 1 openssl s_client -servername $i -connect $i:443 2>/dev/null | openssl x509 -noout -dates ; echo "---------------------------------" ; done

Json工具
jq -r ".client_ip" downloaded_data.txt  | sort -n | uniq -c | wc -l

统计redis连接IP
redis-cli -h 10.21.40.3 client list | awk -F'=' '{print $3}' | awk -F':' '{print $1}' | sort -n | uniq -c | sort -nr

统计多个URL返回时间
cat /var/log/web/api-interface.access.log | grep -E "/v1/interface/detail|/v2/index/recommend|/v2/index/data" | awk -F' ' '$2>0.5{print $0}'

统计接口平均响应时间
cat /var/log/web/api-interface.access.log | grep "/v1/interface/detail" | awk '{sum +=$2;} END {print "sum =" sum; print "average = "sum/NR}'

设置用户ACL
setfacl -m u:zabbix:r-- /var/log/php-fpm/error.log

空格前缀替换
sed -i -E "s|^#([[:space:]]?)awx_official=false|awx_official=true|g" installer/inventory

notepad++删除关键字包含的行，使用查找替换
^.*关键字.*$

sed 删除匹配行和匹配行后2行 https://blog.51cto.com/wujianwei/2417796 、https://www.cnblogs.com/muahao/p/6290813.html
sed '/muahao/,+2d' file

备份Jenkins job，批量修改config.xml，并reload job
find /data/jenkins_home/jobs/ -name "config.xml" | grep "for-test" | xargs -I {} cp {} {}_bak_20190907_hitom
find /data/jenkins_home/jobs/ -name "config.xml" | grep "for-test" | xargs sed -i 's#  <canRoam>true</canRoam>#  <canRoam>false</canRoam>#g'
find /data/jenkins_home/jobs/ -name "config.xml" | grep "for-test" | xargs sed -i '/\/scm/a\  <assignedNode>t1-jenkins-slave</assignedNode>'
find /data/jenkins_home/jobs/ -name "*for-test" | grep "for-test" | awk -F'/' '{print $NF}' | xargs -I {} curl -u hitom:token -X POST http://pipeline.just.live/view/test/job/{}/reload

流量复制
./gor --input-raw :80 --output-http "http://39.97.158.141:8361" --http-allow-method POST  --http-allow-url ^/isz_thirdparty/NetworkHandleInterController. --http-rewrite-url isz_thirdparty/NetworkHandleInterController/notifyData:open/coop/installment/callback/alipayCallBack

查看swap内存被哪些进程占用（输出单位是MByte）
for i in `cd /proc;ls |grep "^[0-9]"|awk ' $0 >100'` ;do awk '/Swap:/{a=a+$2}END{print '"$i"',a/1024"M"}' /proc/$i/smaps ;done 2>&1 |sort -k2nr |head

清理swap
swapoff -a && swapon -a
注意：这样清理有个前提条件，空闲的内存必须比已经使用的swap空间大。

匹配filename*服务，启动
find /etc/init.d/ -name "filename*" | awk -F/ '{print $4}' |xargs -i service {} start

查找包含关键字的jar文件，并打印
find -type f -name "*.jar" | xargs -t -I {} /opt/filename/quetapp/jre/bin/jar -tvf {} | grep -c --color=auto commons-collections

显示文件中的配置，不显示注释和空格开头的行
grep -Ev "^$|^[#;]" server.conf

显示file文件中匹配foo字串那行以及上下5行
grep -C 5 foo file  

去掉脚本中的^M
dos2unix a.txt b.txt

去掉脚本中的\r
sed -i ‘s/\r//’  test.file

除掉#号开头和空格开头
sed -i -c -e '/^$/d;/^#/d'

匹配以xxx开头行打印  ^开头 $结尾
sed -n  '/^xxx/p' filename 

替换以xxx开头的行的文件内容   ^开头 $结尾  .*一个或多个
sed -i 's/^xxx.*/&yyy/g'   filename

删除空白行：
sed '/^$/d' file

清空文件
find -type f -name "ca*out" |  xargs truncate -s 0

过滤启动的配置
grep -vE '^\s*#|^$' /opt/filename/database/pgsql/data/postgresql.conf

升级jre，更改启动脚本
find /etc/init.d/ -name "filename*" | xargs -I {} sed -i 's/Xss128k/Xss256k/g' {}

排除server目录
find ./ -path './server*' -a -prune -o -type f -name "*.jar" | xargs -t -I {} /opt/filename/quetapp/jre/bin/jar -tvf {} | grep com/google/gwt/user/client/rpc/RemoteService

查看crontab
 for user in $(cat /etc/passwd | cut -f1 -d:); do crontab -l -u $user; done

For循环统计接口返回时间
for i in {1..100} ;do curl -x 10.21.50.10:80 -o /dev/null -s -w "time_connect: %{time_connect}\ntime_starttransfer: %{time_starttransfer}\ntime_total: %{time_total}\n" -XGET "http://boss.just.live/app/queryConfig?cityId=1366&modelType=13&version=V1.10.2"; echo "------------$i-------------"; done | grep -v 0.

过滤统计
awk -F'from=<' '/state=sent/ && /meicai.cn/ {print $2}' mail.log  | awk -F'>' '{sum[$1]++}END{for(i in sum){if (sum[i]>1000) print sum[i],$1}}'

查看当前进程打开了多少句柄数
 lsof -n|awk '{print $2}'|sort|uniq -c|sort -nr|more

去掉txt结尾 \r
sed -i ’s/\r//’ filename  

显示sql命令执行时间
\timing

screen配置
vim /etc/.bashrc 末尾添加
[ -z "$PS1" ] && return
screen -xROU

vim /etc/screenrc 末尾添加
caption always "%{= kw}%-w%{= kG}%{+b}[%n %t]%{-b}%{= kw}%+w %=%d %M %0c %{g}%H%{-}"
按键说明：
C-a c -> 创建一个新的运行shell的窗口并切换到该窗口
C-a n -> Next，切换到下一个 window 
C-a p -> Previous，切换到前一个 window 
C-a 0..9 -> 切换到第 0..9 个 window
Ctrl+a [Space] -> 由视窗0循序切换到视窗9
C-a C-a -> 在两个最近使用的 window 间切换 
C-a x -> 锁住当前的 window，需用用户密码解锁
C-a d -> detach，暂时离开当前session，将目前的 screen session (可能含有多个 windows) 丢到后台执行，并会回到还没进 screen 时的状态，此时在 screen session 里，每个 window 内运行的 process (无论是前台/后台)都在继续执行，即使 logout 也不影响。 
C-a z -> 把当前session放到后台执行，用 shell 的 fg 命令则可回去。
C-a w -> 显示所有窗口列表




json格式化输出
在curl命令后面添加 | python -m json.tool 

CPU使用率
mpstat -P ALL 查看各个cpu核心的使用率情况

追踪进程使用率原因
perf top -g -p pidname

git clone加速
git config --global http.postBuffer 524288000

Linux服务器mailx命令发信
echo '123xkl php7 失败并重启' | mailx -v -s "xkl php7 失败并重启"  mail@qq.com
------------------------------------------------------------------------------------------------------------
cat > /etc/nail.rc << EOF
set from=mail@drem.xyz   
set smtp=smtp://mail.drem.xyz:465
set smtp-auth-user=mail@mail.drem.xyz
set smtp-auth-password=mail
set smtp-auth=login
#set ssl-verify=ignore
#set nss-config-dir=/etc/pki/nssdb
EOF

from：发送的邮件地址（真实地址，我测试时候直接写justin发送邮件失败），对方显示的发件人
smtp：发生的外部smtp服务器的地址
smtp-auth-user：外部smtp服务器认证的用户名
smtp-auth-password：外部smtp服务器认证的用户密码
smtp-auth：邮件认证的方式

shell 辅助
-n 只读取shell脚本，但不实际执行
-x 进入跟踪方式，显示所执行的每一条命令
-c "string" 从strings中读取命令

Ctrl+a
光标回到命令行首*
Ctrl+e
光标回到命令行尾*
Ctrl+f
光标右移一个字符（相当于方向键右键）
Ctrl+b
光标左移一个字符（相当于方向键左键）
Ctrl+k
剪切（删除）光标处到行尾的字符*
Ctrl+u
剪切（删除）光标处到行首的字符*
Ctrl+w
剪切（删除）光标前的一个单词
Ctrl+y
粘贴Ctrl+u，Ctrl+k，Ctrl+w删除的文本
Ctrl+c
中断终端正在执行的任务或者删除整行*
Ctrl+h
删除光所在处的前一个字符（相当于退格键）
Ctrl+d
推出当前shell命令行*
Ctrl+r
搜索命令行使用过的历史命令记录*
Ctrl+g
从执行Ctrl+r的搜索历史命令模式退出
Ctrl+l
清楚屏幕所有内容，并在屏幕最上面开始一个新行，等同clear命令*
Ctrl+s
锁定终端，使之无法输入内容
Ctrl+q
解锁执行Ctrl+s的锁定状态
Ctrl+z
暂停执行在终端运行的任务*
Ctrl+Insert
复制命令行内容*
Shift+Insert
粘贴命令行内容*
!!
执行上一条命令
!$
上一条命令的最后一个参数，相当于Esc+.
Esc+.
获取上一条命令的最后的部分（空格分割）*
Esc+b
移动到当前单词的开头
Esc+f
移动到当前单词的结尾
Esc+t
颠倒光标所在处及其相邻单词的位置

ubuntu 修改默认sh
dpkg-reconfigure dash

查看docker image文件内容
curl -OL https://github.com/wagoodman/dive/releases/download/v0.5.0/dive_0.5.0_linux_amd64.rpm
rpm -i dive_0.5.0_linux_amd64.rpm

dive <your-image-tag>

清理10个版本以上的文件
cd /home/releases && ls -t |tail -n +10 | xargs rm -rf

查找redis占用内存最大的键值
https://github.com/sripathikrishnan/redis-rdb-tools
rdb -c memory /var/redis/6379/dump.rdb --bytes 128 -f memory.csv
sort -t, -k4nr memory.csv  | more 

redis-cli --bigkeys

redis配置文件 设置最大内存限制
maxmemory 16G

redis中的list操作命令中删除指定key中的所有记录命令：
ltrim key 1 0

 
即 ltrim key start end 中的start要比end大即可，数值且都为正数。

清理laqueue队列queues:laqueue.queue

itrim queues:laqueue.queue 1 0

 0,list,queues:laqueue.queue,21099023003,quicklist,40892059,407333
0,list,queues:laqueue.upfile-queue,1405524042,quicklist,504060,2846
0,list,queues:laqueue.wechat-notice-queue,1222155627,quicklist,967427,1765
0,list,queues:laqueue.delayed-queue,817584884,quicklist,318332,2673
0,list,queues:laqueue.notice-queue,25244311,quicklist,20889,1332
0,list,queues:laqueue.door-lock-queue,8779802,quicklist,12633,709

Nodejs-npm安装
curl -sL https://rpm.nodesource.com/setup_10.x | sudo bash -
yum install nodejs

jenkins groovy 

rollback_version_list=("/bin/bash /opt/deploy_scripts/test.sh").execute()
rollback_version_list.text.readLines().collect{it}

[root@technology deploy_scripts]# /bin/bash test.sh 
44K
test.sh

# 导入Jenkins config.xml
java -jar jenkins-cli.jar -s https://127.0.0.1:8080/ -webSocket -auth username:token  create-job new-job < config.xml

磁盘性能测试
yum install epel-release
fio -filename=/tmp/test -direct=1 -iodepth 1 -thread -rw=randrw -rwmixread=70 -ioengine=psync -bs=16k -size=10G -numjobs=30 -runtime=100 -group_reporting -name=mytest1

pip安装源加速
mkdir ~/.pip
cat > ~/.pip/pip.conf << EOF
[global]
trusted-host=mirrors.aliyun.com
index-url=https://mirrors.aliyun.com/pypi/simple/
EOF

\\index-url = https://pypi.tuna.tsinghua.edu.cn/simple 清华源

设置java环境变量

echo 'export PGPASSWORD=post' >> /root/.bashrc
echo 'export PGDATABASE=filename' >> /root/.bashrc
echo 'export PGUSER=postgres' >> /root/.bashrc
echo 'export PGHOST=localhost' >> /root/.bashrc
echo 'export PGPORT=5432' >> /root/.bashrc

echo 'export JAVA_HOME=/opt/jdk1.8.0_191' >> /root/.bashrc
echo 'export PATH=$PATH:$JAVA_HOME/bin' >> /root/.bashrc
source /root/.bashrc

查看java CPU状态
curl -sLk 'https://raw.github.com/oldratlee/useful-scripts/release/show-busy-java-threads' | bash

JVM -verbose参数详解

1. 在程序运行的时候有多少类被加载！你可以用verbose:class来监视，在命令行输入java -verbose:class XXX  (XXX为程序名)你会在控制台看到加载的类的情况。

2.在虚拟机发生内存回收时在输出设备显示信息，格式如下： [Full GC 256K->160K(124096K), 0.0042708 secs] 该参数用来监视虚拟机内存回收的情况。

3.在虚拟机调用native方法时输出设备显示信息，格式如下： [Dynamic-linking native method.lang.Object.registerNatives ... JNI] 该参数用来监视虚拟机调用本地方法的情况，在发生jni错误时可为诊断提供便利。

查看整个JVM内存状态 
jmap -heap [pid]
要注意的是在使用CMS GC 情况下，jmap -heap的执行有可能会导致JAVA 进程挂起

查看JVM堆中对象详细占用情况
jmap -histo [pid]

导出整个JVM 中内存信息
jmap -dump:format=b,file=文件名 [pid]

查看java进程

jps -v

查看JVM的GC情况
使用jstat工具查看，语法为：
jstat [ generalOption | outputOptions vmid [interval[s|ms] [count]] ]参数解释：
*Options   -选项，我们一般使用-gcutil查看GC情况
vmid      -VM的进程号，即当前运行的java进程号
interval   -间隔时间，单位为秒或毫秒

jstat  -gcutil  10142  3000 

参数说明如下：
S0     -Heap上的Survivor space 0区已使用空间的百分比
S1     -Heap上的Survivor space 1区已使用空间的百分比
E      -Heap上Eden space区已使用空间的百分比
O      -Heap上的Old space区已使用空间的百分比，达到100%，就是内存溢出了
P       -Perm space区已使用空间的百分比，达到100%，就是内存溢出了
YGC    -从应用程序启动到采样时发生Yang GC 的次数
YGCT   -从应用程序启动到采样时Yang GC所用的时间【单位秒】
FGC    -从应用程序启动到采样时Full GC的次数
FGCT   -从应用程序启动到采样时Full GC所用的时间
GCT    -从应用程序启动到采样时用于垃圾回收的总时间【单位秒】
通过监控O、P数值情况，再次调整JAVA_OPTS相关参数大小达到优化目的。

JDK内置工具使用

jps(Java Virtual Machine Process Status Tool)
        查看所有的jvm进程，包括进程ID，进程启动的路径等等。
jstack(Java Stack Trace)
        ① 观察jvm中当前所有线程的运行情况和线程当前状态。
        ② 系统崩溃了？如果java程序崩溃生成core文件，jstack工具可以用来获得core文件的java stack和native stack的信息，从而可以轻松地知道java程序是如何崩溃和在程序何处发生问题。
        ③ 系统hung住了？jstack工具还可以附属到正在运行的java程序中，看到当时运行的java程序的java stack和native stack的信息, 如果现在运行的java程序呈现hung的状态，jstack是非常有用的。
 jstat(Java Virtual Machine Statistics Monitoring Tool)
        ① jstat利用JVM内建的指令对Java应用程序的资源和性能进行实时的命令行的监控，包括了对进程的classloader，compiler，gc情况；
        ②监视VM内存内的各种堆和非堆的大小及其内存使用量，以及加载类的数量。
jmap(Java Memory Map)
        监视进程运行中的jvm物理内存的占用情况，该进程内存内，所有对象的情况，例如产生了哪些对象，对象数量；
jinfo(Java Configuration Info)
        观察进程运行环境参数，包括Java System属性和JVM命令行参数

例子参考：http://www.cnblogs.com/lcword/p/5857686.html
dns  180.76.76.76 百度
119.29.29.29 腾讯

抓包
tcpdump -i eth0 -A udp and port 514 | grep 10.6

Rsyslog审计
客户机
1.vi /etc/profile
function command2syslog
{
        auid_command=$(history 1|{ read x cmd; echo "$cmd"; })
        re=logname|grep "no login name"
        if [ "$re" == "" ];then
            auid_ip=$(who am i | awk '{print $1 $5}')
        else
            auid_ip="root (localhost)"
        fi
        logger -t 'CMD' -p user.notice -- : $auid_ip :  $auid_command CMD
}

2.cat /etc/rsyslog.conf 最后一行添加
user.*                                          @10.19.53.27

服务器
#cat /etc/rsyslog.conf

15：$ModLoad imudp
16：$UDPServerRun 514

30：$template FileFormat,"%syslogtag% [%TIMESTAMP%] %programname% %fromhost-ip% %msg:::sp-if-no-1st-sp%%msg:::drop-last-lf%\n"
31：$ActionFileDefaultTemplate  FileFormat
63：user.none;*.info;mail.none;authpriv.none;cron.none                /var/log/messages

99：$SystemLogRateLimitInterval 1000
100：$SystemLogRateLimitBurst 3000


sed命令
a\ 在当前行下面插入文本。
i\ 在当前行上面插入文本。
c\ 把选定的行改为新的文本。
d 删除，删除选择的行。
D 删除模板块的第一行。
s 替换指定字符
h 拷贝模板块的内容到内存中的缓冲区。
H 追加模板块的内容到内存中的缓冲区。
g 获得内存缓冲区的内容，并替代当前模板块中的文本。
G 获得内存缓冲区的内容，并追加到当前模板块文本的后面。
l 列表不能打印字符的清单。
n 读取下一个输入行，用下一个命令处理新的行而不是用第一个命令。
N 追加下一个输入行到模板块后面并在二者间嵌入一个新行，改变当前行号码。
p 打印模板块的行。
P(大写) 打印模板块的第一行。
q 退出Sed。
b lable 分支到脚本中带有标记的地方，如果分支不存在则分支到脚本的末尾。
r file 从file中读行。
t label if分支，从最后一行开始，条件一旦满足或者T，t命令，将导致分支到带有标号的命令处，或者到脚本的末尾。
T label 错误分支，从最后一行开始，一旦发生错误或者T，t命令，将导致分支到带有标号的命令处，或者到脚本的末尾。
w file 写并追加模板块到file末尾。  
W file 写并追加模板块的第一行到file末尾。  
! 表示后面的命令对所有没有被选定的行发生作用。  
= 打印当前行号码。  
# 把注释扩展到下一个换行符以前。  
sed替换标记
g 表示行内全面替换。  
p 表示打印行。  
w 表示把行写入一个文件。  
x 表示互换模板块中的文本和缓冲区中的文本。  
y 表示把一个字符翻译为另外的字符（但是不用于正则表达式）
\1 子串匹配标记
& 已匹配字符串标记
sed元字符集
^ 匹配行开始，如：/^sed/匹配所有以sed开头的行。
$ 匹配行结束，如：/sed$/匹配所有以sed结尾的行。
. 匹配一个非换行符的任意字符，如：/s.d/匹配s后接一个任意字符，最后是d。
* 匹配0个或多个字符，如：/*sed/匹配所有模板是一个或多个空格后紧跟sed的行。
[] 匹配一个指定范围内的字符，如/[ss]ed/匹配sed和Sed。  
[^] 匹配一个不在指定范围内的字符，如：/[^A-RT-Z]ed/匹配不包含A-R和T-Z的一个字母开头，紧跟ed的行。
\(..\) 匹配子串，保存匹配的字符，如s/\(love\)able/\1rs，loveable被替换成lovers。
& 保存搜索字符用来替换其他字符，如s/love/**&**/，love这成**love**。
\< 匹配单词的开始，如:/\<love/匹配包含以love开头的单词的行。
\> 匹配单词的结束，如/love\>/匹配包含以love结尾的单词的行。
x\{m\} 重复字符x，m次，如：/0\{5\}/匹配包含5个0的行。
x\{m,\} 重复字符x，至少m次，如：/0\{5,\}/匹配至少有5个0的行。
x\{m,n\} 重复字符x，至少m次，不多于n次，如：/0\{5,10\}/匹配5~10个0的行。

# 统计指定天数的文件中，所有IP的tcp_ttr、request_time平均值
find -name "access.log.gz" | grep -E "12|13|14" | xargs -I {} zcat {} | awk '$13=="/nb/ping.txt" {print $13,$7,$16,$NF}' | awk '{ip_sum[$4]++ {tcp_rtt[$4]+=$2 request_time[$4]+=$3}END {for (i in ip_sum) print "tcp_rtt(ms): "tcp_rtt[i]/ip_sum[i]/1000,"request_time(ms): "request_time[i]/ip_sum[i],i,"ip_count: "ip_sum[i]} ' OFS="\t"

