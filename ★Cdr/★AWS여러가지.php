<?php
// ================우분투 setup
// 기존 하드디스크에 우분투 추가설치 : 윈도우 제어판-> 관리도구-> 컴퓨터관리-> 디스크관리 
// C드라이버의 볼륨축소로 9000Mb정도로 할당한다.

// 우분투 디스크를 넣고 설치 진행중 설치유형을 '기타'를 선택한다
// 나머지공간 9Gb파티션을 더블클릭하면 파티션 만들기에서
// 파티션종류: 논리파티션,
// 크기: 500Mb, 
// 파티션위치:시작하는 지점, 
// 용도: 스왑영역
// OK
// 나머지공간을 더블클릭, 파티션 만들기에서
// 파티션종류: 주파티션,
// 크기: (나머지 모두ls a-l)Mb, 
// 파티션위치:시작하는 지점, 
// 용도: EXT4 저링 파일시스템
// 마운트 위치: /
// OK

// [Doctrine\DBAL\Driver\PDOException] could not find driver 
// [PDOException] could not find driver

// <AWS의 SSH연결>

// 우분투에서 SSH연결
// https://ap-northeast-2.console.aws.amazon.com/ec2/v2/home?region=ap-northeast-2#Instances:sort=instalnceId  참조 

// ===linux
// cd .ssh
// chmod 400 /home/choi/.ssh/aws.ppk
//$ ssh -i "/home/cdr/.ssh/qwspwd.pem" ubuntu@ec2-52-78-168-67.ap-northeast-2.compute.amazonaws.com
//$ ssh -i "/home/choi/.ssh/qwspwd.pem" ubuntu@ec2-52-78-168-67.ap-northeast-2.compute.amazonaws.com


// windows
//$ ssh -i "c:\ssh\qwspwd.pem" ubuntu@ec2-52-78-168-67.ap-northeast-2.compute.amazonaws.com
 
//----- Connecting to EC2 via SSH 참고-----
// http://docs.aws.amazon/AWSEC2/latest/UserGuide/

// 52.78.168.67


// ubuntu PHP install 
// ============================================================④⑤
// ==============apache install
//① sudo apt-get install apache2
//② sudo apt-get update --fix-missing
// localhost 로확인 :    Apache2 Ubuntu Default Page 확인
//         ==>ifconfig 를 쳐서 ip를 알아낸 후 인터넷 창에 적어서 아파치 페이지가 나오는지 확인한다
//③ sudo systemctl restart apache2
//         ==> 아파치를 재시작
//④ sudo systemctl status apache2
//        ==> 작동이 정상인지 확인; 녹색글씨로 active(running)이 있을 것이다. 빠져 나오기: ctrl+c

//===============php
//⑤ sudo apt-get install php7.0 libapache2-mod-php7.0
//⑥ sudo apt-get update
//⑦ php -v
//  php -m
//⑧ sudo apt-get install php-mbstring    :Xampp에서도 인스톨 
//⑨ sudo apt-get install php-xml         :Xampp에서도 인스톨


//===============composer install
//⑩ sudo php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
//⑪ sudo php -r "if (hash_file('SHA384', 'composer-setup.php') === '669656bab3166a7aff8a7506b8cb2d1c292f042046c5a994c43155c0be6190fa0355160742ab2e1c88d40d5be660b410') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
//             =>Installer verified 확인 
//⑫ sudo php composer-setup.php
//⑬ sudo php -r "unlink('composer-setup.php');"
//⑭ php composer.phar
//              ==>실행 내용확인 

//=======================mysql install
//ⓐ sudo apt-get install mysql-server
//              ==>반드시 6자리이상 암호설정 
//ⓑ sudo apt-get install mysql-client
//ⓒ sudo apt-get install php7.0 libapache2-mod-php7.0 php-mcrypt php-mysql php-mbstring php7.0-mbstring php-gettext
//ⓓ sudo nano /etc/apache2/mods-enabled/dir.conf
//              ==>index.php를 가장 앞으로 오게 한다.     
//                 기본 페이지를 index.php로 설정하는 것, 테스트 용
//ⓔ sudo nano /var/www/html/info.php
<?php
phpinfo();
?>
==========================

<?php
//            입력후 저장한다
//            인터넷 페이지에서 http://서버아이피/info.php 를 쳐서 php 페이지가 나오는지 확인한다.


//phpmyadmin설치
//ⓕ sudo apt-get install phpmyadmin
               ==> 반드시 6자리이상 암호설정 230700
//ⓖ sudo nano /etc/apache2/apache2.conf
//ⓗ sudo chmod -R 777 /etc/apache2/apache2.conf
# Sets the default security model of the Apache2 HTTPD server. It does라는 라인 밑에 다음을 추가

# Include phpMyAdmin
Include /etc/phpmyadmin/apache.conf
  
//ⓘ service apache2 restart
//  sudo systemctl status apache2
//                ==> active(running)이 있을 것, 빠져 나오기: ctrl+c 
//ⓙ 인터넷 페이지에서 http://localhost/phpmyadmin 으로 들어가서 ID: root 와 아까 입력한 Password로 들어간다. phpmyadmin화면

//참고
//++++++++++++++++++XAMPP     우분투에 설치
 
//$ https://www.apachefriends.org/download.html
//$ wget https://www.apachefriends.org/xampp-files/7.0.21/xampp-linux-x64-7.0.21-0-installer.run
//$ sudo chmod +x xampp-linux-x64-7.0.21-0-installer.run
//$ sudo ./xampp-linux-x64-7.0.21-0-installer.run
//$ sudo /opt/lampp/lampp status
//$ sudo /opt/lampp/lampp start
//$ sudo /opt/lampp/lampp stop
//$ sudo /opt/lampp/lampp restart

//$ sudo apt install php7.0-cli
//$ sudo apt install hhvm
//$ sudo apt-get install php-mbstring         :laravel필수 
//$ sudo apt-get install php-xml              :laravel필수
//$ sudo apt-get install php7.0 libapache2-mod-php7.0 php-mcrypt php-mysql php-mbstring php7.0-mbstring php-gettext
//⑩ sudo php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
//⑪ sudo php -r "if (hash_file('SHA384', 'composer-setup.php') === '669656bab3166a7aff8a7506b8cb2d1c292f042046c5a994c43155c0be6190fa0355160742ab2e1c88d40d5be660b410') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
//              =>Installer verified 확인 
//⑫ sudo php composer-setup.php
//⑬ sudo php -r "unlink('composer-setup.php');"
//⑭ php composer.phar
//             ==>실행 내용확인 


//테스트
//  로컬에서만 설치여부를 확인하고자 할 경우에는 특별히 문제가 없다. 다만 다른 PC에서 XAMPP를 열고자 할 경우에는 접근권한이 없다.
// 이럴 경우 반드시 방화벽의 80 포트가 열려있는지 확인하고 "/opt/lampp/etc/extra/httpd-xampp.conf" 파일에서 아래처럼 수정해주어야 한다.
//@ sudo nano /opt/lampp/etc/extra/httpd-xampp.conf
...
<LocationMatch ...>
# Require local
ErrorDocument 403 /error/XAMPP_FORBIDDEN.html.var
</LocationMatch>

//이제 리모트에서도 브라우저로 페이지를 열수가 있다. (http://192.168.xxx.xxx/xampp)



//    $$$$$$$$$$$$$$$$$$$$$$$$$=============우분투에서 public/index.html로 연결 
//$ cd /etc/apache2/sites-available
//$ sudo chmod -R 777 /etc/apache2/sites-available/000-default.conf 
//$ nano /etc/apache2/sites-available/000-default.conf
//     edit안에서 DocumentRoot /var/www/html/myapp/public 으로 수정
//$ sudo systemctl restart apache2
//$ sudo chmod -R 777 storage bootstrap/cache public/files
//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$



//&&&&&&&&&&&&&&&&&&&&&&&&&& WINDOWS의 Xampp에서 public/index.html로 연결
//C:\Xampp\apache\conf\httpd.conf 안에 (panel에서 confog를 눌러 수정함)

# DocumentRoot "C:/xampp/htdocs"
# <Directory "C:/xampp/htdocs">
//부분을
DocumentRoot "C:\Sites\lara\public"
<Directory "C:\Sites\lara\public">   
//로 변경
//다음 아파치 재부팅
//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&



//=================laravel install
//$ sudo chmod -R 777 /var/www/html/
//$ sudo php composer.phar global require "laravel/installer" 
//$ sudo php composer.phar create-project --prefer-dist laravel/laravel /var/www/html/myfolder



//@@@@@@@@@@@@@@@@@@@@@@@@@ github 내용다운
//$ git clone https://github.com/laravel/laravel.git /var/www/html/choi 
//$ git clone https://github.com/laravel/laravel.git myfolder
//$ cp .env.example .env
//$ sudo composer install
//$ php artisan key:generate 



//또는
//$ composer create-project --prefer-dist laravel/laravel myfolder
//또는 
//root폴더에서 html>laravel new laravel5.4 

//=================MYAPP install (응용 코드 인스톨:필요시)
//https://github.com/appkr/l5code/blob/master/readme.md 참조시

//<linux에서>
//$ sudo apt install git
//$ sudo git clone https://github.com/drchoi2k/lara_org.git myapp               프로그램 코드 다운 
//$ cd myapp
//myapp/$ git checkout master                     프로젝트의 의존성 설치
//myapp/$ sudo apt install composer
// phpmyadmin에서 myapp db생성 
//myapp/$ cp .env.example .env                     .env생성, db_name:myapp, password 추가 
//myapp/$ php artisan key:generate
//myapp/$ chmod -R 777 storage bootstrap/cache public/files
//myapp/$ php artisan migrate --seed --force                   데이터베이스 마이그레이션 및 시딩
//myapp/$ git clone https://github.com/laravel/docs.git        마크다운 뷰어용 데이터 파일 설치

//myapp/$ php artisan serve

//<windows에서 해당 폴더안에서>
//$ composer install
//phpmyadmin에서 myapp db생성
//$ cp .env.example .env 
//$ php artisan key:generate
//$ php artisan migrate --seed --force
//$ git clone https://github.com/laravel/docs.git

// php7.0-mysql있는지 확인
//$ apt-cache search php7.0               
 




//<<<<<<<<<<<<프로그렘설치>>>>>>>>>>>>>>>
//yobi.io


//================<ATOM에디터 설치>
//$ sudo add-apt-repository ppa:webupd8team/atom
//(add-apt-repository 명령어가 없다면 sudo apt-get install software-properties-common python-software-properties로 설치해주자)
//$ sudo apt-get update
//$ sudo apt-get install atom
//$ atom

//=============<sublime text3설치>
//$ sudo add-apt-repository ppa:webupd8team/sublime-text-3
//$ sudo apt-get update
//$ sudo apt-get install sublime-text-installer
//$ subl


//=========SourceCodePro install
//$ mkdir /tmp/adodefont
//$ cd /tmp/adodefont
//$ wget https://github.com/adobe-fonts/source-code-pro/archive/2.010R-ro/1.030R-it.zip
//$ unzip 1.030R-it.zip
//$ mkdir -p ~/.fonts
//$ cp source-code-pro-2.010R-ro-1.030R-it/OTF/*.otf ~/.fonts/
//$ fc-cache -f -v



//<우분투에 laravel설치법>
// https://www.youtube.com/watch?v=Ax_q-eM8oqM


//<다운프로그램 설치 방법>
//프로그램을 다운로드한후
// sudo mv ~/다운로드/SublimeText3 /opt/


// 일반방법
// http://egloos.zum.com/zodiac12k/v/1835302
// http://nightshadow.tistory.com/134

// <일반적 다운한 프로그램 설치)
// sudo apt-get install (프로그램 꾸러미)
// 우분투가 손쉽게 포장을 풀어 설치할 수 있는 꾸러미는 꼬리말이 .deb으로 끝나는 꾸러미입니다. deb은 데비안을 뜻합니다


// <다른 프로그램 추가/삭제>
// ★우분투는 [프로그램] 밑에 [추가/제거...]와 [시스템]-[관리] 밑에 [시냅틱 꾸러미 관리자] 2종류의 프로그램 설치/삭제 서비스를 제공합니다


// ★터미널 이용시 tar/Gzip 압축은
// tar xvzf 꾸러미명.tar.gz

// ★tar/Bzip 압축은
// tar xvjf 꾸러미명.tar.bz

// ★만약 rar압축이라면 먼저 프로그램부터 설치해줘야 합니다. 터미널에서
// sudo apt-get install unrar

// ★이후에 압축관리자로 풀거나 터미널에서
// unrar e 꾸러미명.rar

// ★만약 다른 가문 꾸러미라면? 레드햇가문 꾸러미는 외계인을 이용해 데비안 가문에 귀화시킬 수 있습니다.
// 먼저 외계인을 초빙해 설치해 주시고...
// sudo apt-get install alien
// 레드햇 가문 꾸러미 (.rpm)를 데비안 가문으로 귀화시킵니다.
// sudo alien -d 꾸러미명.rpm
// 위 처럼하면 deb로 변신 후 노틸러스(파일관리자)에서 클릭하면 설치됩니다.

// <주소 찾는 방법>
// 이 방법을 사용하기 위해선 PPA주소가 등록되어 있어야 할 뿐만 아니라 프로그램도 설치돼 있어야 합니다.
// 우선 터미널을 열고 아래의 명령어 형식으로 입력합니다.
// $ apt-cache policy 패키지명
//  예1) Jupiter (http://deviantcj.tistory.com/471)
// $ apt-cache policy jupiter
// 'http://ppa.launchpad.net/' 다음 부분에서 '/ubuntu/' 이전 부분이 ppa주소입니다.
// 주소:  /wepupd8team/jupiter/
// 예2) Unsettings (http://deviantcj.tistory.com/488)
// 주소:  /diesch/testing/



// GitHub사용법
// 열기
// git remote add origin <원격 서버 주소>

// DownLoad시
// git clone https://github.com/drchoi2k/cdr
// Upload시
// git push -u origin master
// 변경이력 전송
// git commit -am 'change temp.php'

// 올릴때
// git add .
// git commit -m "파일명"
// git push -u origin master

// 받아올때
// git pull .


ATOM
'f1': 'core:save'

==SUBLIME key설정 
[
	{ "keys": ["f1"], "command": "save" },
	{ "keys": ["f10"], "command": "sftp_browse_server" },
]


===SUBLIME font설정
{
	"font_face": "SourceCodePro",
	"font_options":
	[
		"no_bold"
	],
	"font_size": 12,
	"ignored_packages":
	[
		"Vintage"
	],
	"line_padding_bottom": 0,
	"line_padding_top": 0,
	"rulers":
	[
		4,
		12
	],
	"tab_size": 4,
	"word_wrap": "true"
}

// ===sftp 설정 
// "type": "sftp",
// "host": "52.78.168.67",
// "user": "ubuntu",
// "remote_path": "/var/www/html",
// "ssh_key_file": "~/.ssh/qwspwd.pem",

// sftp serve를 복사하는 폴더:/home/choi/.config/sublime-text-3/Packages/User

// 한영변환키변경
// 시스템설정->키보드->바로가기->실행아이콘->허드를 표시할 키 선택->back space키로 사용안함 선택
// ->우측 상부에 키보드안에->설정->전역설정->단축기->입력기전환의 좌측난을 누르고 한영키를 누른다





