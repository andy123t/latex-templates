%%
%%  This is file `homework.cls',
%%
%%  @author andy123t
%%  @date 2024/04/12
%%  @version v1.2
%%

%----- Identification -----%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{homework}[2024/04/12]

%----- New Options -----%
\newif\ifhw@en
\DeclareOption{en}{\hw@entrue}
\DeclareOption{cn}{\hw@enfalse}
\DeclareOption{twoside}{\OptionNotUsed}
\DeclareOption{twocolumn}{\OptionNotUsed}
%\DeclareOption{oneside}{\PassOptionsToClass{oneside}{article}}
\DeclareOption{a4paper}{\PassOptionsToClass{a4paper}{article}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ExecuteOptions{en,a4paper}
\ProcessOptions\relax

%----- Load Class -----%
\LoadClass{article}
%\RequirePackage[UTF8,zihao=-4,heading=true]{ctex}

%----- package for geometry -----%
\RequirePackage{geometry}
\geometry{left=3.0cm,right=3.0cm,top=3.2cm,bottom=2.8cm}

%----- package for different compilation modes -----%
\RequirePackage{ifpdf,ifxetex}
\ifxetex
    \RequirePackage[UTF8,heading=true]{ctex}
    \RequirePackage{fontspec}
\else
    \ifpdf
    \usepackage[utf8]{inputenc}
    \RequirePackage[T1]{fontenc}
    \else
    \RequirePackage[dvipdfmx]{graphicx}
    \RequirePackage{bmpsize}
    \fi
\fi

%----- packages -----%
\RequirePackage{amsmath,amssymb,amsthm}
\RequirePackage{booktabs}
\RequirePackage{graphicx}
\RequirePackage{float}
\RequirePackage{longtable}
\RequirePackage{multirow}
\RequirePackage{enumitem}
\RequirePackage{graphicx}
\RequirePackage{color,xcolor}
\RequirePackage{tikz}
\RequirePackage{tabularx}
\RequirePackage{makecell}
\RequirePackage{caption}
\RequirePackage{anyfontsize}

%----- hardcode some language options -----%
\ifhw@en
    \RequirePackage[english]{babel}
    \newcommand{\problemname}{Problem}
    \newcommand{\solutionname}{Solution}
    \renewcommand{\proofname}{Proof}
    \newcommand{\punctname}{.}
    \newcommand{\themname}{Theorem}
    \newcommand{\lmmname}{Lemma}
    \newcommand{\defnname}{Definition}
    \newcommand{\propname}{Proposition}
    \newcommand{\corname}{Corollary}
    \newcommand{\remname}{Remark}
    \newcommand{\exaname}{Example}
    \else
    \newcommand{\problemname}{问题}
    \newcommand{\solutionname}{解}
    \renewcommand{\proofname}{证明}
    \newcommand{\punctname}{\,:\,}
    \newcommand{\themname}{定理}
    \newcommand{\lmmname}{引理}
    \newcommand{\defnname}{定义}
    \newcommand{\propname}{命题}
    \newcommand{\corname}{推论}
    \newcommand{\remname}{注}
    \newcommand{\exaname}{例}
\fi

%----- preliminary declarations -----%
% define the macro for information of the course
\newcommand{\courseinfo}[1]{\def\@courseinfo{#1}}
% define the macro for the name of the institution
\newcommand{\institute}[1]{\def\@institute{#1}}
% define the macro for information of the student
\newcommand{\studentinfo}[1]{\def\@studentinfo{#1} }

% define the macro for the header
\newcommand{\header}[1]{\def\@header{#1}}
% define the macro for the footer
%\newcommand{\footer}[1]{\def\@footer{#1}}

%----- graphics path -----%
\graphicspath{{./figure/}{./figures/}{./image/}{./images/}}

%----- modify sections, subsections and sub subsections -----%
\RequirePackage{titlesec}
\titleformat*{\section}{\large\bfseries}
\titleformat*{\subsection}{\normalsize\bfseries}
\titleformat*{\subsubsection}{\normalsize\bfseries}

%----- package for header and footer -----%
\RequirePackage{fancyhdr}
\fancyhead{}
\fancyfoot{}
\pagestyle{fancy}
\renewcommand{\headrulewidth}{0.4pt}
\renewcommand{\footrulewidth}{0pt}
\fancyhead[C]{\footnotesize{\ifx\@header\undefined{}\makeatletter\@title\makeatother\else\@header\fi}}
\fancyfoot[C]{\footnotesize\thepage}

%\setlength{\headheight}{15pt}
\setlength{\headsep}{18pt}

%----- new title page -----%
\renewcommand{\maketitle}{%
    \thispagestyle{plain}
    \begin{center}
        \ifx\@institute\undefined{}\else{\@institute} \\[10pt] \fi
        \hrule
        \vspace{15pt}
        {\LARGE \bfseries \@title} \\[10pt]
        \ifx\@courseinfo\undefined{}\else{\large\@courseinfo{}}\\[6pt]\fi
        \ifx\@studentinfo\undefined{}\else\@studentinfo{}\\[6pt]\fi
        \vspace{4pt}
        \hrule
        \vspace{12pt}
        {\@date}
        \vspace{15pt}
    \end{center}
}

%----- definition of problem environment -----%
\newcounter{problemname}
\newenvironment{problem}{%
    \stepcounter{problemname}%
    \par\noindent%
    \textbf{\problemname~\arabic{problemname}.}\enspace\ignorespaces%
}{
    \par
    %\medskip
}
\newenvironment{problem*}{%
    \par\noindent%
    \textbf{\problemname\,:}\enspace\ignorespaces%
}{
    \par
    %\medskip
}

%----- definition of hframe environment -----%
\RequirePackage[framemethod=TikZ]{mdframed}
\mdfdefinestyle{hframed}{%
    linecolor=black!68,backgroundcolor=gray!5,
    outerlinewidth=0.6pt,roundcorner=3pt,
    innertopmargin=0.5\baselineskip,
    innerrightmargin=8pt,innerleftmargin=8pt,
    innerbottommargin=0.5\baselineskip,
}

\newenvironment{hframe}{
\begin{mdframed}[%
    linecolor=black!68,backgroundcolor=gray!5,
    outerlinewidth=0.6pt,roundcorner=3pt,
    innertopmargin=0.5\baselineskip,
    innerbottommargin=0.5\baselineskip,
    innerrightmargin=8pt,innerleftmargin=8pt]%
}{
\end{mdframed}
}

%----- formula spacing -----%
\AtBeginDocument{
    \setlength{\abovedisplayskip}{5pt plus 2pt minus 2pt}
    \setlength{\belowdisplayskip}{5pt plus 2pt minus 2pt}
    \setlength{\abovedisplayshortskip}{3pt plus 1pt minus 1pt}
    \setlength{\belowdisplayshortskip}{3pt plus 1pt minus 1pt}
}

%----- column type of tabularx -----%
\newcolumntype{L}{X}
\newcolumntype{C}{>{\centering \arraybackslash}X}
\newcolumntype{R}{>{\raggedleft \arraybackslash}X}
\newcolumntype{P}[1]{>{\centering \arraybackslash}p{#1}}

%----- set up caption -----%
\captionsetup{font={normalsize,singlespacing},labelformat={default},labelsep=quad}
\captionsetup[figure]{position=bottom,skip={5pt}}
\captionsetup[table]{position=top,skip={2pt}}
\setlength{\textfloatsep}{0pt}
\setlength{\floatsep}{10pt plus 3pt minus 2pt}
\setlength{\intextsep}{10pt}
\setlength{\abovecaptionskip}{2pt plus1pt minus1pt}
\setlength{\belowcaptionskip}{3pt plus1pt minus2pt}

%----- definition of theorem environment -----%
\theoremstyle{plain}
\newtheorem{definition}{\defnname}
\newtheorem{proposition}{\propname}
\newtheorem{lemma}{\lmmname}
\newtheorem{theorem}{\themname}
\newtheorem{example}{\exaname}
\newtheorem{corollary}{\corname}
\newtheorem{remark}{\remname}
%\renewcommand{\qedsymbol}{$\blacksquare$}
\renewenvironment{proof}[1][\proofname]{\par
    \pushQED{\qed}%
    \normalfont \topsep6\p@\@plus6\p@\relax
    \trivlist\item[\hskip\labelsep
    \bfseries #1\@addpunct{\punctname}]\ignorespaces
}{
    \popQED\endtrivlist\@endpefalse
}
\newenvironment{solution}{
\renewcommand\qedsymbol{}\begin{proof}[{\solutionname}]
}{\end{proof}
}

%----- code highlighting -----%
\RequirePackage{listings}

% matlab highlight color settings
%\definecolor{mBasic}{RGB}{248,248,242}
\definecolor{mKeyword}{RGB}{0,0,255}
\definecolor{mString}{RGB}{160,32,240}
\definecolor{mComment}{RGB}{34,139,34}
\definecolor{mNumber}{RGB}{96,96,96}
\definecolor{mBackground}{RGB}{255,255,255}
\definecolor{mRule}{RGB}{96,96,96}

% python highlight color settings
%\definecolor{pBasic}{RGB}{248,248,242}
\definecolor{pKeyword}{RGB}{228,0,128}
\definecolor{pString}{RGB}{148,0,209}
\definecolor{pComment}{RGB}{117,113,94}
\definecolor{pIdentifier}{RGB}{166,226,46}
\definecolor{pNumber}{RGB}{96,96,96}
\definecolor{pBackground}{RGB}{255,255,255}
\definecolor{pRule}{RGB}{96,96,96}

%----- matlab highlight style -----%
\lstdefinestyle{matlab}
{
    language=matlab,
    xleftmargin=23pt,
    xrightmargin=5pt,
    frame=tlbr,framesep=4pt,framerule=0.5pt,
    framexleftmargin=17pt,
    %frame=shadowbox,rulesepcolor=\color{red!20!green!20!blue!20},
    basicstyle=\footnotesize\ttfamily,
    %basicstyle=\footnotesize\fontspec{Consolas},
    keywordstyle={\color{mKeyword}},
    stringstyle={\color{mString}},
    commentstyle={\color{mComment}},
    backgroundcolor=\color{mBackground},
    rulecolor=\color{mRule},
    keywords={
        break,case,catch,classdef,continue,else,
        elseif,end,for,function,global,if,otherwise,parfor,
        persistent,return,spmd,switch,try,while
    },
    showspaces=false,
    showstringspaces=false,
    showtabs=false,
    tabsize=4,
    captionpos=t,
    breaklines=true,
    numberstyle=\scriptsize\color{mNumber},
    %numbersep=9pt,
    numbers=left,
    stepnumber=1,
}

%----- python highlight style -----%
\lstdefinestyle{python}{
    language=python,
    xleftmargin=23pt,
    xrightmargin=5pt,
    frame=tlbr,framesep=4pt,framerule=0.5pt,
    framexleftmargin=18pt,
    %frame=shadowbox,rulesepcolor=\color{red!20!green!20!blue!20},
    basicstyle=\footnotesize\ttfamily,
    %basicstyle=\footnotesize\fontspec{Consolas},
    keywordstyle=\color{pKeyword},
    stringstyle=\color{pString},
    commentstyle=\color{pComment},
    backgroundcolor=\color{pBackground},
    rulecolor=\color{pRule},
    emph={format_string,eff_ana_bf,permute,eff_ana_btr},
    emphstyle=\color{pIdentifier}
    showspaces=false,
    showstringspaces=false,
    showtabs=false,
    tabsize=4,
    captionpos=t,
    breaklines=true,
    numberstyle=\scriptsize\color{pNumber},
    %numbersep=9pt,
    numbers=left,
    stepnumber=1,
}

%----- end input -----%
\endinput

% End of file `howework.cls'.
