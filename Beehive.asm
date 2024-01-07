org 0x8400
jmp start
max dw 0	;定义一个字dw(16位，双字节),大小写标志，0小写1大写

color 
		 db 0,86,171,245
         db 1,86,245,131
         db 2,2,217,63
         db 3,217,202,2
         db 4,244,208,0
         db 5,255,255,255
		 ;界面用到的颜色参数
;开机锁屏界面↓
data_xi:	
	db 0,1,1,1,1,1,1,1,0,1,1,1,1,1,2           
	db 0,1,0,0,0,1,0,0,0,1,0,0,0,1,2
	db 0,1,0,0,0,1,0,0,0,1,0,0,0,1,2
	db 0,1,0,1,1,1,1,1,0,1,0,0,0,1,2
	db 0,1,0,1,0,0,0,1,0,1,1,1,1,1,2
	db 0,1,0,1,0,0,0,1,0,1,0,0,0,0,2
	db 0,1,0,1,1,1,1,1,0,1,0,0,0,0,2
	db 0,1,0,0,0,1,0,0,0,1,0,0,0,1,2
	db 0,1,0,0,0,1,0,0,0,1,0,0,0,1,2
	db 0,1,1,1,1,1,1,1,0,0,1,1,1,1,2
	db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,2
	db 0,0,1,0,0,1,0,0,1,0,0,0,1,0,2
	db 0,0,1,0,0,0,1,0,0,1,0,0,0,1,2
	db 0,1,0,0,0,0,1,0,0,1,0,0,0,1,2
	db 1,0,0,0,0,0,0,0,0,0,0,0,0,1,3	
;熙

x1   dw 0		
y1   dw 0		
x2   dw 0	
y2   dw 0
;画横竖线条，重复组成{框} 变量（起点坐标、终点坐标）


b_x1   dw 55	
b_y1   dw 25	;外，左上角
b_x2   dw 257	
b_y2   dw 28	;

b_x3   dw 55	
b_y3   dw 177	;
b_x4   dw 257	
b_y4   dw 180	;外，右下角

b_x5   dw 55	
b_y5   dw 25	;外，左上角
b_x6   dw 58	
b_y6   dw 177	;内，左下角

b_x7   dw 257	
b_y7   dw 25	;外，右上角
b_x8   dw 260	
b_y8   dw 180	;

b_x9   dw 58	
b_y9   dw 28	;内，左上角
b_x10   dw 257	
b_y10   dw 30	;

b_x11   dw 58	
b_y11   dw 175	;
b_x12   dw 257	
b_y12   dw 177	;

b_x13   dw 58	
b_y13   dw 28	;内，左上角
b_x14   dw 60	
b_y14   dw 177	;

b_x15   dw 255	
b_y15   dw 28	;内，右上角
b_x16   dw 257	
b_y16   dw 177	;

b_x17   dw 85	
b_y17   dw 80	;
b_x18   dw 230	
b_y18   dw 100	;
;一些静态变量，固定不变的数据


;解锁后的系统桌面↓
b_x21   dw 0	
b_y21   dw 180	
b_x22   dw 320	
b_y22   dw 200;任务栏区域，大小：320*20

b_x23   dw 0	
b_y23   dw 180	
b_x24   dw 40	
b_y24   dw 200;windows Logo区域，大小：40*20

b_x25   dw 10	
b_y25   dw 10	
b_x26   dw 30	
b_y26   dw 30;“系”字区域，20x20大小

b_x27   dw 10	
b_y27   dw 40	
b_x28   dw 30	
b_y28   dw 60;"统"字区域

b_x19   dw 10	
b_y19   dw 70	
b_x120   dw 30	
b_y120   dw 90;"桌"字区域

b_x121   dw 10	
b_y121   dw 100	
b_x122   dw 30	
b_y122   dw 120;"面"字区域
c db 0
;仍旧存放一些静态变量，固定不变的数据


;界面绘画结束←


;下面进行输入操作的参数编码设计↓


beginlocation dw 1166
writelocation dw 1166;定义输入操作开始的位置
location dw 0;跟踪当前输入的位置
;键盘起始位置设定↑

alpha 	db 'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'
		db '0','1','2','3','4','5','6','7','8','9',' ',' ','!','?'
		;小写字母字节数组
;键盘输入---小写字母+一些符号存放↑

alphA 	db 'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z'
		db '0','1','2','3','4','5','6','7','8','9',' ',' ','!','?'
		;大写字母字节数组
;键盘输入---大写字母+一些符号存放↑

judge 	db 0x1e,0x30,0x2e,0x20,0x12,0x21,0x22,0x23,0x17,0x24,0x25,0x26,0x32,0x31;A-N的键盘扫描码
		db 0x18,0x19,0x10,0x13,0x1f,0x14,0x16,0x2f,0x11,0x2d,0x15,0x2c;O-Z的键盘扫描码
		db 0x52,0x4f,0x50,0x51,0x4b,0x4c,0x4d,0x47,0x48,0x49,0x39,0x0e,0x1c,0x01;0-9的扫描码+空格键+回退键+enter键+esc键
;键盘输入---用到的扫描码存放↑



title	 	db ' Please Enter Your Password: '
password	db 'LiuXX3';设置为6位
passwordnum	dw 0
passjudge	db '00000000000000000000000000000'
passright	db '   welcome, <LiuXiXi>   '
passwrong	db '[Warning!]the password is wrong!'
;密码输入后的校对↑及打印结果


myvoice: 	db 3,3,3,3,3,3,3,5,1,2,3,4,4,4,4,4,3,3,3,5,5,4,2,1,7,1,3,2,1,1,1,1,3,2,1,2,2,2,4,3,2,8	
;开机音乐↑，是<春节序曲>的谱子，但听不出来
voicelocation: db 0	
shift db 0
caps db 0
;开机音乐的一些相关参数↑


;进入13h号320*200 256色的图形模式(分辨率320x200像素，使用16KB的显存（320x200 / 8 bits），每个像素使用一个字节。)↓
start:	
	mov dx,0x20 		 ;dx(16位)寄存器,0x20用于发送中断结束信号
	mov al,0x61			 ;al(低8位)寄存器,0x61是键盘控制器的端口地址
	out dx,al			 ;(out指令通过I/O端口将数据从处理器传送到外部设备)使用 out 将 0x61 这个数据写入端口 0x20，实现键盘中断结束
	mov ah,00h			 ;ah(高8位)显示器模式
	mov al,13h			 ;将 13h（对应于13号图形模式）加载到寄存器 al 中
	int 10h				 ;int指令后跟一个中断号，10h是视频服务中断,调用BIOS中断10h，执行显示器模式设置
	mov ax,0x0a000		 ;在显存地址 0x0a0000 开始的区域进行图形绘制
	;设置键盘中断结束信号和切换到图形模式↑

	mov si,color		 ;si寄存器用于存放颜色数据
	mov es,ax			 ;es赋值为ax
	mov ax,0			 ;ax清零
	mov ds,ax			 ;ds是默认的数据段寄存器
	mov   bx, 0			 ;bx 寄存器用于存放偏移地址
	call  dis			 ;调用调色板函数
	;设置颜色到显存中↑

	mov   ax,[ds:b_x1]	 ;读取以 ds:b_x1 为偏移地址的字（16位）数据，将其存放到 ax 寄存器中。
	mov   [ds:x1],ax
	mov   ax,[ds:b_y1]
	mov   [ds:y1],ax
	mov   ax,[ds:b_x2]
	mov   [ds:x2],ax
	mov   ax,[ds:b_y2]
	mov   [ds:y2],ax
	mov	  byte[ds:c],1	
	call  drawline
	;根据坐标调用drawline函数，依次画出多条线段，每条线段通过修改 [ds:c] 来确定颜色↑↓

	mov   ax,[ds:b_x3]
	mov   [ds:x1],ax
	mov   ax,[ds:b_y3]
	mov   [ds:y1],ax
	mov   ax,[ds:b_x4]
	mov   [ds:x2],ax
	mov   ax,[ds:b_y4]
	mov   [ds:y2],ax
	mov   byte[ds:c],1
	call  drawline

	mov   ax,[ds:b_x5]
	mov   [ds:x1],ax
	mov   ax,[ds:b_y5]
	mov   [ds:y1],ax
	mov   ax,[ds:b_x6]
	mov   [ds:x2],ax
	mov   ax,[ds:b_y6]
	mov   [ds:y2],ax
	mov   byte[ds:c],1
	call  drawline

	mov   ax,[ds:b_x7]
	mov   [ds:x1],ax
	mov   ax,[ds:b_y7]
	mov   [ds:y1],ax
	mov   ax,[ds:b_x8]
	mov   [ds:x2],ax
	mov   ax,[ds:b_y8]
	mov   [ds:y2],ax
	mov   byte[ds:c],1
	call  drawline
	
	mov   ax,[ds:b_x9]
	mov   [ds:x1],ax
	mov   ax,[ds:b_y9]
	mov   [ds:y1],ax
	mov   ax,[ds:b_x10]
	mov   [ds:x2],ax
	mov   ax,[ds:b_y10]
	mov   [ds:y2],ax
	mov   byte[ds:c],2
	call  drawline

	mov   ax,[ds:b_x11]
	mov   [ds:x1],ax
	mov   ax,[ds:b_y11]
	mov   [ds:y1],ax
	mov   ax,[ds:b_x12]
	mov   [ds:x2],ax
	mov   ax,[ds:b_y12]
	mov   [ds:y2],ax
	mov   byte[ds:c],2
	call  drawline

	mov   ax,[ds:b_x13]
	mov   [ds:x1],ax
	mov   ax,[ds:b_y13]
	mov   [ds:y1],ax
	mov   ax,[ds:b_x14]
	mov   [ds:x2],ax
	mov   ax,[ds:b_y14]
	mov   [ds:y2],ax
	mov   byte[ds:c],2
	call  drawline

	mov   ax,[ds:b_x15]
	mov   [ds:x1],ax
	mov   ax,[ds:b_y15]
	mov   [ds:y1],ax
	mov   ax,[ds:b_x16]
	mov   [ds:x2],ax
	mov   ax,[ds:b_y16]
	mov   [ds:y2],ax
	mov   byte[ds:c],2
	call  drawline

	mov   ax,[ds:b_x17]
	mov   [ds:x1],ax
	mov   ax,[ds:b_y17]
	mov   [ds:y1],ax
	mov   ax,[ds:b_x18]
	mov   [ds:x2],ax
	mov   ax,[ds:b_y18]
	mov   [ds:y2],ax
	mov   byte[ds:c],4
	call  drawline

;显示打点矩阵[data_xi]("熙")↓	
	mov si, data_xi
	mov bx, 12945	;(0x3221)bx 被用作显存中的偏移量；?
	mov al, 0
draw1:			
	mov ah, [ds:si]	;取出打点矩阵的第一个字节到ah
	cmp ah, 0
	je draw2	;等于0就跳到drawe2——即打空点
	cmp ah,1
	je draw3	;等于1就跳到draw3——即打点
	cmp ah,2
	je draw4	;等于2就跳到draw4——换行
	jmp quit		
draw2:			
	mov byte [es:bx], 0	;将显存中的*当前位置*设置为 0（背景色）
	jmp quit
draw3:			
	mov byte [es:bx], 2	;将显存中的*当前位置*设置为 2（前景色，表示打点）
	jmp quit
draw4:			
	add bx,305			;将 bx 增加 305个字节，即换行(一行最多显示320个字节，矩阵中一行包含15个字节，305+15=320，即换行)
quit:					;判断取出数据是否为3
	inc si				;si 增加 1，指向下一个字节
	inc al				;al 增加 1
	inc bx				;bx 增加 1，移动到下一个位置
	mov ah, [ds:si]		;从 data_xi 中再次取出一个字节到寄存器 ah
	cmp ah, 3			;如果为3则表示打点结束
	jne draw1			;如果不是则重新跳到draw1开始比较

;结束锁屏打点后，进行键盘中断的处理（等待enter键输入）↓
newwindows:
	cli							;CLI指令用于清除中断标志位，禁止中断
	mov word[ds:0x24],int_join	;将中断处理程序的地址存储到中断向量表的0x24处，对应键盘中断，当中断触发时，CPU就知道从哪个地址开始执行相应的中断处理程序
	mov word[ds:0x26],0			;将中断处理程序的偏移量存储到中断向量表的0x26处
	sti							;STI指令用于设置中断标志位，允许中断
	jmp $						;无条件跳转到当前位置（形成一个无限循环）,等待中断
int_join:
	mov dx,0x60		;读取键盘缓冲区数据（0x60是读取键盘缓冲区数据的端口号）
	in al,dx		;读取dx数据到al中
	cmp al,0x1c		;用 'Enter' 键作为启动键
	je passstart
	jmp join_end	
join_end:			;键盘中断结束
	mov dx,0x20		
	mov al,0x61
	out dx,al
	jmp newwindows	;无条件跳转到 newwindows 标签，继续等待中断
	ret				;函数返回
	

;输入以及密码判定部分↓
passstart:	
	mov dx,0x20 		 ;键盘中断结束
	mov al,0x61			 ;键盘控制端口
	out dx,al

	mov ax,0xb800		 ;(0xb800 是彩色文本显示模式)将显示缓冲区的段地址存储到 ax 寄存器中
	mov es,ax			 ;设置 es 寄存器为显示缓冲区的段地址
	mov ah, 00h		;显示器模式
   	mov al, 03h		;显示文本模式(80列*25行*2字节)
   	int 10h			;调用BIOS中断10h，执行显示器模式设置
	mov ax,0		;清空 ax 寄存器
	mov ds,ax		;设置 ds 寄存器为0，这里是为了保证 ds 寄存器的正确性

	mov si,0		;将0存储到 si 寄存器中

;在屏幕上制造一行空行↓
 refresh1:	
    mov byte[es:si],' '		;将空格字符写入显示缓冲区
	mov byte[es:si+1],0x0a	;将换行字符写入显示缓冲区的下一个位置(0x0a是换行的ascii码)
	add si,2				;移动 si 寄存器到下一个字符位置
	cmp si,80				;比较 si 寄存器的值是否小于80(最大80列)
	jb refresh1				;如果小于80，继续执行 refresh1 标签处的指令

	mov bx,0				;将0存储到 bx 寄存器中
	mov si,1000				;将1000存储到 si 寄存器中

;从数据段 [ds] 中的 title 处复制字符到显示缓冲区↓
 Title:	mov cl,[ds:title+bx]	;从数据段的 title+bx 处读取一个字节，存储到 cl 寄存器
		mov byte[es:si],cl		;将 cl 的值写入显示缓冲区
		mov byte[es:si+1],0x0b	;垂直制表符
		add bx,1				;bx 寄存器增加1，移动到下一个字符
		add si,2				;si 寄存器增加2，移动到下一个显示缓冲区位置
		cmp bx,29				;设定输入提醒语句字长为*29*位,比较 bx 寄存器的值是否小于29
		jb Title				;如果小于29，跳转到 Title 标签，继续执行上述指令

	cli							;禁用中断
	mov word[ds:0x24],int_key	;将中断处理程序的地址存储到中断向量表的0x24处
	mov word[ds:0x26],0			;将中断处理程序的偏移量存储到中断向量表的0x26处

	sti							;启用中断
	mov si,0					;将0存储到 si 寄存器中
	mov bx,0					;将0存储到 bx 寄存器中
	jmp $						;无限循环,等待中断

;处理键盘中断(输入大小写)↓
int_key:
	mov dx,0x60		;读取键盘缓冲区数据
	in al,dx		;从键盘缓冲区读取数据，存储到 al 寄存器
	cmp al,0x2a		;检查是否按下 'SHIFT' 键,用 'SHIFT' 键来作为大小写切换按键
	je flag			;跳转到flag切换大小写

;判断输入的大小写
change:	in al,dx               ;从键盘缓冲区读取一个字节的数据，存储到 al 寄存器
		mov bx,[ds:max]	       ;从数据段的 max 地址读取值，存储到 bx 寄存器
		cmp bx,0		       ;比较 bx 寄存器的值是否等于 0，即判断大小写状态
		je a0				   ;如果等于0（小写），跳转到标签 a0 处继续处理小写字符
		cmp bx,1			   ;比较 bx 寄存器的值是否等于 1，即判断大小写状态
		je a1				   ;如果等于1（大写），跳转到标签 a1 处继续处理大写字符

;小写键盘的输入↓
a0:	mov bx,[ds:location]	;location (当前输入位置)，存储到 bx 
	mov cl,[ds:alpha+bx]	;(小写字母表)当前位置存储在cl
	cmp al,[ds:judge+bx]	;比较 al (输入的扫描码的值)和 judge+bx (字符库中键盘扫描码)的值是否相等
	jne bxx					;不相等，跳转bxx
	;直到扫描码相等，即输入与字符库匹配↑

	;匹配后，检测是否为特殊键↓
	cmp al,0x0e				;回退键
	je Backspace       		;如果是回退键的话退格
	cmp al,0x1c				;enter键
	je Enter       			;如果是enter键的话与密码进行判定
	cmp al,0x01				;esc键
	je Esc					;如果是退出键的话就退出

	mov si,[ds:passwordnum]			;此处用于密码信息输入，为后续判定做铺垫
	mov byte[ds:passjudge+si],cl	;将匹配的小写字符存储到passjudge中
	add si,1						;passwordnum + 1
	mov word[ds:passwordnum],si		;passswordnum更新，信息输入暂时结束
	mov si,[ds:writelocation]		;获取 writelocation 的值
	mov byte[es:si],cl				;将 cl 的值(匹配的小写字符)写入显示缓冲区
	mov byte[es:si+1],0x0c			;显示缓冲区下一个位置写入换行字符
	add si,2						;writelocation + 2
	mov word[ds:writelocation],si	;更新writelocation
	jmp End1						;结束处理

bxx:	add bx,1					;bx 加 1
		cmp bx,40					;比较 bx 是否等于 40(共准备了40个小写字符，说明输入的字符没有在字符库中)
		je End1						;如果相等，跳转到 End1 处结束处理
		mov word[ds:location],bx	;存储 bx 到 location
		jmp a0						;无条件跳转到 a0 处，继续处理下一个小写字符

;处理大写键盘的输入↓
a1:	mov bx,[ds:location]		;从数据段的 location (当前输入位置)地址读取值，存储到 bx 寄存器
	mov cl,[ds:alphA+bx]		;从数据段的 alphA+bx (大写字母表)地址读取值，存储到 cl 寄存器
	cmp al,[ds:judge+bx]		;比较 al 寄存器的值(输入的扫描码的值)和 judge+bx (字符库中键盘扫描码)的值是否相等
	jne Bxx						;如果不相等，跳转到 Bxx 处
	;直到扫描码相等，即输入与字符库匹配↑

	;匹配后，检测是否为特殊键↓
	cmp al,0x0e			;是否等于 0x0e（回退键）
	je Backspace		;如果是回退键的话退格
	cmp al,0x1c
	je Enter       		;如果是回车键的话与密码进行判定
	cmp al,0x01
	je Esc				;如果是退出键的话就退出

	mov si,[ds:passwordnum]		;此处用于密码信息输入，为后续判定做铺垫
	mov byte[ds:passjudge+si],cl	;将 字符库 的值存储到 passjudge 处
	add si,1					;passwordnum 加 1,表示输入的位数
	mov word[ds:passwordnum],si	;存储 si 到 passwordnum
	mov si,[ds:writelocation]	;获取 wrtelocation 的值
	mov byte[es:si],cl			;将 字符库 的值写入显示缓冲区，显示输入的字符
	mov byte[es:si+1],0x0a		;将换行字符写入显示缓冲区的下一个位置
	add si,2					;si 加 2,显示下一个位置
	mov word[ds:writelocation],si	;存储 下一个显示位置 到 writelocation
	jmp End1					;处理结束

Bxx:	add bx,1				;bx 加 1
		cmp bx,40				;比较 bx 寄存器的值是否等于 40(共准备了40个大写字符，说明输入的字符没有在字符库中)
		je End1
		mov word[ds:location],bx;存储 bx 到 location
		jmp a1					;无条件跳转到 a1 处

;特殊键位的处理↓
Backspace:
	mov si,[ds:writelocation]		;获取 writelocation 的值
	cmp si,[ds:beginlocation]		;比较 writelocation 的值是否小于等于 beginlocation
	jbe End1						;如果小于等于，直接跳转到 End1 处结束处理

	mov bx,[ds:passwordnum]			;获取 passwordnum 的值
	sub bx,1						;减少 passwordnum 的值，相当于删除了一个字符
	mov byte[ds:passjudge+bx],'0'	;将 passjudge 处的对应字符设置为0，表示删除了一个字符
	mov word[ds:passwordnum],bx		;删减完毕,更新 passwordnum
	sub si,2						;wrtelocation 减 2，表示删除了一个字符
	mov byte[es:si],cl				;在显示缓冲区删除一个字符,当前字符回退一位显示
	mov byte[es:si+1],0x0a			;在显示缓冲区下一个位置添加一个换行字符
	mov word[ds:writelocation],si	;更新 wrtelocation
	jmp End1						;跳转到 End1 处结束处理

Esc:
	mov si,[ds:beginlocation]		;按下esc后刷新输入的密码	
	mov word[ds:writelocation],si	;刷新writelocation,重置为开始位置
	mov bx,0
	mov ax,[ds:passwordnum]			;将 passwordnum 的值存储到 ax 
	mov word[ds:passwordnum],0		;将 passwordnum 的值清零，表示密码长度为0
	mov bx,0
	mov word[ds:location],bx		;更新 location 为0，表示当前位置为0
	mov dx,0x20 					;键盘中断结束
	mov al,0x61
	out dx,al	
	jmp start						;跳转到 start 处，重新开始程序

Enter:
	mov si,[ds:beginlocation]		;回车后刷新输入的密码
	refresh2: mov byte[es:si],' '	;在屏幕上(显示缓存区)将当前密码位置的字符清空
	mov byte[es:si+1],0x0a			;在屏幕上将密码位置的下一个位置设置为换行字符
	add si,2						;si 寄存器加 2，移动到下一个密码位置
	cmp si,[ds:writelocation]		;比较 si 寄存器的值和 writelocation 的值，判断是否需要继续刷新
	jb refresh2						;如果 si 小于 writelocation，继续刷新
	mov si,[ds:beginlocation]		;将 beginlocation 的值存储到 si 寄存器
	mov word[ds:writelocation],si	;刷将 si 寄存器的值存储到 writelocation 中，即刷新结束
	mov bx,0						;将 bx 寄存器清零
	mov ax,[ds:passwordnum]			;将 passwordnum 的值存储到 ax 寄存器，表示密码的长度
	mov si,1328						;将 1328 存储到 si 寄存器，用于后续的操作

;在enter之后，循环判定与内设密码是否一致↓
 play: mov cl,[ds:passjudge+bx]		;将 passjudge+bx 处的值（用户输入的密码字符）存储到 cl 寄存器
	mov byte[ds:passjudge+bx],'0'	;将 passjudge+bx 处的值清零，用于下一次循环
	cmp cl,[ds:password+bx]			;比较用户输入的密码字符和预设密码的对应位置的字符
	jne print_wrong					;只要有一位不一样，直接错误	
	add bx,1						;移动到用户输入密码的下一位
	cmp bx,ax						;判断是否已经比较完passwordnum所有位数
	jb play							;如果 bx 小于 ax，继续下一轮比较
	cmp ax,6						;设定密码为6位
	jne print_wrong					;如果实际输入密码的位数不等于6，输出错误信息
	mov word[ds:passwordnum],0		;将 passwordnum 的值清零，表示密码位数为0

;若密码正确↓
print_right:				
	mov bx,0
 right:	mov cl,[ds:passright+bx]	;将 passright+bx 处的值（密码正确时的欢迎语句字符）存储到 cl 寄存器
	mov byte[es:si],cl				;将 cl 寄存器的值存储到屏幕缓冲区指定位置,显示欢迎语句当前字符
	mov byte[es:si+1],0x0a			;在屏幕上将密码正确时的欢迎语句位置的下一个位置设置为换行字符
	add bx,1						;移动到欢迎语句的下一位
	add si,2						;移动到屏幕缓冲区的下一位置
	cmp bx,24						;固定欢迎语句字长为24字符
	jb right						;如果 bx 小于 24，继续输出
	call windowsdelay				;调用延时函数
	jmp windowsstart				;无条件跳转到 windowsstart，即开始主程序

;若密码错误↓
print_wrong:				
	mov word[ds:passwordnum],0		;将 passwordnum 的值清零，表示密码位数为0
	mov bx,0
 wrong:	mov cl,[ds:passwrong+bx]	;将 passwrong+bx 处的值（密码错误时的报错语句的当前位置字符）存储到 cl 寄存器
	mov byte[es:si],cl				;将 cl 寄存器的值存储到屏幕缓冲区指定位置,显示当前报错字符
	mov byte[es:si+1],0x0c			;在屏幕上将密码错误时的报错语句位置的下一个位置设置为换行字符
	add bx,1						;移动到报错语句的下一位
	add si,2						;移动到屏幕缓冲区的下一位置
	cmp bx,32						;固定报错语句字长为32位，判断是否已经输出完整的报错语句
	jb wrong						;如果 bx 小于 32，继续输出
	jmp End1						;跳转到 End1，结束密码检测程序

;结束键盘中断↓
End1:	mov bx,0
		mov word[ds:location],bx
		mov dx,0x20 			;键盘中断结束
		mov al,0x61
		out dx,al			

		iret

;判断大小写
flag:	mov bx,[ds:max]		;max作为大小写切换的判定,0为小写，1为大写
	cmp bx,1				;如果为1，则flag0切换为0
	je flag0				
				
	cmp bx,0				;如果为0，则flag1切换为1
	je flag1
;切换小写
flag0:	mov bx,0
	mov word[ds:max],bx
	jmp change				;change块用来判定是大写还是小写
;切换大写
flag1:	mov bx,1
	mov word[ds:max],bx	
	jmp change


;颜色赋值函数
dis:
	mov 	dx,0x3c8	;0x3c8是VGA图形模式的调色板端口，用于写入颜色索引
	mov	al,[si]			;si存放颜色数据，此处是颜色索引，读取到al中
	out	dx,al			;颜色索引输出到调色板端口

	mov 	dx,0x3c9	;0x3c9用于写入调色板的 RGB 值
	mov	al,[si+1]
	out	dx,al			;R

	mov	al,[si+2]
	out	dx,al			;G

	mov	al,[si+3]
	out	dx,al			;B

	add si,4			;将 si 寄存器的值增加 4，使其指向下一个调色板索引
	add bx,4			;将 bx 寄存器的值增加 4，用于追踪处理的调色板索引数量
	cmp bx,20			;将 bx 寄存器的值与 20 进行比较(共有5个颜色数字，每组4位数据)
	jna dis				;如果 bx 寄存器的值不大于 20，则跳转到 dis 标签处，继续执行后续指令；否则，跳出循环。

	ret					;函数返回

;画线函数
drawline:		
	mov	ax,[ds:y1]			;起点y坐标
	mov	bx,320				;屏幕宽度
	mul	bx					;将ax和bx的值相乘,ax保存的是直线起点的y坐标在屏幕上的偏移
	mov	cx, ax				;将ax的值（偏移）赋给cx
	add	ax,[ds:x1]			;将直线起点的x坐标添加到ax中
	add	cx, [ds:x2]			;将直线终点的x坐标添加到cx中
	mov	bx,ax				;将ax的值复制到bx中，此时bx中存储的是直线的起点在屏幕上的偏移
	mov	ax,0				;将ax清零
	;开始循环↓
x:
	mov 	al,[ds:c]		;将颜色值加载到寄存器 al 中
	mov 	byte[es:bx],al	;将颜色值写入屏幕内存中的偏移地址 bx 处
	inc	bx					;递增 bx，移动到下一个屏幕像素位置
	cmp 	bx,cx			;比较 bx 和 cx 的值，判断偏移量是否到达终点x坐标
	jb 	x					;如果 bx 小于 cx，没有到达终点x坐标，则跳转到标签 x 继续循环；否则结束循环。

	mov	ax,[ds:y1]			;将直线起点的y坐标添加到ax中
	inc 	ax				;递增ax，实现y坐标偏移
	mov	word[ds:y1], ax		;更新起点y坐标，为下次循环准备
	
	cmp	ax,[ds:y2]			;比较起点与终点y坐标
	jb	drawline			;小于终点y坐标，跳转，继续循环
	ret						;直到等于终点y坐标，结束画线函数


;登录成功后的桌面界面↓
%include "Beehivedata.asm"
windowsstart:
	mov bx,0
	mov word[ds:location],bx	;初始化起始位置

	mov dx,0x20 		 		;键盘中断结束
	mov al,0x61
	out dx,al		

	mov ah,00h					;显示器模式
	mov al,13h					;设置显示器模式为 13h
	int 10h						;执行显示器模式
	mov ax,0x0a000				;加载显存起始地址（0xa0000）

	
	mov si,color				;加载颜色信息
	mov es,ax					;显存设置给 es 寄存器
	mov ax,0					;ax清零
	mov ds,ax					;ds初始化

	mov bx, 0					
	call dis					;调用调色板函数

	;在屏幕上绘制基本图形
	;任务栏
	mov   ax,[ds:b_x21]
	mov   [ds:x1],ax
	mov   ax,[ds:b_y21]
	mov   [ds:y1],ax
	mov   ax,[ds:b_x22]
	mov   [ds:x2],ax
	mov   ax,[ds:b_y22]
	mov   [ds:y2],ax
	mov byte[ds:c],3	
	call drawline

	;LOGO
	mov   ax,[ds:b_x23]
	mov   [ds:x1],ax
	mov   ax,[ds:b_y23]
	mov   [ds:y1],ax
	mov   ax,[ds:b_x24]
	mov   [ds:x2],ax
	mov   ax,[ds:b_y24]
	mov   [ds:y2],ax
	mov byte[ds:c],2
	call drawline

	;“系”背景
	mov   ax,[ds:b_x25]
	mov   [ds:x1],ax
	mov   ax,[ds:b_y25]
	mov   [ds:y1],ax
	mov   ax,[ds:b_x26]
	mov   [ds:x2],ax
	mov   ax,[ds:b_y26]
	mov   [ds:y2],ax
	mov   byte[ds:c],4
	call  drawline

	;“统”背景
	mov   ax,[ds:b_x27]
	mov   [ds:x1],ax
	mov   ax,[ds:b_y27]
	mov   [ds:y1],ax
	mov   ax,[ds:b_x28]
	mov   [ds:x2],ax
	mov   ax,[ds:b_y28]
	mov   [ds:y2],ax
	mov   byte[ds:c],4
	call drawline

	;“桌”背景
	mov   ax,[ds:b_x19]
	mov   [ds:x1],ax
	mov   ax,[ds:b_y19]
	mov   [ds:y1],ax
	mov   ax,[ds:b_x120]
	mov   [ds:x2],ax
	mov   ax,[ds:b_y120]
	mov   [ds:y2],ax
	mov	  byte[ds:c],4
	call  drawline

	;“面”背景
	mov   ax,[ds:b_x121]
	mov   [ds:x1],ax
	mov   ax,[ds:b_y121]
	mov   [ds:y1],ax
	mov   ax,[ds:b_x122]
	mov   [ds:x2],ax
	mov   ax,[ds:b_y122]
	mov   [ds:y2],ax
	mov   byte[ds:c],4
	call  drawline

;获取汉字data		
	mov  si, font1	;系
	mov  bx, 3852
	mov  al, 0
	call appcolor

	mov  si, font2	;统
	mov  bx, 13452
	mov  al, 0
	call appcolor

	mov  si, font3	;桌
	mov  bx, 23052
	mov  al, 0
	call appcolor

	mov  si, font4	;面
	mov  bx, 32652
	mov  al, 0
	call appcolor

	mov si, windows1	;LOGO
	mov bx, 58252
	mov al, 0
	call appcolor

	mov si, beehive		;水印
	mov bx, 21560
	mov al, 0
	call appcolor2

	jmp musicstart
	ret

;绘制字符函数
appcolor:		
	mov ah, [ds:si]	;取出矩阵,读取当前一个字节
	cmp ah,6		;如果是6就换行
	je appcolor1	;换行
	mov byte [es:bx], ah
	jmp quit2		;跳转到 quit2 标签，结束当前字符的绘制

;换行操作	
appcolor1:
	add bx,305
quit2:
	inc si			;增加循环变量 si，指向下一个字符。
	inc al			;增加计数器 al
	inc bx			;增加 bx，显存偏移地址
	mov ah, [ds:si]	;从 si 处读取下一个字符
	cmp ah, 7		;若果为7表示绘画结束
	jne appcolor	;如果没有结束，则跳回 appcolor 标签，继续绘制下一个字符。
	ret

;系统菜单LOGO绘制函数↓
appcolor2:			
	mov ah, [ds:si]			;从  si 处读取当前一个字节
	cmp ah,6				;如果是6就换行
	je appcolor21
	mov byte [es:bx], ah
	jmp quit21
appcolor21:
	add bx,218				;如果未跳转到 quit21，则增加 bx 的值，实现换行
quit21:
	inc si					;指向下一个字符
	inc al					;增加计数器 al
	inc bx					;增加 bx，显存偏移地址
	mov ah, [ds:si]			;从 si 处读取下一个字符
	cmp ah, 7				;如果为7表示绘画结束
	jne appcolor2			;如果没有结束，则跳回 appcolor2 标签，继续绘制下一个字符。
	ret	
	
;开机音乐↓（未完成）
musicstart:	
	;sti
	mov bx,0
	mov word[ds:location],bx
	mov dx,0x20 		 ;键盘中断结束
	mov al,0x61
	out dx,al	
	mov ax,0xb800        ;指向文本模式的显示缓冲区
   	mov es,ax

	mov ax,0
	mov ds,ax
	mov bx,1
	
	mov si,myvoice
	jmp beginvoice
	
	sti
	mov si,0
	mov bx,0
	jmp $

;开始播放音乐
beginvoice:
	mov al, [ds:si]
;不同音符
k0:	
	cmp al,0
	JNE k1
	mov bx,500
	call sound
	jmp music_end

k1:	
	cmp al,1
	JNE k2
	mov bx,4587
	call sound
	jmp music_end
	
k2:
	cmp al,2
	JNE k3
	mov bx,4087
	call sound
	jmp music_end
	
k3:
	cmp al,3
	JNE k4
	mov bx,3640
	call sound
	jmp music_end
	
k4:
	cmp al,4
	JNE k5
	mov bx,3436
	call sound
	jmp music_end
	
k5:
	cmp al,5
	JNE k6
	mov bx,3061
	call sound
	jmp music_end
	
k6:
	cmp al,6
	JNE k7
	mov bx,2727
	call sound
	jmp music_end
	
k7:
	cmp al,7
	JNE music_end
	mov bx,2429
	call sound
	jmp music_end

;结束音乐播放
music_end:
	
	inc si
	cmp al,8
	JNE beginvoice

	iret

;实现延时，控制音符的持续时间	
delay:  
	mov cx,300

xdelay1:	cmp cx,0
	je x5
	push cx
	mov cx,60000
x4:	dec cx
	jnz x4
	pop cx
	dec cx
	jmp xdelay1
x5:
	ret

;一个短暂的延时，用于产生音符之间的间隔
small_delay:
	mov cx,0xffff
x0:	dec cx
	jnz x0
	ret

;配置 PC 次声音发声器，通过设定频率来产生音调
sound:
	mov al,0xB6
	out 43H,al
	call small_delay
	mov ax,bx
	out 42H,al
	call small_delay
	mov al,ah
	out 42H,al
	call small_delay
	
	in al,61H;打开
	or al,0x03
	out 61H,al
	call small_delay
	call small_delay
	call small_delay
	call small_delay
	call small_delay

	in al,61H;关闭
	and al,0xFD
	out 61H,al
	ret
	
;12,000,000 次循环占用CPU时间，实现延时
windowsdelay:				
xx2:	push dx		;保存 dx 寄存器的值
	mov dx, 200		;设置初始值给 dx，控制外层循环次数		
xx3:	push cx		;保存 cx 寄存器的值
	mov cx, 60000	;设置初始值给 cx，控制内层循环次数
xx4:	dec cx		;将 cx 寄存器的值减一
	jnz xx4			;如果 cx 寄存器的值不为零，跳转到 xx4 继续循环
	pop cx			;恢复 cx 寄存器的值
	dec dx			;将 dx 寄存器的值减一
	jnz xx3			;如果 dx 寄存器的值不为零，跳转到 xx3 继续外层循环
	pop dx			;恢复 dx 寄存器的值
	ret				;返回

