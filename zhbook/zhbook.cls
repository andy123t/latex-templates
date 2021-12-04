%
%   This is file `zhbook.cls',
%	@author andy123t
% 	@date 2021/03/26
%	@version v1.0.0
%	@address https://github.com/andy123t/zhbook
%   This template is based on HUSTPaperTemp
%

% ---------- 定义的新的Class ----------
\ProvidesClass{zhbook}[2021/03/26 v1.0.0]
\NeedsTeXFormat{LaTeX2e}


% ---------- 载入学校logo ----------
\def\logopic{shnu.eps}   %logo
\DeclareOption{SHNULogo} {
	\def\logopic{shnu.eps}
}
\ProcessOptions\relax

\newif\ifprint\printfalse
\DeclareOption{print}{\printtrue}
\ProcessOptions

% ---------- 载入Class ----------
\LoadClass[a4paper,openany,twoside]{book}


% ---------- 中文字体宏包 ----------
\RequirePackage[UTF8,zihao=-4]{ctex}


% --------- 定义不同编译方式 ----------
\RequirePackage{ifpdf,ifxetex}
\ifxetex
  \RequirePackage{fontspec}
  \RequirePackage{graphicx}
\else
  \ifpdf
  	\usepackage[utf8]{inputenc}
  	\RequirePackage[T1]{fontenc}
    \RequirePackage{graphicx}
    \RequirePackage{epstopdf}
  \else
    \RequirePackage[dvipdfmx]{graphicx}
    \RequirePackage{bmpsize}
  \fi
\fi


% ---------- 定义页边距 ----------
\RequirePackage{geometry}
\geometry{left=2.5cm,right=2.5cm,top=1.7cm,bottom=1.8cm,includehead,includefoot}
\setlength{\headheight}{15pt}
%\addtolength{\headsep}{-0.1cm}     % 页眉位置
%\addtolength{\footskip}{-0.1cm}    % 页脚位置

% ---------- 常用宏包 ----------
\RequirePackage{amsmath,amssymb,amsthm,amsfonts}  % AMS公式
\RequirePackage{bm}         % 数学公式黑斜体
\RequirePackage{mathrsfs}   % 数学英文花体
\RequirePackage{booktabs}
\RequirePackage{float}
\RequirePackage{cite}
\RequirePackage{longtable}  % 长表格
\RequirePackage{multirow}   % 表格多行合并
\RequirePackage{enumerate}  % 改变列表标号样式
\RequirePackage{color,xcolor}
\RequirePackage{fancyhdr}
\RequirePackage{setspace}
\RequirePackage{tikz}       % 绘制图形
\RequirePackage{titlesec}   % 设置标题样式
\RequirePackage{tabularx}
\RequirePackage{makecell}
\RequirePackage{xstring}    % 使用条件语句


% --------设置图片的路径 ---------
\graphicspath{{./figure/}{./figures/}{./image/}{./images/}}


% ---------- 定义章节的编号格式 ----------
\renewcommand{\chaptername}{第\arabic{chapter}章}
\renewcommand{\thesection}{\arabic{chapter}.\arabic{section}}
\renewcommand{\thesubsection}{\arabic{chapter}.\arabic{section}.\arabic{subsection}}
\renewcommand{\thesubsection}{\arabic{chapter}.\arabic{section}.\arabic{subsection}}
\renewcommand{\thesubsubsection}{\arabic{subsubsection}.}


\newcommand{\chpzihao}{\fontsize{20pt}{20pt}\selectfont}

%---------- 定义章节标题格式 ------------
\titleformat{\chapter}[hang]{\normalfont \heiti \chpzihao \filcenter }
    {\chpzihao \chaptertitlename}{20pt}{\chpzihao}
\titlespacing{\chapter}{0pt}{-1.5ex  plus .1ex minus .2ex}{3ex plus .1ex minus .2ex}

\titleformat{\section}[hang]{\heiti \zihao{-3}}
    {\zihao{-3} \thesection}{1em}{\zihao{-3}}
\titlespacing{\section}{0pt}{1.5ex plus .1ex minus .2ex}{1.5ex plus .1ex minus .2ex}

\titleformat{\subsection}[hang]{\heiti \zihao{4}}
    {\zihao{4} \thesubsection}{1em}{\zihao{4}}
\titlespacing{\subsection}%
    {0pt}{1.5ex plus .1ex minus .2ex}{\wordsep}

\titleformat{\subsubsection}[hang]{\heiti}
    {\thesubsubsection }{1em}{}{}
\titlespacing{\subsubsection}%
    {0pt}{1.2ex plus .1ex minus .2ex}{\wordsep}


%---------- 设置章节目录的深度 -------------
\setcounter{secnumdepth}{3}
\setcounter{tocdepth}{3} 


% ------------- 设置附录 -----------
\RequirePackage{titletoc}
\RequirePackage[title,titletoc]{appendix}
%\renewcommand{\appendixname}{附录}

%-------------- 定义页眉页脚 -------------------

% 定义页眉和页脚 使用fancyhdr 宏包
\newcommand{\makeheadrule}{%
    \makebox[-3pt][l]{\rule[.7\baselineskip]{\headwidth}{0pt}}
    \rule[0.85\baselineskip]{\headwidth}{0.5pt}\vskip-.8\baselineskip}

\makeatletter
\renewcommand{\headrule}{%
    {\if@fancyplain\let\headrulewidth\plainheadrulewidth\fi
     \makeheadrule}}

% ------------ 画单隔线 ------------
\renewcommand{\headrulewidth}{0.5pt}    % 在页眉下画一个0.5pt宽的分隔线
\renewcommand{\footrulewidth}{0pt}      % 在页脚不画分隔线。


% ------- 重新定义 cleardoublepage --------
\def\cleardoublepage{%
  \clearpage
  \ifprint
      \ifodd\c@page
      \else
        \thispagestyle{empty}%
        \hbox{}%
        \newpage
    \fi
  \fi
}

% ------------ 设置页眉样式 -----------
\newcommand{\headstyle}{
	% \fancyhead[R]{\color{black}\fangsong \leftmark}
	% \fancyhead[L]{\color{black} 上海师范大学硕士论文}
	\fancyhead[RO,LE]{\color{black}\zihao{5} ~\thepage~}
	\fancyhead[LO,RE]{\color{black} \zihao{5} \leftmark}
	% \fancyhead[L]{\fangsong \zihao{5} 上海师范大学硕士论文}
}


% ------- 设置页脚样式 ----------
%\newcommand{\footstyle}{\fancyfoot[C]{\fangsong \thepage}}
\newcommand{\footstyle}{}
\pagestyle{empty}
\pagestyle{fancy}
\fancyhf{} %清空原有样式
\headstyle
\footstyle


% ------ 定义一种新的格式叫做main ------------
\fancypagestyle{main}{%
    \pagestyle{fancyplain} 
	\fancyhf{} %清空原有样式
	\headstyle
	\footstyle
}


\renewcommand\chaptermark[1]{%
  \markboth{%
    \ifnum \c@secnumdepth >\m@ne
      \if@mainmatter
        \@chapapp\ \ %
      \fi
    \fi
    #1}{}%
}


% ----------- 中文段落缩进和行距 ------------
\setlength{\parindent}{2em}                 % 首行两个汉字的缩进量
\setlength{\parskip}{3pt plus1pt minus1pt}  % 段落之间的竖直距离
\renewcommand{\baselinestretch}{1.35}        % 定义行距
%\topskip=15pt   % 书写区域顶部空白
%\parskip=5pt
%\parindent=0pt
%\baselineskip=5pt
%\setlength{\baselineskip}{24pt}


% ------------------- 浮动对象设置 ---------------------
% 浮动对象的缺省值稍微宽松一点，从而防止幅度对象占据过多的文本页面
% 也可以防止在很大空白的浮动页上放置很小的图形
\renewcommand{\textfraction}{0.15}
\renewcommand{\topfraction}{0.85}
\renewcommand{\bottomfraction}{0.65}
\renewcommand{\floatpagefraction}{0.60}


% ---------------- 设置图表格式 ---------------

\renewcommand{\thetable}{\arabic{chapter}.\arabic{table}}
\renewcommand{\theequation}{\arabic{chapter}.\arabic{equation}}
\renewcommand{\thefigure}{\arabic{chapter}.\arabic{figure}}



% --------- 定制图形和表格标题的样式 --------------
\RequirePackage{caption}
\captionsetup{font={normalsize,singlespacing},labelformat={default},labelsep=quad}
\captionsetup[figure]{position=bottom,skip={5pt},name={图}}
\captionsetup[table]{position=top,skip={2pt},name={表}}
\setlength{\textfloatsep}{0pt}
\setlength{\floatsep}{10pt plus 3pt minus 2pt}
\setlength{\intextsep}{10pt}
\setlength{\abovecaptionskip}{2pt plus1pt minus1pt}
\setlength{\belowcaptionskip}{3pt plus1pt minus2pt}
%\setlength{\itemsep}{3pt plus1pt minus2pt}


% ----- 重新设置图表autoref -------
\newcommand{\figureautorefname}{图}
\newcommand{\tableautorefname}{表}


% --- 使用tabularx库并定义新的左右中格式 ----
\newcolumntype{L}{X}
\newcolumntype{C}{>{\centering \arraybackslash}X}
\newcolumntype{R}{>{\raggedright \arraybackslash}X}
\newcolumntype{P}[1]{>{\centering \arraybackslash}p{#1}}

% ------------ 设置三线表格式 ------
% \setlength{\heavyrulewidth}{1.5pt}
% \setlength{\lightrulewidth}{0.5pt}
% \setlength{\cmidrulewidth}{0.5pt}
% \setlength{\aboverulesep}{0pt}
% \setlength{\belowrulesep}{0pt}
% \setlength{\abovetopsep}{0pt}
% \setlength{\belowbottomsep}{0pt}


% -------- 重新定义图和表的浮动环境 ---------
\newenvironment{generalfig}[3][htbp]{
	\def \figcaption {#2}
	\def \figlabel {#3}
	\begin{figure}[#1]
		\centering
	}{
		\caption{\figcaption} \label{\figlabel}
	\end{figure}
}
\newenvironment{generaltab}[3][htbp]{
	\def \tabcaption {#2}
	\def \tablabel {#3}
	\begin{table}[#1]
		\caption{\tabcaption} \label{\tablabel}
		\zihao{5}
		\centering
	}{
	\end{table}
}


%------------- 数学定理设置 ---------------
\theoremstyle{plain} 
\newtheorem{definition}{定义}[chapter]
\newtheorem{proposition}{命题}[chapter]
\newtheorem{lemma}{引理}[chapter]
\newtheorem{theorem}{定理}[chapter]
\newtheorem{example}{例}[chapter]
\newtheorem{corollary}{推论}[chapter]
\newtheorem{remark}{注}[chapter]
\newtheorem{exercise}{练习}[chapter]
\newtheorem{assumption}{假设}[chapter]
\newtheorem{axiom}{公理}[chapter]
\newtheorem{property}{性质}[chapter]
\newtheorem{conjecture}{猜想}[chapter]
\renewcommand{\proofname}{证明}
%\renewcommand{\qedsymbol}{$\blacksquare$}


% -------------- 数学公式设置 ---------------
\allowdisplaybreaks[4]   % \eqnarray 如果很长，影响分栏、换行和分页

% ----- 设置公式间距为零 ------
\AtBeginDocument{
	\setlength{\abovedisplayskip}{4pt}
	\setlength{\belowdisplayskip}{4pt}
	\setlength{\abovedisplayshortskip}{2pt}
	\setlength{\belowdisplayshortskip}{2pt}
	\setlength{\arraycolsep}{2pt}   % array中列之间空白长度
}

% ------- 公式编号带章节 ----------
\numberwithin{equation}{chapter}

% 重新设置公式autoref
\newcommand{\equationautorefname}{等式}


% ---- 定义列表项的样式 -----
\RequirePackage{enumitem}
\setlist{nolistsep}
% \setitemize{itemsep=3pt}


%------------- 定义新的标题页面 -------------------

% ------ 添加几个新的文档属性 ------
\def \defsubtitle {}
\def \defcollege {}
\def \defbioinfo {}
\newcommand{\subtitle}[1]{\def \defsubtitle {#1}}
\newcommand{\college}[1]{\def \defcollege {#1}}
\newcommand\bioinfo[1]{\def \defbioinfo {#1}}


% ------- 重置命令 maketitle -------
\renewcommand{\maketitle}[1][15em]{
	\begin{titlepage}
	\pdfbookmark[0]{封~面}{cover}
		\begin{center}
			\vspace*{20mm}
			\rule{\textwidth}{2pt}\\%
			%{\fontsize{40}{40}\selectfont 硕~士~学~位~论~文}\\ %\bfseries
			\vspace{10mm}
			\begin{center}
			\parbox[t]{15cm}{\centering \fontsize{30pt}{30pt}\selectfont \heiti \@title}
			\end{center}
			\vspace{4mm}%
            \begin{center}
			\parbox[t]{15cm}{\centering \zihao{1} \heiti \defsubtitle}
			\end{center}
            \vspace{4mm}%
             \rule{\textwidth}{2pt}\\%
			\vspace{20mm}
    		{\zihao{-2}\textsl{\@author}}\\
    		\vspace{6mm}
    		%\vskip\stretch{1}%
    		{\zihao{-2}\textsl{\defcollege}}\\
    		\vspace{6mm}%
    		{\zihao{3}{\@date}} \\
    		\vspace{6mm}%
    		{\zihao{3}\textsl{\defbioinfo}} \\
    		\vspace{6mm}%

		\end{center}
	\end{titlepage}
	\cleardoublepage
}


% ------------------ 中文摘要环境 -------------
\newenvironment{cnabstract}[1]{
	\def \cnkeyword {#1}
	\clearpage
	\phantomsection
	\addcontentsline{toc}{chapter}{摘~~要}
	\chaptermark{摘~~要}
	\vspace*{-2ex}
	\begin{center} \heiti \chpzihao 摘~~~要 \end{center}
	\vspace*{3ex}
}{
	\vspace{-1ex}
	\paragraph{\heiti 关键词：} \cnkeyword
	\clearpage
}


% ----------------- 英文摘要环境 ----------------
\newenvironment{enabstract}[1]{
	\def \enkeyword {#1}
	\clearpage
	\phantomsection
	\addcontentsline{toc}{chapter}{\textbf{Abstract}}
	\chaptermark{Abstract}
	\vspace*{-3ex}
	\begin{center} \chpzihao \bfseries Abstract \end{center} 
	\vspace*{3ex}
}{
	\vspace{-1ex}
	\paragraph{\bfseries Key Words: } \enkeyword
	\clearpage
}


% ------------------ 前言环境 -------------
\newenvironment{preface}{
	\clearpage
	\phantomsection
	\addcontentsline{toc}{chapter}{前~~言}
	\chaptermark{前~~言}
	\vspace*{-1ex}
	\begin{center} \chpzihao \bfseries 前~~言 \end{center} 
	\vspace*{3ex}
	% \chapter*{前~~~言}
}{
	\cleardoublepage
}


% ------------- 定义新的目录页面 ----------------
\RequirePackage{tocloft}
\RequirePackage{hyperref}
\hypersetup{
	colorlinks = true,
	linkcolor  = black,
	citecolor = black
} % 去掉目录红框
\renewcommand{\cfttoctitlefont}{\hfill \heiti \chpzihao}
\renewcommand{\contentsname}{目~~录}
\renewcommand{\cftaftertoctitle}{\hfill}
\setlength{\cftbeforetoctitleskip}{1.5ex}
\setlength{\cftaftertoctitleskip}{5ex}
\renewcommand{\cftsecdotsep}{\cftdotsep}  % 设置Section引导点
% \renewcommand\cftbeforechapskip{2ex}
\renewcommand{\cftbeforesecskip}{0.5ex} % 设置Part字体
\renewcommand{\cftsecfont}{\songti}   % 设置Section字体

% 使用条件语句
\RequirePackage{xstring}

% 定义两个新语句
% 第一个语句更改fancyhdr样式
\newcommand{\plainfooterstyle}[1]{
	\IfStrEqCase{#1}{{nopagenum}{}
		{pagenum}{\footstyle}
		{pagenumtoc}{\footstyle}}
}
% 第二个语句在目录中添加目录标签
\newcommand{\addtoctotoc}[1]{
	\IfStrEqCase{#1}{{nopagenum}{}
		{pagenum}{}
		{pagenumtoc}{\phantomsection
			\addcontentsline{toc}{chapter}{目~~录}}}
}


% ----------- 设置新的生成目录命令 -------------
\let \oldtableofcontens \tableofcontents
\newcommand{\maketoc}[1][nopagenum]{
	% 修改hdr原plain格式
	\fancypagestyle{plain}{%
		\fancyhf{} %清空原有样式
		\headstyle
		\plainfooterstyle{#1}
	}
	% 设置目录hdr和页码选项
	\clearpage
	\pagestyle{plain}
	\addtoctotoc{#1}
	\tableofcontents
	\cleardoublepage
	\pagestyle{main}
}

% \let\oldappendix\appendix
% \renewcommand{\appendix}{%
%   \oldappendix
%   \addtocontents{toc} % Update \cftchappresnum within the .toc
%     {\protect\renewcommand{\protect\cftchappresnum}{Appendix }}
% }

% ----------- 重新定义参考文献页 -----------
%\bibliographystyle{plain}
\ctexset{bibname={参考文献}}

% 设置新的附录命令
\let \oldbibliography \bibliography
\renewcommand{\bibliography}[1]{
	% 添加到目录
	\clearpage
	\phantomsection
	\addcontentsline{toc}{chapter}{参考文献}
	\oldbibliography{#1}
}



% End of file `zhbook.cls'.
