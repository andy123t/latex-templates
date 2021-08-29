%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Felipe Portales' HomeWorks
% Maintainer: Felipe Portales-Oliva (f.portales.oliva@gmail.com)
%
% Document class to produce simple yet stylish homework submissions
%
% This package is public domain, according to :
%    The Unlicense <https://unlicense.org>
%
% Modfied based on fphw
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% Identification

\NeedsTeXFormat{LaTeX2e} % we need to have LaTeX2e for this to compile
\ProvidesClass{homework}[2020/04/12] % homework is the name we need to provide to
                                  % the documentclass command on the .tex file

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% % Enhanced datetime
% % compile with XeLatex

\RequirePackage{datetime} %datetime
\renewcommand{\today}{ \number\year 年 \number\month 月 \number\day 日}

%%% Preliminary declarations:
%%%% These are some commands where we declare new commands for the class

% We define the macro for the name of the professor
\newcommand{\professor}[1]{ \newcommand{\professorloc}{#1} }
% We define the macro for the name of the course
\newcommand{\class}[1]{ \newcommand{\classlocal}{#1} }
% We define the macro for the name of the institution
\newcommand{\institute}[1]{ \newcommand{\instituteloc}{#1} }
% We define the macro for the ID of you
\newcommand{\IDnumber}[1]{ \newcommand{\IDnumberloc}{#1} }
% We define the macro for the Major of you
\newcommand{\Major}[1]{ \newcommand{\Majorloc}{#1} }

%these are auxiliary definitions used in the title section
\newcommand{\CourseLang}{Course}
\newcommand{\DateLang}{Due Date}
\newcommand{\StudentLang}{Student name}
\newcommand{\ProfessorLang}{Professor}
\newcommand{\IDnumberLang}{ID}
\newcommand{\MajorLang}{Major}

% Header and footers, we will use the titles also
\RequirePackage{fancyhdr}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% Options
%%%% We now pass the options of the class

% Two Columns are difficult to read and grade, we will not use them
\DeclareOption{twocolumn}{\OptionNotUsed}

% Two sided paper are difficult to read and grade, we will not use them
\DeclareOption{twoside}{\OptionNotUsed}


% we hardcode some language options
\DeclareOption{en}{
    \renewcommand{\CourseLang}{Course}
    \renewcommand{\ProfessorLang}{Professor}
    \renewcommand{\DateLang}{Date}
    \renewcommand{\StudentLang}{Name}
    \renewcommand{\IDnumberLang}{Student ID}
    \renewcommand{\MajorLang}{Major}
}

% Chinese options
\DeclareOption{cn}{
    \renewcommand{\CourseLang}{课程}
    \renewcommand{\ProfessorLang}{教授}
    \renewcommand{\DateLang}{日期}
    \renewcommand{\StudentLang}{姓名}
    \renewcommand{\IDnumberLang}{学号}
    \renewcommand{\MajorLang}{专业}
}


\PassOptionsToClass{a4paper}{article}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}

\ProcessOptions\relax

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% Bulk Declarations
%%%% Here we do more declarations and call other files


% we need to load
\LoadClass{article}


\RequirePackage[cs4size,UTF8,heading=true]{ctex}

\RequirePackage{amsmath,amssymb,amsthm,amsfonts}
\RequirePackage{booktabs}
\RequirePackage{graphicx}
\RequirePackage{ifpdf,ifxetex}
\ifxetex
  \RequirePackage{fontspec}
\else
  \ifpdf
  	\usepackage[utf8]{inputenc}
  	\RequirePackage[T1]{fontenc}
    \RequirePackage{epstopdf}
  \else
    \RequirePackage[dvipdfmx]{graphicx}
    \RequirePackage{bmpsize}
  \fi
\fi

\RequirePackage{float}
\RequirePackage{cite}
\RequirePackage{longtable}
\RequirePackage{multirow}
\RequirePackage{enumerate}
\usepackage{graphicx} % Required for including images
\RequirePackage{color,xcolor}
\RequirePackage{fancyhdr}
\RequirePackage{tikz}
\RequirePackage{tabularx}
\RequirePackage{makecell}
\RequirePackage{caption}
%\RequirePackage[english]{babel}

\graphicspath{{./figure/}{./figures/}{./image/}{./images/}}

% we will modify sections, subsections and sub subsections
\RequirePackage{titlesec}
% Modification of section
%\titleformat{\section}[block]{\normalsize\bfseries}{\thesection.}{.3cm}{}

% modification of subsection and sub sub section
%\titleformat{\subsection}[runin]{\bfseries}{ \thesubsection.}
%{1mm}{}[:\quad]
%\titleformat{\subsubsection}[runin]{\bfseries}{ \thesubsubsection.}
%{1mm}{}[:\quad]

\titleformat*{\section}{\large\bfseries}
\titleformat*{\subsection}{\normalsize\bfseries}
\titleformat*{\subsubsection}{\normalsize\bfseries}


% Geometry lets us modify the sizes of the document nicely
\RequirePackage{geometry}
% Decent margins for the documents, as it is meant to be printed
\geometry{left=2.5cm,right=2.5cm,top=2.5cm,bottom=2.5cm}

\fancyhead{}
\fancyfoot{}
\pagestyle{fancy}
\renewcommand{\headrulewidth}{0.4pt} % we want rules
\renewcommand{\footrulewidth}{0.4pt}
\fancyhead[RO] {\footnotesize\thepage}
\fancyhead[LO] {\footnotesize{\ifx\classlocal\undefined{}\else\itshape\classlocal{} --{} \fi}\makeatletter\@title\makeatother }
\fancyfoot[RO] {\footnotesize\itshape\makeatletter\@author\makeatother}

% New title style for the document
\renewcommand{\maketitle}{%
    \thispagestyle{plain}
    \begin{center}
        \ifx\instituteloc\undefined{}\else{\scshape \instituteloc} \\[10pt] \fi
        \hrule
        \vspace{10pt}
        {\LARGE \bfseries \@title} \\[5pt]
        \StudentLang: {\itshape\@author}
        \ifx\Majorloc\undefined{}\else \quad \MajorLang: {\itshape\Majorloc{}}\fi
        \ifx\IDnumberloc\undefined{}\else \quad \IDnumberLang: {\IDnumberloc{}}\fi
        \vspace{8pt}
        \hrule
        \vspace{10pt}
        \ifx\classlocal\undefined{}\else\CourseLang: {\classlocal{} \ifx\professorloc\undefined{}\else{\quad}\fi  }\fi
        \ifx\professorloc\undefined{}\else{\ProfessorLang: {\professorloc}}\fi
        \ifx\classlocal\undefined{}\else{\quad}\fi
        \DateLang: {\@date}
        \vspace{15pt}
    \end{center}
}

% definition of the "problem" environment
% \usepackage[most]{tcolorbox}

% \newsavebox{\problembox}
% \newenvironment{problem}
%     {\begin{center} \begin{minipage}{.98\textwidth}\begin{tcolorbox}[enhanced]}
%     {\end{tcolorbox}\end{minipage} \end{center} }


\newcounter{problemname}
\newenvironment{problem}{
    \stepcounter{problemname}
    \par\noindent
    \textbf{问题\arabic{problemname}. 
}}{
\par %\medskip
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\captionsetup{font={normalsize,singlespacing},labelformat={default},labelsep=quad}
\captionsetup[figure]{position=bottom,skip={5pt},name={图}}
\captionsetup[table]{position=top,skip={2pt},name={表}}
\setlength{\textfloatsep}{0pt}
\setlength{\floatsep}{10pt plus 3pt minus 2pt}
\setlength{\intextsep}{10pt}
\setlength{\abovecaptionskip}{2pt plus1pt minus1pt}
\setlength{\belowcaptionskip}{3pt plus1pt minus2pt}



% definition of the "theorem" environment
\theoremstyle{plain} 
\newtheorem{definition}{\heiti 定义}[section]
\newtheorem{proposition}{\heiti 命题}[section]
\newtheorem{lemma}{\heiti 引理}[section]
\newtheorem{theorem}{\heiti 定理}[section]
\newtheorem{example}{\heiti 例子}[section]
\newtheorem{corollary}{\heiti 推论}[section]
\newtheorem{remark}{\heiti 注}[section]
\renewcommand{\proofname}{\heiti 证明}
%\renewcommand{\qedsymbol}{$\blacksquare$}
\newenvironment{solution}
  {\renewcommand\qedsymbol{}\begin{proof}[{\heiti 解}]} %$\blacksquare$
  {\end{proof}}

\RequirePackage{listings}

%\definecolor{mBasic}{RGB}{248,248,242}       % default
\definecolor{mKeyword}{RGB}{0,0,255}          % bule
\definecolor{mString}{RGB}{160,32,240}        % purple
\definecolor{mComment}{RGB}{34,139,34}        % green
\definecolor{mBackground}{RGB}{245,245,245}   % lightgrey
\definecolor{mNumber}{RGB}{128,128,128}       % gray

\lstset{language=Matlab,               % choose the language of the code
  xleftmargin=10pt,
  xrightmargin=10pt,
  frame=tlbr,framesep=6pt,framerule=0.4pt,  % sets the frame style
  %frame=shadowbox,rulesepcolor=\color{red!20!green!20!blue!20},
  basicstyle=\small\ttfamily,
  keywordstyle={\color{mKeyword}},     % sets color for keywords
  stringstyle={\color{mString}},       % sets color for strings
  commentstyle={\color{mComment}},     % sets color for comments
  rulecolor=\color{gray!80},
  backgroundcolor=\color{gray!5}, % choose the background color
  title=\lstname,                      % show the filename of files included with \lstinputlisting;
  keywords={break,case,catch,classdef,continue,else,elseif,end,for,
  function,global,if,otherwise,parfor,persistent,return,spmd,switch,try,while},
  showspaces=false,                    % show spaces adding particular underscores
  showstringspaces=false,              % underline spaces within strings
  showtabs=false,                      % show tabs within strings adding particular underscores
  tabsize=4,                           % sets default tabsize to 2 spaces
  captionpos=t,                        % sets the caption-position to bottom
  breaklines=true,                     % sets automatic line breaking
  %numberstyle=\tiny\color{mNumber},
%  numbers=left,                        % where to put the line-numbers
%  stepnumber=1,                        % the step between two line-numbers.
%  %numbersep=5pt,                      % how far the line-numbers are from the code
}



%%% We finish the class with this command
\endinput


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%\titleformat*{\section}{\Large\bfseries}
%\titleformat*{\subsection}{\normalsize\bfseries}
%\titleformat*{\subsubsection}{\normalsize\bfseries}