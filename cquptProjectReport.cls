\NeedsTeXFormat{LaTeX2e}
% \ProvidesClass{cquptProjectReport}[2020/12/25 version 1.0]
\ProvidesClass{cquptProjectReport}[2021/1/25 version 1.1]

% 设置纸张为A4纸,行距为1.25倍,设置默认字号为小4
\LoadClass[oneside,a4paper,UTF8,linespread=1.5,zihao=-4]{ctexart}

% 设置字体，中文宋体，英文Times New Roman
\setCJKmainfont[BoldFont = SimHei]{SimSun}
\setmainfont{Times New Roman}

% 设置页边距
\RequirePackage[top=2cm,bottom=2.5cm,left=2.5cm,right=2.5cm]{geometry}

% 设置章节格式
\ctexset{
	section={
		format={\zihao{4}\heiti\centering},
		name={,、},
		aftername={\hspace{0pt}},
		number=\chinese{section},
	},
	subsection={
		format={\zihao{-4}\heiti\raggedright},
		name={},
		aftername={\hspace{5bp}},
		number={\arabic{section}.\arabic{subsection}},
	},
	subsubsection={
		format={\zihao{-4}\heiti\raggedright},
		name={},
		aftername={\hspace{5bp}},
		number={\arabic{section}.\arabic{subsection}.\arabic{subsubsection}},
	},
	appendix={
		name={附录,：},
		number=\arabic{section},
	}
}

% 封面
% $\Box$春$\blacksquare$秋
\RequirePackage{ifthen}
\def\TheNameOfTheProject#1{\gdef\@TheNameOfTheProject{#1}}
\def\TheTitleOfTheProject#1{\gdef\@TheTitleOfTheProject{#1}}
\def\ClassNum#1{\gdef\@ClassNum{#1}}
\def\StudentID#1{\gdef\@StudentID{#1}}
\def\Name#1{\gdef\@Name{#1}}
\def\Teacher#1{\gdef\@Teacher{#1}}
\def\Season#1{\gdef\@Season{#1}}
\renewenvironment{titlepage}
{
	\hspace*{\fill} \\
	\hspace*{\fill} \\
	\begin{figure}[h]
		\centering
		\includegraphics[width=0.8\textwidth]{title.png}
	\end{figure}
	\begin{center}
		\textbf{\ziju{0.2}\zihao{0}课程设计报告册}
	\end{center}
	\vspace{70pt}
	\begin{table}[h]
		\renewcommand\arraystretch{1.8}
		\centering
		\zihao{4}
		\begin{tabular}{p{2.72cm}<{\centering}p{7.7cm}<{\centering}}
			\textbf{学年学期}： & \textbf{2020-2021\,学年\, \ifthenelse{\@Season < 2}{$\blacksquare$春$\Box$秋}{$\Box$春$\blacksquare$秋}学期} \\
			\cline{2-2}
			\textbf{课程名称}： &        \@TheNameOfTheProject                     \\
			\cline{2-2}
			\textbf{设计题目}： &        \@TheTitleOfTheProject                      \\
			\cline{2-2}
			\textbf{专业班级}： &        \@ClassNum                              \\
			\cline{2-2}
			\textbf{学生学号}： &       \@StudentID                                    \\
			\cline{2-2}
			\textbf{学生姓名}： &        \@Name                          \\
			\cline{2-2}
			\textbf{指导教师}： &        \@Teacher                             \\
			\cline{2-2}
		\end{tabular}
	\end{table}
	\vspace{60pt}
	\begin{center}
		\textbf{\zihao{3}重庆邮电大学教务处制}
	\end{center}
	\thispagestyle{empty}\setcounter{page}{-1}
	\newpage\thispagestyle{empty}
}


% 摘要
\def\KeyWord#1{\gdef\@KeyWord{#1}}
\renewenvironment{abstract}
{
	\begin{center}
		\textbf{\zihao{3}\label{zy}\textbf{摘~~要}}\pdfbookmark[1]{摘要}{zy}
	\end{center}\par
}
{
	\\\phantom{1}\\关键词：\@KeyWord\thispagestyle{empty}\setcounter{page}{-1}
	\newpage\thispagestyle{empty}
}

% 浮动体相关设置
\renewcommand*{\textfraction}{0.05}
\renewcommand*{\topfraction}{0.9}
\renewcommand*{\bottomfraction}{0.8}
\renewcommand*{\floatpagefraction}{0.85}

% 水印设置
\RequirePackage{background}
\backgroundsetup{scale = 1, angle = 0, opacity = 0.5, position=current page.north west, nodeanchor=north west, contents = {\includegraphics[height=0.43\paperwidth, keepaspectratio]{watermark.png}}}

% 页码设置
\RequirePackage{fancyhdr,lastpage}
\pagestyle{fancy}
\fancyhf{}
\renewcommand\headrulewidth{0pt}
\fancyfoot[C]{\zihao{-5}\thepage{}}

% 目录设置
\RequirePackage{titletoc}
\titlecontents{section}[0pt]{\addvspace{2pt}\filright}%
{\heiti\contentspush{\thecontentslabel\ }}%
{}{\titlerule*[8pt]{.}\contentspage}
\renewcommand{\contentsname}{\fontsize{16pt}{\baselineskip}\selectfont \textbf{目~~录}}
\renewcommand\linespread{1.25}

\RequirePackage{amsmath}
\RequirePackage{amsfonts} 
\RequirePackage{amsthm}
\RequirePackage{amssymb}
\let\lvert\relax\let\rvert\relax\let\lVert\relax\let\rVert\relax
\RequirePackage{newtxmath}
\RequirePackage{esint}
\DeclareSymbolFont{CMlargesymbols}{OMX}{cmex}{m}{n}
\let\sum\relax\let\prod\relax
\DeclareMathSymbol{\sum}{\mathop}{CMlargesymbols}{"50}
\DeclareMathSymbol{\prod}{\mathop}{CMlargesymbols}{"51}

% 加载物理、国标宏包
\RequirePackage{physics,siunitx}

% 设置虚数,自然底数,微分符号
\def\ee{\mathrm{e}}
\def\ii{\mathrm{i}}
\def\leq{\leqslant}
\def\geq{\geqslant}

% 载入表格宏包和插图宏包
\RequirePackage{booktabs,tabularx,multirow,longtable,makecell,array}
\newcolumntype{Y}{>{\centering\arraybackslash}X}
\RequirePackage{graphicx}

% 设置图片路径
\graphicspath{{figure/}}
\RequirePackage{caption}
\RequirePackage[section]{placeins}

\captionsetup{format=hang}% 设置浮动体标题悬挂缩进
\DeclareCaptionLabelSeparator*{sspace}{\ \ }
\captionsetup[figure]{labelsep=sspace}
\captionsetup[table]{labelsep=sspace}
\DeclareCaptionFont{heiti}{\heiti}
\DeclareCaptionFont{5hao}{\zihao{5}}
\captionsetup{labelfont={heiti,5hao},textfont={heiti,5hao}}

% 载入颜色宏包
\RequirePackage{color,xcolor}

% 载入参考文献宏包，设置引用格式
\RequirePackage{natbib}
\setcitestyle{square,super}

% 载入代码宏包
\RequirePackage{listings}
% 设置代码的默认样式
\lstset{
	frame=none,% 取消边框
	breaklines=true,% 允许自动断行
	% breakatwhitespace=true,% 使用此命令仅允许在空格处自动断行
	showstringspaces=false,% 不显示字符串中的空格
	basicstyle=\small\ttfamily,% 设置代码基本样式
	flexiblecolumns=true,% 改善字母间距
	keywordstyle=\color{blue},% 设置关键词样式
	stringstyle=\color[rgb]{0.75,0,0.75},% 设置字符串样式
	commentstyle=\songti\color[rgb]{0,0.5,0},% 设置注释样式
	tabsize=4,% 设置制表符缩进
}

% 设置matlab代码环境
\lstnewenvironment{matlab}[1][]{
	\lstset{
		language=Matlab,
		% deletekeywords={disp},% 可在此行去除特定关键词的语法高亮		
		keywordstyle=\color{blue},% 设置关键词样式
		stringstyle=\color[rgb]{0.75,0,0.75},% 设置字符串样式
		commentstyle=\songti\color[rgb]{0,0.5,0},% 设置注释样式
		#1
	}
}{}

% 设置python代码环境
\lstnewenvironment{python}[1][]{
	\lstset{
		language=Python,
		keywordstyle=\color[RGB]{255,119,0},% 设置Keywords样式
		morekeywords={as},% 将特定单词加入Kewords中
		deletekeywords={print},%从 keywords中去除特定单词
		keywordstyle=[2]\color[RGB]{144,0,144},% 设置Builtins样式
		morekeywords=[2]{print},% 将特定单词加入Builtins中
		stringstyle=\color[RGB]{0,170,0},% 设置字符串样式
		commentstyle=\songti\color[RGB]{221,0,0},% 设置注释样式	
		#1
	}
}{}

% 单元格内换行，使用如 & \tabincell{c}{abc\\ def\\ hij} \\
\newcommand{\tabincell}[2]{\begin{tabular}{@{}#1@{}}#2\end{tabular}}

% 载入超链接宏包
\RequirePackage{hyperref}
\hypersetup{breaklinks,colorlinks}% 允许超链接断行,取消超链接的边框,使链接文字带颜色
\hypersetup{hidelinks,bookmarksnumbered=true,bookmarksopen=true,pdfstartview=Fit}% 取消超链接的颜色，书签目录增加编号

\RequirePackage{cleveref}% 载入自动引用宏包
\crefname{figure}{图}{图}
\crefname{table}{表}{表}
\crefname{equation}{式}{式}
\renewcommand{\eqref}[1]{\labelcref{#1}~\namecref{#1}}


% 我们需要的是counterwithin. 首先，我们需要给出的是环境名。比如说，我们想改变的是表格环境的编号方式，环境名就是table, 图片的环境名就是figure. 接下来，我们需要考虑的是这个编号是跟着哪个编号走的。比如说，如果我需要表格的编号跟着section走，即section的编号是1，那么该章节内第三个出现的表格的编号就是1.3, 如果表格的编号跟着subsection走，即subsection的编号是1.3, 那么该子章节内第三个出现的表格的编号就是1.3.3. 下面假设我们要改变的是表格环境的编号方式，让它跟着subsection走，那么我们需要在导言区写的是：
\counterwithin{table}{section}
\counterwithin{figure}{section}
\numberwithin{equation}{section}

% 子图
\usepackage{caption}
\usepackage{subfigure}