# Git学习

https://www.liaoxuefeng.com/wiki/0013739516305929606dd18361248578c67b8067c8c017b000

## 是什么？

### 分布式版本控制系统

- 是什么？

  什么是版本控制系统？
  
  	我写的程序，针对不同的服务器需要修改不同的功能，保留不同的版本
  	同事也在参与这个项目，我不知道他做了那些修改
  
  版本控制作用：
  
   	我希望能帮我记录每次文件的改动，还可以让同事协作编辑。
  
  	版本号+文件名+用户+修改说明+修改时间

- 分布式与集中式区别

	- 集中式

		- 版本库存放在中央服务器，工作时从中央服务器取最新的版本，完成后推送回中央服务器

		  图书馆（中央服务器）借书（取版本）读完还回去（完成后推送回中央服务器）

		- 必须联网才能工作，网速慢时，体验极差
		- 中央服务器出错，影响极大

	- 分布式

		- 相比于集中式，安全性高，因为每个人都有完整的版本库，一个人损坏，从另一个人那里复制即可
		- 不必联网
		- 强大的分支管理

## 使用

### 不同系统的安装

- 安装完成后进行设置：

  因为Git是分布式版本控制系统
  所以每台机器都必须自报家门：你的名字和地址
  git config --global --list 查看当前用户配置

	- git config --global user.name "Your Name"
	- git config --global user.email "email@example.com"

### 创建版本库

- 1.创建空目录（目录地址不包含中文）不是空目录也行
- 2.通过git init 使该目录变成git可以管理的仓库
- 把文件添加到版本库

	- 版本控制只能跟踪文本文件的改动（TXT，网页，程序代码），对于二进制文件（图片，视频）只能获取文件大小的改变
	- 大象关进冰箱

	  大象装冰箱分三步，此处只有两步
	  1.使用git add将文件添加到仓库：
	  	git add readme.txt
	  2.使用git commit将文件提交到仓库：
	  	git commit -m "wrote a readme file"
	  
	  git status命令看看结果：
	   	git status
	  例：
	  $ git add file1.txt
	  $ git add file2.txt file3.txt
	  $ git commit -m "add 3 files."

		- 第一步：git add 告诉git，把文件添加到仓库
		- 第二部：git commit -m  "message" 告诉git，把文件提交到仓库,并附带说明

### 时光机穿梭

git status 查看工作区当前状态
git diff 查看修改内容

- 版本回退

  历史间穿梭
  git reset --hard commit_id
  穿梭前，使用git log 查看要去往哪个版本
  穿梭后，使用git reflog查看历史命令，找回id

	- 好比打游戏存档，“保存一个快照”，这个快照就是commit
	- 通过git log 查看记录，HEAD表示当前版本，上一个版本就是HEAD^，上上一个版本就是HEAD^^，前一百个版本就是HEAD~100
	- 回退：git reset --hard HEAD^
	- 从20世纪回到19世纪后，后悔了，（没有关闭当前窗口）想回20世纪怎么办？git reset --hard 1094a

	  1094a是版本号，版本号不一定写全，但是一两个又太短，可能出现重复

	- 我在19世纪待了一段时间，机器关闭后，又重启，此时我需要使用git reflog来查看每一次的命令，让我有回去的机会

- 工作区与暂存区

	- 工作区

		- 工作目录，就是一个文件夹
		- 工作区有一个隐藏目录.git  就是版本库，版本库里存放了很多东西，最重要的是暂存区（stage），还有git为我们创建的第一个分支master，以及指向master的指针HEAD

		  前面说往git版本库里添加的时候分两步，
		  第一步：git add  把文件修改添加到暂存区
		  第二部：git commit  把暂存区的所有内容提交到当前分支

	- 暂存区

### 远程仓库

- 添加远程仓库

	- 1.创建SSH key

		- ssh-keygen -t rsa -C "1137771728@qq.com"
		- 无需设密码，一路enter即可

	- 2.登录github 打开Account settings 选SSH Keys页面，然后点击add SSH key
	- 情景：本地与远程库内容同步

		- 1.登录GitHub，创建一个仓库
		- 2.执行 git remote add origin git@github.com:D-wqs/YX.git

			- 报错：fatal: remote origin already exists.

				- 解决：git remote rm origin

		- 3.本地提交到 远程【 git remote add origin git@github.com:D-wqs/YXgo.git】

			- 报错：The authenticity of host 'github.com (13.250.177.223)' can't be established.
RSA key fingerprint is SHA256:nThbg6kXUpJWGl7E1IGOCspRomTxdCARLviKw6E5SY8.

				- 解决：在.ssh文件中本来有两个文件，输入yes后增加一个新文件

		- 4.从现在起，本地做了提交，就可以通过命令git push origin master把本地分支的最新修改推送至GitHub
		- 5.本地上传新仓库时，先git pull origin master --allow-unrelated-histories然后git push-u origin master

## 使用时的错误案例

### 1. git add readme.txt

$  git add readme.txt
warning: LF will be replaced by CRLF in readme.txt.
The file will have its original line endings in your working directory

问题描述：git add：添加至暂存区，但并未提交至服务器。git add . 是表示把当前目录下的所有更新添加至暂存区。

原因：这是因为文件中换行符的差别导致的。这个提示的意思是说：会把windows格式（CRLF（也就是回车换行））转换成Unix格式（LF），这些是转换文件格式的警告，不影响使用。
git默认支持LF。windows commit代码时git会把CRLF转LF，update代码时LF换CRLF。

### 2.git status

nothing added to commit but untracked files present (use "git add" to track)

会列出当前目录为被git管理的文件，
和被git管理且修改后还未commit的文件

解决办法：
将要忽略的的文件添加到.gitignore
vim .gitignore
追加内容（根据自己的提示添加）
     /target/
	zblog.xml
	注：可以使用模糊操作

*XMind: ZEN - Trial Version*