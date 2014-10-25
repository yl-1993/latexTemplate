% !TEX encoding = System
%%
%% This is the configuration file of the template with LaTeX2e.
%%
%% Author: Yang Lei, School of software, Tsinghua University
%% Date: 2014/09/20
%% Version: 1.0
%% 
%% 
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{yltemplate}

%%排版引擎选项
\newif\ifTEMPLATE@dvips \TEMPLATE@dvipsfalse
\DeclareOption{dvips}{\TEMPLATE@dvipstrue}
\DeclareOption{dvipdfm}{\TEMPLATE@dvipsfalse}
\DeclareOption{pdftex}{\TEMPLATE@dvipsfalse}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessOptions
%%加载ctexbook文档类
\LoadClass[cs4size,a4paper,fancyhdr,fntef]{ctexbook}[2005/11/25]
%%定义页面参数
\RequirePackage[paperheight=27.000 true cm,paperwidth=19.500 true cm,
top=2.5 true cm,bottom=2.5 true cm,left=2.4 true cm,right=2.4 true cm,
headsep=10pt]
{geometry}
%%加载宏包
%% check pdfTeX mode
\RequirePackage{ifpdf,ifxetex}
%% math packages
\RequirePackage{amsmath,amsthm,amsfonts,amssymb,bm}
%% graphics packages
\RequirePackage{graphicx}
\RequirePackage{titletoc}
\RequirePackage{titlesec}
\RequirePackage{subfigure}
%% sort and compress citations
\RequirePackage[sort&compress,numbers]{natbib}
\RequirePackage{hypernat}  
%% caption packages
\RequirePackage{caption2}
%% enumitem package
\RequirePackage{enumitem}
\setenumerate[1]{itemsep=0pt,partopsep=0pt,parsep=\parskip,topsep=0pt}
\setitemize[1]{itemsep=0pt,partopsep=0pt,parsep=\parskip,topsep=0pt}
\setdescription{itemsep=0pt,partopsep=0pt,parsep=\parskip,topsep=0pt}
\RequirePackage{ccmap}
\RequirePackage{times}
%%以下为非必需宏包，可删减%%%
\RequirePackage{listings}
\RequirePackage{booktabs}
%%以上为非必需宏包，可删减%%%


%% packages and settings depend on PDF mode
\ifxetex
  \RequirePackage[xetex]{hyperref}
  \DeclareGraphicsExtensions{.pdf,.png,.jpg}
\else
  \ifpdf   % We're running pdfTeX in PDF mode
    \RequirePackage[pdftex]{hyperref}
    \DeclareGraphicsExtensions{.pdf,.png,.jpg}
  \else    % We're not running pdfTeX, or running pdfTeX in DVI mode
    \ifTEMPLATE@dvips
      \RequirePackage[dvips]{hyperref}
      \RequirePackage{psfrag}
      \AtBeginDvi{\special{pdf:tounicode GBK-EUC-UCS2}} % GBK -> Unicode
    \else
      \RequirePackage[dvipdfm]{hyperref}
    \fi
    \DeclareGraphicsExtensions{.eps,.ps}
  \fi
\fi
\hypersetup{CJKbookmarks,%
       bookmarksnumbered,%
              colorlinks,%
               linkcolor=blue,%
               citecolor=blue,%
              plainpages=false,%
            pdfstartview=FitH}

%%加载参数文件
\AtEndOfPackage{\makeatletter\input{yltemplate.cfg}\makeatother}
%%自定义命令
%%图表
\renewcommand{\captionlabeldelim}{} 
\renewcommand{\captionlabelsep}{\hspace{1em}} 
\renewcommand{\captionlabelfont}{\songti\zihao{-5}} 
\renewcommand{\captionfont}{\songti\zihao{-5}} 

\def\cleardoublepage{\clearpage\if@twoside \ifodd\c@page\else
  \thispagestyle{empty}%
  \hbox{}\newpage\if@twocolumn\hbox{}\newpage\fi\fi\fi}
\renewcommand{\floatpagefraction}{0.80}
%\bibliographystyle{plain}
\newcommand\TEMPLATEspace{\protect\CTEX@spaceChar\protect\CTEX@spaceChar}
\def\TEMPLATE@getfileinfo#1 #2 #3\relax#4\relax{%
  \def\TEMPLATEfiledate{#1}%
  \def\TEMPLATEfileversion{#2}%
  \def\TEMPLATEfileinfo{#3}}%
\expandafter\ifx\csname ver@yltemplate.cls\endcsname\relax
\else
  \edef\reserved@a{\csname ver@yltemplate.cls\endcsname}
\fi
\expandafter\TEMPLATE@getfileinfo\reserved@a\relax? ? \relax\relax
\def\TEMPLATE@underline[#1]#2{%
  \CTEXunderline{\hbox to #1{\hfill#2\hfill}}}
\def\TEMPLATEunderline{\@ifnextchar[\TEMPLATE@underline\CTEXunderline}
\newcommand\school[1]{\def\TEMPLATE@value@school{#1}}
\newcommand\degree[1]{\def\TEMPLATE@value@degree{#1}}
\renewcommand\title[2][\TEMPLATE@value@title]{%
  \def\TEMPLATE@value@title{#2}
  \def\TEMPLATE@value@titlemark{\MakeUppercase{#1}}}
\renewcommand\author[1]{\def\TEMPLATE@value@author{#1}}
\newcommand\advisor[1]{\def\TEMPLATE@value@advisor{#1}}
\newcommand\authoremail[1]{\def\TEMPLATE@value@authoremail{#1}}
\newcommand\advisorinstitute[1]{\def\TEMPLATE@value@advisorinstitute{#1}}
\newcommand\major[1]{\def\TEMPLATE@value@major{#1}}
\newcommand\submitdatechs[1]{\def\TEMPLATE@value@submitdatechs{#1}}
\newcommand\submitdate[1]{\def\TEMPLATE@value@submitdate{#1}}
\newcommand\defenddate[1]{\def\TEMPLATE@value@defenddate{#1}}
\newcommand\institute[1]{\def\TEMPLATE@value@institute{#1}}
\newcommand\chairman[1]{\def\TEMPLATE@value@chairman{#1}}
%%自定义参考文献上标引用
\newcommand{\ucite}[1]{\textsuperscript{\textsuperscript{\cite{#1}}}}  % 方法2
%%自定义frontmatter格式
\newif\if@frontmatter\@frontmattertrue
\renewcommand\frontmatter{%
\cleardoublepage
\@frontmattertrue
\@mainmatterfalse
\setcounter{page}{1}
\pagenumbering{Roman}
\pagestyle{plain}{}
\fancyhf{}%
\renewcommand{\headrulewidth}{0pt}
}
%%自定义mainmatter格式
\renewcommand\mainmatter{%
\cleardoublepage
\@frontmatterfalse
\@mainmattertrue
\setcounter{page}{1}
\pagenumbering{arabic}
\fancypagestyle{plain}{%
  \fancyhf{}%
  \fancyhead[LO,RE]{\songti\zihao{-5} \TEMPLATE@value@submitdate}
  \fancyhead[CO]{\songti\zihao{-5} \TEMPLATE@value@school:\TEMPLATE@label@coursename}
  \fancyhead[CE]{\songti\zihao{-5} \TEMPLATE@value@author :~~ \TEMPLATE@value@titlemark}
  \fancyhead[LE,RO]{\songti\zihao{-5} ~\thepage~}
}
\pagestyle{fancy}
  \fancyhf{}
  \fancyhead[LO,RE]{\songti\zihao{-5} \TEMPLATE@value@submitdate}
  \fancyhead[CO]{\songti\zihao{-5} \TEMPLATE@value@school:\TEMPLATE@label@coursename}
  \fancyhead[CE]{\songti\zihao{-5} \TEMPLATE@value@author :~~ \TEMPLATE@value@titlemark}
  \fancyhead[LE,RO]{\songti\zihao{-5} ~\thepage~}
%%正文页眉双线
\newcommand{\makeheadrule}{%
\makebox[0pt][l]{\rule[0.55\baselineskip]{\headwidth}{0.4pt}}%
\rule[0.7\baselineskip]{\headwidth}{0.4pt}}
\renewcommand{\headrule}{%
{\if@fancyplain\let\headrulewidth\plainheadrulewidth\fi
\makeheadrule}}
\makeatother%
}
%%设置目录格式  
\setcounter{tocdepth}{3} \setcounter{secnumdepth}{3}
\dottedcontents{chapter}[3.5em]{\songti\zihao{5}}{4em}{0.5pc}
\dottedcontents{section}[5.5em]{\songti\zihao{5}}{3em}{0.5pc}
\dottedcontents{subsection}[6.1em]{\songti\zihao{5}}{1.7em}{0.5pc}  
%%定义章节标题格式
\renewcommand\chaptername{第\CJKnumber{\value{chapter}}章}
\renewcommand{\thesection}{\S~\arabic{chapter}.\arabic{section}}
\renewcommand{\thesubsection}{\hspace{-3ex}\arabic{chapter}.\arabic{section}.\arabic{subsection}}
\renewcommand{\thesubsubsection}{\arabic{subsubsection}.}

%%定义封面信息
\renewcommand\maketitle{%
  \cleardoublepage
  \thispagestyle{empty}
  \begin{center}
    \songti\zihao{3}
      %\TEMPLATE@label@schoolnumber~\TEMPLATE@value@schoolnumber
        \hfill
      %\TEMPLATE@label@studentnumber~\TEMPLATE@value@studentnumber
    \vskip \stretch{1.8}
      %\heiti\zihao{2} \TEMPLATE@value@school \\
    \vskip \stretch{0.9}
      \heiti\zihao{1} ~\TEMPLATE@value@title~
    \vskip \stretch{1}
    \songti\zihao{3}
    \def\tabcolsep{1pt}
    \def\arraystretch{1.0}
    \begin{tabular}{ccc}
       \,\,\,\,\,\,\, &\TEMPLATE@value@author &\,\,\,\,\,\,\,\,\,\,\,
	\\
	\,\,\,\,\,\,\, & \TEMPLATE@value@authoremail  &
	\\
	\,\,\,\,\,\,\, & \TEMPLATE@value@submitdate  &
      %%\TEMPLATE@value@advisor & ~\TEMPLATE@value@advisoremail &
    \end{tabular}
	\vskip \stretch{2.9}
	\songti\zihao{5}
	\vskip \stretch{0.6}
	\songti\zihao{3}
	\vspace{1em}	
  \end{center}
}



%%摘要  
\newenvironment{abstract}
  {%
  \cleardoublepage
  % \thispagestyle{empty}
  \begin{center}
  \heiti\zihao{3}\TEMPLATE@value@title \\
  \vspace{1em}
  \songti\zihao{4}\TEMPLATE@label@abstract
  \end{center}
  \hspace{1.3em}
  \songti\zihao{5}
  }{}
%%中文关键词  
\newcommand\keywords[1]{%
  \vspace{2ex}\noindent{\heiti\zihao{5} \TEMPLATE@label@keywords} \heiti\zihao{5}#1}
  

%%
%% End of file `yltemplate.cls'.
