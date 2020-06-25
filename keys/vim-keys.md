#### Normal 模式快捷键
---
```
选择
v

行选择
V

行块选择
ctrl v

ESC替代
ctrl [  or ctrl c

删除整行
ctrl u

删除单个字符
ctrl h

删除单词
ctrl w

删除当前位置之后内容
crtl k

行首
ctrl a

行位
ctrl e

返回一个字符
ctrl b

前进一个字符
ctrl f

返回一个单词
option b

前进一个单词
option f

模式快速回到编辑位置
gi

模式下一个单词第一位
w

模式上一个单词第一位
b

模式行字符搜索
f 字符

模式行上一个匹配
F

上翻页
crtl U

下翻页
ctrl D

当前行放屏幕中间
zz

删除单词
dw

删除单词包括空格
daw

删除单词不包括空格
diw

删除到指定字符并进入插入模式change to word
ctw

搜索
/ or ?
下一个n
上一个N
上一个单词匹配*
下一个单词匹配#


替换
% s/<\old\>/new/g

% 范围 可以是行数 1,20
s 替换
<\word\> 精确匹配
g 全局   n计数


查看缓冲区
:ls

:e ./filename.txt  tab可以补全

指定文件
:b filename

前一个文件
:bpre or :bp

后一个文件
:bnext or bn

最后一个文件
:blast or bl

第一个文件
:bfrist  or bf

屏幕移动
ctrl w

垂直分屏
:vs

水平分屏
:sp

粘贴自动缩进问题
set paste or set nopaste


宏 行操作
normal 模式  
qa 进行录制，进行行操作完之后，q退出宏录制
选中需要批量操作的内容
shift v  +  G + 
回放操作
:'<,'> normal @a

非宏方法
选中文本
shift v + G
行首添加双引号
'<,'> normal I"
行尾添加双引号
'<,'> normal A"

插入当前文件名
:r! echo %
插入当前文件名带路径
:r! echo %:p

返回文件修改前
:e!

返回上次操作位置
:p

主题
:colorscheme 按键 ctrl d 查看主题，输入主题名称替换
```
