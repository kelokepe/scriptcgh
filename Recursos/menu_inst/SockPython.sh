#By @ChumoGH|Plus
#19/05/2020
#UPDATE 01/03/2023
#NUNCA DEJES DE APRENDER!!

_Key='/etc/cghkey'

clear

[[ ! -e ${_Key} ]] && exit 

clear
function chekKEY {
[[ -z ${IP} ]] && IP=$(cat < /bin/ejecutar/IPcgh)
[[ -z ${IP} ]] && IP=$(wget -qO- ifconfig.me)
Key="$(cat /etc/cghkey)"
_double=$(curl -sSL "https://raw.githubusercontent.com/kelokepe/scriptcgh/main/Control/Control-Bot.txt")
IiP="$(ofus "$Key" | grep -vE '127\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | grep -o -E '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}')"
[[ -e /file ]] && _double=$(cat < /file) ||  {
wget -q -O /file https://raw.githubusercontent.com/kelokepe/scriptcgh/main/Control/Control-Bot.txt
_double=$(cat < /file)
}
_check2="$(echo -e "$_double" | grep ${IiP})"
[[ ! -e /etc/folteto ]] && {
wget --no-check-certificate -O /etc/folteto $IiP:81/ChumoGH/checkIP.log 
cheklist="$(cat /etc/folteto)"
echo -e "$(echo -e "$cheklist" | grep ${IP})" > /etc/folteto
}
[[ -z ${_check2} ]] && {
mss_='\n BotGEN NO AUTORIZADO POR @ChumoGH '
cat <<EOF >/bin/menu
clear && clear
echo -e "\n\n\033[1;31m==================================================\n �� �253 KEY BANEADA  �253 ! CONTACTE Su ADMINISTRADOR! \n==================================================\n �� FECHA DE BANEO :$(date +%d/%m/%Y) HORA :$(date +%H:%M:%S) \n==================================================\n\n�� ${mss_} \n\n==================================================\n"
echo -e " \e[1;32m     --- SI CONSIDERA QUE FUE UN ERROR  ---  " | pv -qL 60
echo -e " \e[1;32m     -- ${mss_} --  " | pv -qL 60
echo -e "\n \e[1;93m           --- TECLEA  \e[1;93m --- \e[1;97mcgh -fix\e[1;93m ---  " | pv -qL 50
echo -e "\n\033[1;31m==================================================\n\n"
#echo "/etc/adm-lite/menu" > /bin/menu && chmod +x /bin/menu
EOF

rm -f /etc/folteto
rm -f /etc/adm-lite/menu*
 			MENSAJE="${TTini}${m3ssg}MSG RECIVIDO${m3ssg}${TTfin}\n"
			MENSAJE+=" ---------------------------------------------\n"
			MENSAJE+=" IP Clon: ${IP} Rechazada\n"
			MENSAJE+=" ---------------------------------------------\n"
			MENSAJE+=" INSECTO DETECTADO EN Sock Python\n"
			MENSAJE+=" ---------------------------------------------\n"
			MENSAJE+=" Key : ${Key}\n"
			MENSAJE+=" ---------------------------------------------\n"
			MENSAJE+=" HORA : $(printf '%(%D-%H:%M:%S)T')\n"
			MENSAJE+=" ---------------------------------------------\n"
			MENSAJE+="       ${rUlq} Bot ADMcgh de keyS ${rUlq}\n"
			MENSAJE+="           ${pUn5A} By @ChumoGH ${pUn5A} \n"
			MENSAJE+=" ---------------------------------------------\n"	
			curl -s --max-time 10 -d "chat_id=$ID&disable_web_page_preview=1&text=$(echo -e "$MENSAJE")" $urlBOT &>/dev/null 	
exit && exit
}
}

source <(curl -sSL https://raw.githubusercontent.com/kelokepe/scriptcgh/main/Recursos/module)
[[ -e /bin/ejecutar/msg ]] && source /bin/ejecutar/msg
msg -bar3
ADM_inst="/etc/adm-lite" && [[ ! -d ${ADM_inst} ]] && exit
system=$(cat -n /etc/issue |grep 1 |cut -d ' ' -f6,7,8 |sed 's/1//' |sed 's/      //')
vercion=$(echo $system|awk '{print $2}'|cut -d '.' -f1,2)
echo -e "ESPERE UN MOMENTO MIENTRAS FIXEAMOS SU SISTEMA "

fun_upgrade() {
	sync
	echo 3 >/proc/sys/vm/drop_caches
	sync && sysctl -w vm.drop_caches=3
	sysctl -w vm.drop_caches=0
	swapoff -a
	swapon -a
sudo apt install software-properties-common -y &> /dev/null
apt install python2 -y &> /dev/null
sudo update-alternatives --install /usr/bin/python python /usr/bin/python2 1 &> /dev/null
	rm -rf /tmp/* > /dev/null 2>&1
	killall kswapd0 > /dev/null 2>&1
	killall tcpdump > /dev/null 2>&1
	killall ksoftirqd > /dev/null 2>&1
	echo > /etc/fixpython
}

function aguarde() {
	sleep .1
	echo -e "SU VERSION DE UBUNTU ${vercion} ES SUPERIOR A 18.04 "
	helice() {
		fun_upgrade >/dev/null 2>&1 &
		tput civis
		while [ -d /proc/$! ]; do
			for i in / - \\ \|; do
				sleep .1
				echo -ne "\e[1D$i"
			done
		done
		tput cnorm
	}
	echo -ne "\033[1;37m OPTIMIZANDO Y \033[1;32mFIXEANDO \033[1;37mPYTHON \033[1;32m.\033[1;32m.\033[1;33m.\033[1;31m. \033[1;33m"
	helice
	echo -e "\e[1DOk"
}

[[ "${vercion}" > "20" ]] && {
echo -e ""
msg -bar3
[[ -e /etc/fixpython ]] || aguarde
} || {
echo
	[[ -e /etc/fixpython ]] || { 
	echo -e "	SU VERSION DE UBUNTU ${vercion} ES INFERIOR O 18.04 "
	apt-get install python -y &>/dev/null
	apt-get install python3 -y &>/dev/null
	touch /etc/fixpython
	}
}

clear

mportas () {
unset portas
portas_var=$(lsof -V -i tcp -P -n | grep -v "ESTABLISHED" |grep -v "COMMAND" | grep "LISTEN")
while read port; do
var1=$(echo $port | awk '{print $1}') && var2=$(echo $port | awk '{print $9}' | awk -F ":" '{print $2}')
[[ "$(echo -e $portas|grep "$var1 $var2")" ]] || portas+="$var1 $var2\n"
done <<< "$portas_var"
i=1
echo -e "$portas"
}

stop_all () {
_ps="$(ps x)"
    ck_py=$(lsof -V -i tcp -P -n | grep -v "ESTABLISHED" |grep -v "COMMAND"|grep "python")
	[[ -z ${ck_py} ]] && ck_py=$(lsof -V -i tcp -P -n | grep -v "ESTABLISHED" |grep -v "COMMAND"|grep "WS-Epro")
    if [[ -z $(echo "$ck_py" | awk '{print $1}' | head -n 1) ]]; then
        print_center -verm "Puertos PYTHON no encontrados"
        msg -bar3
    else
    ck_port=$(echo "$ck_py" | awk '{print $9}' | awk -F ":" '{print $2}')
	[[ -z ${ck_port} ]] && ck_port=$(echo -e "${_ps}" | grep PDirect | grep -v grep | awk '{print $7}')
	for i in $ck_port; do
	    kill -9 $(echo -e "${_ps}"| grep PDirect | grep -v grep | head -n 1 | awk '{print $1}') &>/dev/null
            systemctl stop python.${i} &>/dev/null
            systemctl disable python.${i} &>/dev/null
            rm -f /etc/systemd/system/python.${i}.service 
			rm -f /etc/adm-lite/PDirect
        done
			for pidproxy in $(screen -ls | grep ".ws" | awk {'print $1'}); do
						screen -r -S "$pidproxy" -X quit
			done
			[[ $(grep -wc "PDirect.py" /bin/autoboot) != '0' ]] && {
						sed -i '/PDirect/d' /bin/autoboot
						sed -i '/python/d' /bin/autoboot
			}
		rm -f /etc/adm-lite/PDirect
		screen -wipe &>/dev/null
		kill -9 $(echo -e "${_ps}" | grep -w python | grep -v grep | awk '{print $1}') &>/dev/null
        print_center -verd "Puertos PYTHON detenidos"
        msg -bar3    
    fi
    sleep 0.5
 }

stop_port () {
  sleep 0.5
    clear
    STPY="$(mportas | grep python| awk '{print $2}')"
    STPY+=" $(mportas |grep WS-Epro| awk '{print $2}')"
    msg -bar3
    print_center -ama "DETENER UN PUERTO"
    msg -bar3
    n=1
    for i in $STPY; do
        echo -e " \033[1;32m[$n] \033[1;31m> \033[1;37m$i\033[0m"
        pypr[$n]=$i
        let n++ 
    done

    msg -bar3
    echo -ne "$(msg -verd "  [0]") $(msg -verm2 ">") " && msg -bra "\033[1;41mVOLVER"
    msg -bar3
    echo -ne "\033[1;37m opcion: " && read prpy
    tput cuu1 && tput dl1

    [[ $prpy = "0" ]] && return
    systemctl stop python.${pypr[$prpy]} &>/dev/null
    systemctl disable python.${pypr[$prpy]} &>/dev/null
    rm /etc/systemd/system/python.${pypr[$prpy]}.service &>/dev/null
	sed -i "/ws${pypr[$prpy]}/d" /bin/autoboot &>/dev/null
	kill -9 $(echo -e "${_ps}"| grep -w "ws${pypr[$prpy]}" | grep -v grep | head -n 1 | awk '{print $1}') &>/dev/null
	kill  $(echo -e "${_ps}"| grep -w "${pypr[$prpy]}" | grep -v grep | awk '{print $1}') &>/dev/null
	sed -i '/PDirect${pypr[$prpy]}/d' /bin/autoboot
	screen -wipe &>/dev/null
    print_center -verd "PUERTO PYTHON ${pypr[$prpy]} RETIRADO"
    msg -bar3
    sleep 0.5
 }

colector(){
conect="$1"
    clear
    msg -bar3
    print_center -azu " Puerto Principal, para Proxy Directo"
    msg -bar3

while [[ -z $porta_socket ]]; do
    echo -ne "\033[1;37m Digite el Puerto: " && read porta_socket
	porta_socket=$(echo ${porta_socket}|sed 's/[^0-9]//g')
    tput cuu1 && tput dl1

        [[ $(mportas|grep -w "${porta_socket}") = "" ]] && {
            echo -e "\033[1;33m Puerto python:\033[1;32m ${porta_socket} VALIDO"
            msg -bar3
        } || {
            echo -e "\033[1;33m Puerto python:\033[1;31m ${porta_socket} OCUPADO" && sleep 1
            tput cuu1 && tput dl1
            unset porta_socket
        }
 done

 if [[ $conect = "PDirect" ]]; then
     print_center -azu " Puerto Local SSH/DROPBEAR/OPENVPN"
     msg -bar3

     while [[ -z $local ]]; do
        echo -ne "\033[1;97m Digite el Puerto: \033[0m" && read local
		local=$(echo ${local}|sed 's/[^0-9]//g')
        tput cuu1 && tput dl1

        [[ $(mportas|grep -w "${local}") = "" ]] && {
            echo -e "\033[1;33m Puerto local:\033[1;31m ${local} NO EXISTE" && sleep 1
            tput cuu1 && tput dl1
            unset local
        } || {
            echo -e "\033[1;33m Puerto local:\033[1;32m ${local} VALIDO"
            msg -bar3
			tput cuu1 && tput dl1
        }
    done
	msg -bar3
echo -e " Respuesta de Encabezado (101,200,484,500,etc)  \033[1;37m" 
msg -bar3
     print_center -azu "Response personalizado (enter por defecto 200)"
     print_center -ama "NOTA : Para OVER WEBSOCKET escribe (101)"
     msg -bar3
     echo -ne "\033[1;97m ENCABEZADO : \033[0m" && read response
	 response=$(echo ${response}|sed 's/[^0-9]//g')
     tput cuu1 && tput dl1
     if [[ -z $response ]]; then
        response="200"
        echo -e "\033[1;33m   CABECERA :\033[1;32m ${response} VALIDA"
    else
        echo -e "\033[1;33m   CABECERA :\033[1;32m ${response} VALIDA"
    fi
    msg -bar3
 fi

    if [[ ! $conect = "PGet" ]] && [[ ! $conect = "POpen" ]]; then
        print_center -azu "Introdusca su Mini-Banner"
        msg -bar3
        print_center -azu "Introduzca un texto [NORMAL] o en [HTML]"
        echo -ne "-> : "
        read texto_soket
    fi

    if [[ $conect = "PPriv" ]]; then
        py="python3"
        IP=$(fun_ip)
    elif [[ $conect = "PGet" ]]; then
        echo "master=ChumoGH" > ${ADM_tmp}/pwd.pwd
        while read service; do
            [[ -z $service ]] && break
            echo "127.0.0.1:$(echo $service|cut -d' ' -f2)=$(echo $service|cut -d' ' -f1)" >> ${ADM_tmp}/pwd.pwd
        done <<< "$(mportas)"
         porta_bind="0.0.0.0:$porta_socket"
         pass_file="${ADM_tmp}/pwd.pwd"
         py="python"
    else
        py="python"
    fi
[[ -z ${texto_soket} ]] && texto_soket='<span style=color: #ff0000;><strong><span style="color: #ff0000;">C</span><span style="color: #ff9900;">h</span><span style="color: #008000;">u</span><span style="color: #0000ff;">m</span><span style="color: #ff0000;">o</span><span style="color: #ff9900;">G</span><span style="color: #008000;">H</span><span style="color: #0000ff;">�</span><span style="color: #ff0000;">P</span><span style="color: #ff9900;">l</span><span style="color: #008000;">u</span><span style="color: #0000ff;">s</span></strong></span>'

mod1() {
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
msg -ama "      BINARIO OFICIAL DE Epro Dev Team "
sleep 2s && tput cuu1 && tput dl1
[[ -e /etc/adm-lite/PDirect ]] && {
echo -e "[Unit]
Description=WS-Epro Service by @ChumoGH
After=network.target
StartLimitIntervalSec=0

[Service]
Type=simple
User=root
WorkingDirectory=/root
ExecStart=/bin/WS-Epro -salome -listen :${porta_socket} -ssh 127.0.0.1:${local} -f /etc/adm-lite/PDirect 
Restart=always
RestartSec=3s

[Install]
WantedBy=multi-user.target" > /etc/systemd/system/python.$porta_socket.service
} || {
echo "# verbose level 0=info, 1=verbose, 2=very verbose
verbose: 0
listen:
- target_host: 127.0.0.1
  target_port: ${local}
  listen_port: ${porta_socket}" > /etc/adm-lite/PDirect
  
echo -e "[Unit]
Description=WS-Epro Service by @ChumoGH
After=network.target
StartLimitIntervalSec=0

[Service]
Type=simple
User=root
WorkingDirectory=/root
ExecStart=/bin/WS-Epro -f /etc/adm-lite/PDirect 
Restart=always
RestartSec=3s

[Install]
WantedBy=multi-user.target" > /etc/systemd/system/python.$porta_socket.service
}
    systemctl enable python.$porta_socket &>/dev/null
    systemctl start python.$porta_socket &>/dev/null

    if [[ $conect = "PGet" ]]; then
        [[ "$(ps x | grep "PGet.py" | grep -v "grep" | awk -F "pts" '{print $1}')" ]] && {
            print_center -verd "Gettunel Iniciado com Exito"
            print_center -azu   "Su Contrase�a Gettunel es: $(msg -ama "ChumoGH")"
            msg -bar3
        } || {
            print_center -verm2 "Gettunel no fue iniciado"
            msg -bar3
        }
    fi
 }
 
 mod2() {
 tput cuu1 && tput dl1
 tput cuu1 && tput dl1
 tput cuu1 && tput dl1
 tput cuu1 && tput dl1
 tput cuu1 && tput dl1
 tput cuu1 && tput dl1
 tput cuu1 && tput dl1
texto="$(echo ${texto_soket} | sed 's/\"//g')"
#texto_soket="$(echo $texto|sed 'y/áÁàÂ54ãÒâÀ32é� 30ê�`íÍóÀ34õ� 22ôÀ35ú�añÀ30ç� 21ªº/aAaAaAaAeEeEiIoOoOoOuUnNcCao/')"
[[ ! -z $porta_bind ]] && conf=" 80 " || conf="$porta_socket "
    #[[ ! -z $pass_file ]] && conf+="-p $pass_file"
    #[[ ! -z $local ]] && conf+="-l $local "
    #[[ ! -z $response ]] && conf+="-r $response "
    #[[ ! -z $IP ]] && conf+="-i $IP "
    [[ ! -z $texto_soket ]] && conf+=" '$texto_soket'"
cp ${ADM_inst}/$1.py $HOME/PDirect.py
systemctl stop python.${porta_socket} &>/dev/null
systemctl disable python.${porta_socket} &>/dev/null
rm -f /etc/systemd/system/python.${porta_socket}.service &>/dev/null
#================================================================
(
less << PYTHON  > ${ADM_inst}/PDirect.py
#!/usr/bin/env python
# encoding: utf-8
import socket, threading, thread, select, signal, sys, time, getopt

# Listen
LISTENING_ADDR = '0.0.0.0'
if sys.argv[1:]:
  LISTENING_PORT = sys.argv[1]
else:
  LISTENING_PORT = 80  
#Pass
PASS = ''
# CONST
BUFLEN = 4096 * 4
TIMEOUT = 60
DEFAULT_HOST = '127.0.0.1:$local'
MSG = '$texto'
STATUS_RESP = '$response'
FTAG = '\r\nContent-length: 0\r\n\r\nHTTP/1.1 200 Connection established\r\n\r\n'

if STATUS_RESP == '101':
    STATUS_TXT = '<font color="green">Web Socket Protocol</font>'
else:
    STATUS_TXT = '<font color="red">Connection established</font>'

RESPONSE = "HTTP/1.1 " + str(STATUS_RESP) + ' ' + str(STATUS_TXT) + ' ' +  str(MSG) + ' ' +  str(FTAG)


class Server(threading.Thread):
    def __init__(self, host, port):
        threading.Thread.__init__(self)
        self.running = False
        self.host = host
        self.port = port
        self.threads = []
        self.threadsLock = threading.Lock()
        self.logLock = threading.Lock()

    def run(self):
        self.soc = socket.socket(socket.AF_INET)
        self.soc.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
        self.soc.settimeout(2)
        intport = int(self.port)
        self.soc.bind((self.host, intport))
        self.soc.listen(0)
        self.running = True

        try:
            while self.running:
                try:
                    c, addr = self.soc.accept()
                    c.setblocking(1)
                except socket.timeout:
                    continue

                conn = ConnectionHandler(c, self, addr)
                conn.start()
                self.addConn(conn)
        finally:
            self.running = False
            self.soc.close()

    def printLog(self, log):
        self.logLock.acquire()
        print log
        self.logLock.release()

    def addConn(self, conn):
        try:
            self.threadsLock.acquire()
            if self.running:
                self.threads.append(conn)
        finally:
            self.threadsLock.release()

    def removeConn(self, conn):
        try:
            self.threadsLock.acquire()
            self.threads.remove(conn)
        finally:
            self.threadsLock.release()

    def close(self):
        try:
            self.running = False
            self.threadsLock.acquire()

            threads = list(self.threads)
            for c in threads:
                c.close()
        finally:
            self.threadsLock.release()


class ConnectionHandler(threading.Thread):
    def __init__(self, socClient, server, addr):
        threading.Thread.__init__(self)
        self.clientClosed = False
        self.targetClosed = True
        self.client = socClient
        self.client_buffer = ''
        self.server = server
        self.log = 'Connection: ' + str(addr)

    def close(self):
        try:
            if not self.clientClosed:
                self.client.shutdown(socket.SHUT_RDWR)
                self.client.close()
        except:
            pass
        finally:
            self.clientClosed = True

        try:
            if not self.targetClosed:
                self.target.shutdown(socket.SHUT_RDWR)
                self.target.close()
        except:
            pass
        finally:
            self.targetClosed = True

    def run(self):
        try:
            self.client_buffer = self.client.recv(BUFLEN)

            hostPort = self.findHeader(self.client_buffer, 'X-Real-Host')

            if hostPort == '':
                hostPort = DEFAULT_HOST

            split = self.findHeader(self.client_buffer, 'X-Split')

            if split != '':
                self.client.recv(BUFLEN)

            if hostPort != '':
                passwd = self.findHeader(self.client_buffer, 'X-Pass')
				
                if len(PASS) != 0 and passwd == PASS:
                    self.method_CONNECT(hostPort)
                elif len(PASS) != 0 and passwd != PASS:
                    self.client.send('HTTP/1.1 400 WrongPass!\r\n\r\n')
                elif hostPort.startswith('127.0.0.1') or hostPort.startswith('localhost'):
                    self.method_CONNECT(hostPort)
                else:
                    self.client.send('HTTP/1.1 403 Forbidden!\r\n\r\n')
            else:
                print '- No X-Real-Host!'
                self.client.send('HTTP/1.1 400 NoXRealHost!\r\n\r\n')

        except Exception as e:
            self.log += ' - error: ' + e.strerror
            self.server.printLog(self.log)
	    pass
        finally:
            self.close()
            self.server.removeConn(self)

    def findHeader(self, head, header):
        aux = head.find(header + ': ')

        if aux == -1:
            return ''

        aux = head.find(':', aux)
        head = head[aux+2:]
        aux = head.find('\r\n')

        if aux == -1:
            return ''

        return head[:aux];

    def connect_target(self, host):
        i = host.find(':')
        if i != -1:
            port = int(host[i+1:])
            host = host[:i]
        else:
            if self.method=='CONNECT':
                port = 22
            else:
                port = sys.argv[1]

        (soc_family, soc_type, proto, _, address) = socket.getaddrinfo(host, port)[0]

        self.target = socket.socket(soc_family, soc_type, proto)
        self.targetClosed = False
        self.target.connect(address)

    def method_CONNECT(self, path):
        self.log += ' - CONNECT ' + path

        self.connect_target(path)
        self.client.sendall(RESPONSE)
        self.client_buffer = ''

        self.server.printLog(self.log)
        self.doCONNECT()

    def doCONNECT(self):
        socs = [self.client, self.target]
        count = 0
        error = False
        while True:
            count += 1
            (recv, _, err) = select.select(socs, [], socs, 3)
            if err:
                error = True
            if recv:
                for in_ in recv:
		    try:
                        data = in_.recv(BUFLEN)
                        if data:
			    if in_ is self.target:
				self.client.send(data)
                            else:
                                while data:
                                    byte = self.target.send(data)
                                    data = data[byte:]

                            count = 0
			else:
			    break
		    except:
                        error = True
                        break
            if count == TIMEOUT:
                error = True
            if error:
                break


def print_usage():
    print 'Usage: proxy.py -p <port>'
    print '       proxy.py -b <bindAddr> -p <port>'
    print '       proxy.py -b 0.0.0.0 -p 80'

def parse_args(argv):
    global LISTENING_ADDR
    global LISTENING_PORT
    
    try:
        opts, args = getopt.getopt(argv,"hb:p:",["bind=","port="])
    except getopt.GetoptError:
        print_usage()
        sys.exit(2)
    for opt, arg in opts:
        if opt == '-h':
            print_usage()
            sys.exit()
        elif opt in ("-b", "--bind"):
            LISTENING_ADDR = arg
        elif opt in ("-p", "--port"):
            LISTENING_PORT = int(arg)


def main(host=LISTENING_ADDR, port=LISTENING_PORT):
    
    print "\033[0;34m�01"*8,"\033[1;32m PROXY PYTHON WEBSOCKET","\033[0;34m�01"*8,"\n"
    print "\033[1;33mIP:\033[1;32m " + LISTENING_ADDR
    print "\033[1;33mPORTA:\033[1;32m " + str(LISTENING_PORT) + "\n"
    print "\033[0;34m�01"*10,"\033[1;32m ChumoGH ADM - LITE","\033[0;34m�01\033[1;37m"*11,"\n"
    
    
    server = Server(LISTENING_ADDR, LISTENING_PORT)
    server.start()

    while True:
        try:
            time.sleep(2)
        except KeyboardInterrupt:
            print 'Parando...'
            server.close()
            break
    
if __name__ == '__main__':
    parse_args(sys.argv[1:])
    main()
PYTHON
) > $HOME/proxy.log

msg -bar3
#systemctl start $py.$porta_socket &>/dev/null
chmod +x ${ADM_inst}/$1.py

echo -e "[Unit]
Description=$1 Parametizado Service by @ChumoGH
After=network.target
StartLimitIntervalSec=0

[Service]
Type=simple
User=root
WorkingDirectory=/root
ExecStart=/usr/bin/$py ${ADM_inst}/${1}.py $conf
Restart=always
RestartSec=3s

[Install]
WantedBy=multi-user.target" > /etc/systemd/system/python.$porta_socket.service
systemctl enable python.$porta_socket &>/dev/null
systemctl start python.$porta_socket &>/dev/null
[[ -e $HOME/$1.py ]] && echo -e "\n\n Fichero Alojado en : ${ADM_inst}/$1.py \n\n Respaldo alojado en : $HOME/$1.py \n"
#================================================================
[[ -e /etc/systemd/system/python.$porta_socket.service ]] && {
msg -bar3
print_center -verd " INICIANDO SOCK Python Puerto ${porta_socket} "
sleep 1s && tput cuu1 && tput dl1
} || {
print_center -azu " FALTA ALGUN PARAMETRO PARA INICIAR"
sleep 1s && tput cuu1 && tput dl1
return
}
[[ ! -e /bin/ejecutar/PortPD.log ]] && echo -e "${conf}" > /bin/ejecutar/PortPD.log
}
 
 mod3() {
 tput cuu1 && tput dl1
 tput cuu1 && tput dl1
 tput cuu1 && tput dl1
 tput cuu1 && tput dl1
 tput cuu1 && tput dl1
 tput cuu1 && tput dl1
 tput cuu1 && tput dl1
 tput cuu1 && tput dl1
 tput cuu1 && tput dl1
texto="$(echo ${texto_soket} | sed 's/\"//g')"
[[ ! -z $porta_bind ]] && conf=" 80 " || conf="$porta_socket "
[[ ! -z $texto_soket ]] && conf+=" '$texto_soket'"
cp ${ADM_inst}/$1.py $HOME/PDirect.py
systemctl stop python.${porta_socket} &>/dev/null
systemctl disable python.${porta_socket} &>/dev/null
rm -f /etc/systemd/system/python.${porta_socket}.service &>/dev/null
#================================================================
less << PYTHON  > ${ADM_inst}/PDirect.py
#!/usr/bin/env python
# encoding: utf-8
import socket, threading, thread, select, signal, sys, time, getopt

# Listen
LISTENING_ADDR = '0.0.0.0'
if sys.argv[1:]:
  LISTENING_PORT = sys.argv[1]
else:
  LISTENING_PORT = 80  
#Pass
PASS = ''
# CONST
BUFLEN = 4096 * 4
TIMEOUT = 60
DEFAULT_HOST = '127.0.0.1:$local'
MSG = '$texto'
STATUS_RESP = '$response'
FTAG = '\r\nContent-length: 0\r\n\r\nHTTP/1.1 $STATUS_RESP Connection established\r\n\r\n'

if STATUS_RESP == '101':
    STATUS_TXT = '<font color="green">Web Socket Protocol</font>'
else:
    STATUS_TXT = '<font color="red">Connection established</font>'

#RESPONSE = "HTTP/1.1 " + str(STATUS_RESP) + ' ' + str(STATUS_TXT) + ' ' +  str(MSG) + ' ' +  str(FTAG)
RESPONSE = "HTTP/1.1 " + str(STATUS_RESP) + ' ' +  str(MSG) + ' ' +  str(FTAG)


class Server(threading.Thread):
    def __init__(self, host, port):
        threading.Thread.__init__(self)
        self.running = False
        self.host = host
        self.port = port
        self.threads = []
        self.threadsLock = threading.Lock()
        self.logLock = threading.Lock()

    def run(self):
        self.soc = socket.socket(socket.AF_INET)
        self.soc.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
        self.soc.settimeout(2)
        intport = int(self.port)
        self.soc.bind((self.host, intport))
        self.soc.listen(0)
        self.running = True

        try:
            while self.running:
                try:
                    c, addr = self.soc.accept()
                    c.setblocking(1)
                except socket.timeout:
                    continue

                conn = ConnectionHandler(c, self, addr)
                conn.start()
                self.addConn(conn)
        finally:
            self.running = False
            self.soc.close()

    def printLog(self, log):
        self.logLock.acquire()
        print log
        self.logLock.release()

    def addConn(self, conn):
        try:
            self.threadsLock.acquire()
            if self.running:
                self.threads.append(conn)
        finally:
            self.threadsLock.release()

    def removeConn(self, conn):
        try:
            self.threadsLock.acquire()
            self.threads.remove(conn)
        finally:
            self.threadsLock.release()

    def close(self):
        try:
            self.running = False
            self.threadsLock.acquire()

            threads = list(self.threads)
            for c in threads:
                c.close()
        finally:
            self.threadsLock.release()


class ConnectionHandler(threading.Thread):
    def __init__(self, socClient, server, addr):
        threading.Thread.__init__(self)
        self.clientClosed = False
        self.targetClosed = True
        self.client = socClient
        self.client_buffer = ''
        self.server = server
        self.log = 'Connection: ' + str(addr)

    def close(self):
        try:
            if not self.clientClosed:
                self.client.shutdown(socket.SHUT_RDWR)
                self.client.close()
        except:
            pass
        finally:
            self.clientClosed = True

        try:
            if not self.targetClosed:
                self.target.shutdown(socket.SHUT_RDWR)
                self.target.close()
        except:
            pass
        finally:
            self.targetClosed = True

    def run(self):
        try:
            self.client_buffer = self.client.recv(BUFLEN)

            hostPort = self.findHeader(self.client_buffer, 'X-Real-Host')

            if hostPort == '':
                hostPort = DEFAULT_HOST

            split = self.findHeader(self.client_buffer, 'X-Split')

            if split != '':
                self.client.recv(BUFLEN)

            if hostPort != '':
                passwd = self.findHeader(self.client_buffer, 'X-Pass')
				
                if len(PASS) != 0 and passwd == PASS:
                    self.method_CONNECT(hostPort)
                elif len(PASS) != 0 and passwd != PASS:
                    self.client.send('HTTP/1.1 400 WrongPass!\r\n\r\n')
                elif hostPort.startswith('127.0.0.1') or hostPort.startswith('localhost'):
                    self.method_CONNECT(hostPort)
                else:
                    self.client.send('HTTP/1.1 403 Forbidden!\r\n\r\n')
            else:
                print '- No X-Real-Host!'
                self.client.send('HTTP/1.1 400 NoXRealHost!\r\n\r\n')

        except Exception as e:
            self.log += ' - error: ' + e.strerror
            self.server.printLog(self.log)
	    pass
        finally:
            self.close()
            self.server.removeConn(self)

    def findHeader(self, head, header):
        aux = head.find(header + ': ')

        if aux == -1:
            return ''

        aux = head.find(':', aux)
        head = head[aux+2:]
        aux = head.find('\r\n')

        if aux == -1:
            return ''

        return head[:aux];

    def connect_target(self, host):
        i = host.find(':')
        if i != -1:
            port = int(host[i+1:])
            host = host[:i]
        else:
            if self.method=='CONNECT':
                port = 22
            else:
                port = sys.argv[1]

        (soc_family, soc_type, proto, _, address) = socket.getaddrinfo(host, port)[0]

        self.target = socket.socket(soc_family, soc_type, proto)
        self.targetClosed = False
        self.target.connect(address)

    def method_CONNECT(self, path):
        self.log += ' - CONNECT ' + path

        self.connect_target(path)
        self.client.sendall(RESPONSE)
        self.client_buffer = ''

        self.server.printLog(self.log)
        self.doCONNECT()

    def doCONNECT(self):
        socs = [self.client, self.target]
        count = 0
        error = False
        while True:
            count += 1
            (recv, _, err) = select.select(socs, [], socs, 3)
            if err:
                error = True
            if recv:
                for in_ in recv:
		    try:
                        data = in_.recv(BUFLEN)
                        if data:
			    if in_ is self.target:
				self.client.send(data)
                            else:
                                while data:
                                    byte = self.target.send(data)
                                    data = data[byte:]

                            count = 0
			else:
			    break
		    except:
                        error = True
                        break
            if count == TIMEOUT:
                error = True
            if error:
                break


def print_usage():
    print 'Usage: proxy.py -p <port>'
    print '       proxy.py -b <bindAddr> -p <port>'
    print '       proxy.py -b 0.0.0.0 -p 80'

def parse_args(argv):
    global LISTENING_ADDR
    global LISTENING_PORT
    
    try:
        opts, args = getopt.getopt(argv,"hb:p:",["bind=","port="])
    except getopt.GetoptError:
        print_usage()
        sys.exit(2)
    for opt, arg in opts:
        if opt == '-h':
            print_usage()
            sys.exit()
        elif opt in ("-b", "--bind"):
            LISTENING_ADDR = arg
        elif opt in ("-p", "--port"):
            LISTENING_PORT = int(arg)


def main(host=LISTENING_ADDR, port=LISTENING_PORT):
    
    print "\033[0;34m�01"*8,"\033[1;32m PROXY PYTHON WEBSOCKET","\033[0;34m%01"*8,"\n"
    print "\033[1;33mIP:\033[1;32m " + LISTENING_ADDR
    print "\033[1;33mPORTA:\033[1;32m " + str(LISTENING_PORT) + "\n"
    print "\033[0;34m�01"*10,"\033[1;32m ChumoGH ADMcgh Plus","\033[0;34m�01\033[1;37m"*11,"\n"
    
    server = Server(LISTENING_ADDR, LISTENING_PORT)
    server.start()

    while True:
        try:
            time.sleep(2)
        except KeyboardInterrupt:
            print 'Parando...'
            server.close()
            break
    
if __name__ == '__main__':
    parse_args(sys.argv[1:])
    main()
PYTHON
msg -bar3
chmod +x ${ADM_inst}/$1.py
tput cuu1 && tput dl1
screen -dmS ws$porta_socket python ${ADM_inst}/PDirect.py ${porta_socket} & > /root/proxy.log 
print_center -verd " ${aLerT} VERIFICANDO ACTIVIDAD DE SOCK PYTHON ${aLerT} \n        ${aLerT}  PORVAFOR ESPERE !! ${aLerT} "
sleep 2s && tput cuu1 && tput dl1
sleep 1s && tput cuu1 && tput dl1
[[ -e $HOME/$1.py ]] && echo -e "\n\n Fichero Alojado en : ${ADM_inst}/$1.py \n\n Respaldo alojado en : $HOME/$1.py \n"
#================================================================
[[ $(ps x | grep "ws$porta_socket python" |grep -v grep ) ]] && {
msg -bar3
print_center -verd " REACTIVADOR DE SOCK Python ${porta_socket} ENCENDIDO "
[[ $(grep -wc "ws$porta_socket" /bin/autoboot) = '0' ]] && {
						echo -e "netstat -tlpn | grep -w $porta_socket > /dev/null || {  screen -r -S 'ws$porta_socket' -X quit;  screen -dmS ws$porta_socket python ${ADM_inst}/$1.py ${porta_socket} & >> /root/proxy.log  ; }" >>/bin/autoboot
					} || {
						sed -i '/ws${porta_socket}/d' /bin/autoboot
						echo -e "netstat -tlpn | grep -w $porta_socket > /dev/null || {  screen -r -S 'ws$porta_socket' -X quit;  screen -dmS ws$porta_socket python ${ADM_inst}/$1.py ${porta_socket} & >> /root/proxy.log  ; }" >>/bin/autoboot
					}
sleep 2s && tput cuu1 && tput dl1
} || {
print_center -azu " FALTA ALGUN PARAMETRO PARA INICIAR REACTIVADOR "
sleep 2s && tput cuu1 && tput dl1
return
}
[[ ! -e /bin/ejecutar/PortPD.log ]] && echo -e "${conf}" > /bin/ejecutar/PortPD.log
}

#-----------SELECCION------------
selecPython () {
msg -bar3
menu_func "Socks WS OFICIAL ( SCREEM )" "$(msg -ama "Socks WS BETA    ( SYSTEM )")" "$(msg -verm2 "Socks WS/Proxy (EPro)( SYSTEM )")"
msg -bar3
echo -ne "$(msg -verd "  [0]") $(msg -verm2 ">") " && msg -bra "   \033[1;41m VOLVER \033[0m"
msg -bar3
selection=$(selection_fun 3)
case ${selection} in
    1)
    mod3 "${conect}"
    sleep 2s
    ;;
    2)
    mod2 "${conect}"
    sleep 2s
    ;;
	3)
	[[ $(uname -m 2> /dev/null) != x86_64 ]] && {
	msg -ama "      BINARIO NO COMPATIBLE CON ARM64 "
	read -p "PRESIONE ENTER PARA RETORNAR"
	exit
	} || {
	if wget -O /bin/WS-Epro https://raw.githubusercontent.com/kelokepe/scriptcgh/main/Recursos/binarios/SockWS/autoStart &>/dev/null ; then
	  chmod 777 /bin/WS-Epro
	fi
    mod1 "${conect}" 
    sleep 2s	
	}
	;;
    0) return 1;;
esac
return 1
}
#-----------FIN SELECCION--------
selecPython
tput cuu1 && tput dl1
    msg -bar3
    [[ $(ps x | grep "PDirect" | grep -v "grep" | awk -F "pts" '{print $1}') ]] && print_center -verd "PYTHON INICIADO CON EXITO!!!" || print_center -ama " ERROR AL INICIAR PYTHON!!!"
    msg -bar3
    sleep 1
}

iniciarsocks () {
pidproxy=$(ps x | grep -w "PPub.py" | grep -v "grep" | awk -F "pts" '{print $1}') && [[ ! -z $pidproxy ]] && P1="\033[1;32m[ON]" || P1="\033[1;31m[OFF]"
pidproxy2=$(ps x | grep -w  "PPriv.py" | grep -v "grep" | awk -F "pts" '{print $1}') && [[ ! -z $pidproxy2 ]] && P2="\033[1;32m[ON]" || P2="\033[1;31m[OFF]"
pidproxy3=$(ps x | grep -w  "PDirect" | grep -v "grep" | awk -F "pts" '{print $1}') && [[ ! -z $pidproxy3 ]] && P3="\033[1;32m[ON]" || P3="\033[1;31m[OFF]"
pidproxy4=$(ps x | grep -w  "POpen.py" | grep -v "grep" | awk -F "pts" '{print $1}') && [[ ! -z $pidproxy4 ]] && P4="\033[1;32m[ON]" || P4="\033[1;31m[OFF]"
pidproxy5=$(ps x | grep "PGet.py" | grep -v "grep" | awk -F "pts" '{print $1}') && [[ ! -z $pidproxy5 ]] && P5="\033[1;32m[ON]" || P5="\033[1;31m[OFF]"
pidproxy6=$(ps x | grep "scktcheck" | grep -v "grep" | awk -F "pts" '{print $1}') && [[ ! -z $pidproxy6 ]] && P6="\033[1;32m[ON]" || P6="\033[1;31m[OFF]"
echo -e "\e[91m\e[43m  ==== SCRIPT MOD ChumoGH|EDICION ====  \033[0m \033[0;33m[$(less ${ADM_inst}/v-local.log)]"
msg -bar3
echo -ne "$(msg -verd "  [1]") $(msg -verm2 ">") " && msg -azu "Socks Python SIMPLE      $P1"
echo -ne "$(msg -verd "  [2]") $(msg -verm2 ">") " && msg -azu "Socks Python SEGURO      $P2"
echo -ne "$(msg -verd "  [3]") $(msg -verm2 ">") " && msg -azu "Socks Python DIRETO (WS) $P3"
echo -ne "$(msg -verd "  [4]") $(msg -verm2 ">") " && msg -azu "Socks Python OPENVPN     $P4"
echo -ne "$(msg -verd "  [5]") $(msg -verm2 ">") " && msg -azu "Socks Python GETTUNEL    $P5"
echo -ne "$(msg -verd "  [6]") $(msg -verm2 ">") " && msg -azu "Socks Python TCP BYPASS  $P6"
msg -bar3

py=7
var_p="$(lsof -V -i tcp -P -n|grep -v "ESTABLISHED"|grep -v "COMMAND"|grep "WS-Epro"| wc -l) "
var_w="$(lsof -V -i tcp -P -n|grep -v "ESTABLISHED"|grep -v "COMMAND"|grep "python"|wc -l)"
var_check=$(( ${var_p} + ${var_w} ))
if [[ ${var_check} -ge "2" ]]; then
    echo -e "$(msg -verd "  [7]") $(msg -verm2 ">") $(msg -azu "ANULAR TODOS") $(msg -verd "  [8]") $(msg -verm2 ">") $(msg -azu "ELIMINAR UN PUERTO")"
    py=8
else
    echo -e "$(msg -verd "  [7]") $(msg -verm2 ">") $(msg -azu "ELIMINAR TODOS")"
fi

msg -bar3
echo -ne "$(msg -verd "  [0]") $(msg -verm2 ">") " && msg -bra "   \033[1;41m VOLVER \033[0m"
msg -bar3
selection=$(selection_fun ${py})
case ${selection} in
    1)colector PPub;;
    2)colector PPriv;;
    3)colector PDirect;;
    4)colector POpen;;
    5)colector PGet;;
    6);;
    7)stop_all;;
    8)stop_port;;
    0)return 1;;
esac
return 1
}
chekKEY &> /dev/null 2>&1
iniciarsocks

ofus () {
unset txtofus
number=$(expr length $1)
for((i=1; i<$number+1; i++)); do
txt[$i]=$(echo "$1" | cut -b $i)
case ${txt[$i]} in
".")txt[$i]="x";;
"x")txt[$i]=".";;
"5")txt[$i]="s";;
"s")txt[$i]="5";;
"1")txt[$i]="@";;
"@")txt[$i]="1";;
"2")txt[$i]="?";;
"?")txt[$i]="2";;
"4")txt[$i]="0";;
"0")txt[$i]="4";;
"/")txt[$i]="K";;
"K")txt[$i]="/";;
esac
txtofus+="${txt[$i]}"
done
echo "$txtofus" | rev
}
 
