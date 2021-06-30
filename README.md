# vim
基于Centos7 打造Golang 开发环境

## 源码编译 vim8
> 参考：https://gist.github.com/igorepst/95c99d96042367bf30a0f65531f89cc9

```
yum install epel-release
yum install gcc-c++ ncurses-devel ruby ruby-devel lua lua-devel luajit luajit-devel ctags python python-devel python3 python3-devel tcl-devel perl perl-devel perl-ExtUtils-ParseXS perl-ExtUtils-XSpp perl-ExtUtils-CBuilder perl-ExtUtils-Embed cscope gtk3-devel libSM-devel libXt-devel libXpm-devel libappstream-glib libacl-devel gpm-devel

yum list installed | grep -i vim
yum erase vim-common.x86_64 vim-enhanced.x86_64 vim-filesystem.x86_64 vim-X11

ln -s /usr/bin/python3.6 python3

git clone https://github.com/vim/vim.git

./configure --with-features=huge \
 --enable-pythoninterp=yes \
 --enable-python3interp=yes \
 --enable-perlinterp=yes \
 --disable-tclinterp \
 --with-x=yes \
 --enable-gui=gtk3 --enable-multibyte \
 --enable-cscope \
 --with-tlib=ncurses \
--enable-fail-if-missing \
--disable-darwin --enable-luainterp=yes \
--enable-rubyinterp=yes --enable-terminal \
 --enable-fontset --with-luajit --with-python3-command=python3 \
--enable-gtk3-check

make && sudo make install
```


## install zsh & oh my zsh(可选)
> https://gist.github.com/OndrejValenta/41c4c60f837ccd56c57ba496177676b3

## install gvm for switch go version(可选)
> https://github.com/moovweb/gvm


## 插件管理 vim-plug
> https://github.com/junegunn/vim-plug

### 安装
```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
如果失败，可以直接访问网址，复制所有内容，创建 `~/.vim/autoload/plug.vim` 文件，并粘贴进去

### 使用
编辑 `~/.vimrc` 文件，添加
```
call plug#begin()
  
    Plug 'https://github.com/preservim/nerdtree.git'

call plug#end()
```
如果想安装某个插件，可以找到其对应的 git 仓库地址，比如目录树插件 nerdtree 的仓库地址是 `https://github.com/preservim/nerdtree`，那只要在 `begin()` 和 `end()` 之间添加一行 `Plug 'https://github.com/preservim/nerdtree.git'` （注意仓库地址拼接了 .git），保存退出，然后在 vim 里输入 `:PlugInstall` 即可自动安装。

## 插件：文件模糊搜索 LeaderF
> https://github.com/Yggdroot/LeaderF

### 安装
使用 Plug 安装，需要 vim 支持 python3
```
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
```
然后执行 `:PlugInstall`

另外个性化了两个配置
```
" LeaderF 配置
let g:Lf_WindowPosition = 'popup' " 通过弹出框的形式搜索文件
let g:Lf_ShortcutF = '<C-P>' " 定义快捷键 ctrl+p 开启文件搜索
```

### 使用
快捷键 ctrl + p 打开搜索框，键入要查询的文件，在查询结果中用 ctrl + j 和 ctrl + l 导航到想要打开的文件，按 Enter 键即可。
* 打开搜索框：ctrl + p
* \<C-X>	open in horizontal split window
* \<C-]>	open in vertical split window
* \<C-T>	open in new tabpage

### 使用 rg
需要先安装 rg，`brew install ripgrep`
* 打开模糊搜索(当前目录)：`: Leaderf rg`，配置了快捷键 F5
* 打开模糊搜索(当前文件)：`: Leaderf rg --current-buffer`，配置了快捷键 F4

自定义了一些方便的快捷键
* 快速在当前文件查询光标处的这个单词：`\f`
```
nnoremap <silent> <leader>f :Leaderf rg --current-buffer -F <C-R><C-W><CR>
```
* 快速在全局范围内查找光标处的这个单词：`\gf`
```
nnoremap <silent> <leader>gf :Leaderf rg -F <C-R><C-W><CR>
```

## 插件：目录树 NedrTree
> https://github.com/preservim/nerdtree

### 安装
```
Plug 'preservim/nerdtree'
```
### 使用
* 打开关闭目录树：`F3`，自定义了 `ctrl+n`
* 打开｜关闭一个目录：`o`
* 递归打开一个目录下所有的子目录：`O`
* 递归关闭一个目录下所有的子目录：`X`
* 选中一个目录将它变为根目录：`C`
* change the CWD to the selected dir：`cd`
* change tree root to CWD：`CD`
* open file in prev window：`o`
* open file in split window：`s`

## go 插件 vim-go

### 安装

### 使用
* 格式化代码：`:GoFmt`
* build：`:GoBuild`
* run：`:GoRun`
* golint：`:GoLint`
* 跳转到定义处：`:GoDef`，`ctrl + ]`，`gd`
* 跳转到定义处的反向操作：`:GoDefPop`，`ctrl + t`
* 查看函数被引用的地方：`:GoCallers`
* 查看函数定义，将光标移动到函数上：`:GoDoc`，`K(大写的k)`
* 查看一个接口都在哪里被实现：`:GoImplements`

## 代码自动补全 YouCompleteMe

### 安装
```
Plug 'Valloric/YouCompleteMe'
```
vim 里执行 `:PlutInstall`

然后渠道商 YouCompleteMe 按安装目录执行
```
cd ~/.vim/plugged/YouCompleteMe
python3 install.py --gocode-completer
```
如果报错，根据报错信息提示去到 https://www.softwarecollections.org/en/scls/rhscl/devtoolset-8/ 页面，根据说明执行
```
yum install centos-release-scl
yum install devtoolset-8
scl enable devtoolset-8 bash
```
此时再次执行
```
python3 install.py --gocode-completer
```

## 其它

### 前缀键
默认前缀件：`\`

### 快捷键
* 在 vim 中打开终端：`:term`
* 让 vim 进入后台：`ctrl + z`
* 调出进入到后台的：`fg`
* 跳转到上一个光标处：`ctrl + o`
* 跳转到函数定义处：`gd`
* 跳转到函数定义处的反向操作：`ctrl + t`
* 光标跳转到下一个函数处：`]]`
* 光标跳转到上一个函数处：`[[`
* 跳到匹配的括号处：`%`
* 垂直分屏：`ctrl + w + v`
* 移动到词首：`b`
* 移动到词尾：`w`
