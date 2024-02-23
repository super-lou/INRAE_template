\LoadClass{article}


%% PACKAGE ___________________________________________________________
\RequirePackage{etoolbox,xpatch}
\RequirePackage{ifxetex,ifluatex}
\RequirePackage{setspace}
\RequirePackage[table]{xcolor}
\RequirePackage{graphicx}
\RequirePackage{geometry}
\RequirePackage{rotating}
\RequirePackage{titlesec}
\RequirePackage{fancyhdr}
\RequirePackage[style]{abstract}
\RequirePackage[marginal]{footmisc}
\RequirePackage{caption}
\RequirePackage{enumitem}
\RequirePackage{authblk}
\RequirePackage{textcomp}
\RequirePackage[absolute]{textpos}
\RequirePackage[right]{lineno}
\RequirePackage{amsmath}

\RequirePackage[
    natbib=true,
    url=false,
    eprint=false,
    style=authoryear,
    maxcitenames=2,
    %maxbibnames=5,
    giveninits=true,
    uniquename=init,
    backend=bibtex
]{biblatex}



%% COMPILATEUR _______________________________________________________
\RequirePackage{microtype}
\newif\ifxetexorluatex
\ifxetex
  \xetexorluatextrue
\else
  \ifluatex
    \xetexorluatextrue
  \else
    \xetexorluatexfalse
  \fi
\fi

\ifxetexorluatex
  \RequirePackage[no-math]{fontspec}
  \let\boldsymbol\symbf
% Patch microtype for older versions; from https://tex.stackexchange.com/a/373607/226
  \@ifpackagelater{microtype}{2017/07/05}{}{%
    \patchcmd{\MT@is@composite}
      {\expandafter\expandafter\expandafter}
      {\ifx\UnicodeEncodingName\@undefined\else
      \expandafter\expandafter\expandafter\MT@is@uni@comp\MT@char\iffontchar\else\fi\relax
    \fi\expandafter\expandafter\expandafter}
      {}{}
    \def\MT@is@uni@comp#1\iffontchar#2\else#3\fi\relax{%
      \ifx\\#2\\\else\edef\MT@char{\iffontchar#2\fi}\fi
    }
  }
\else
  \RequirePackage[utf8]{inputenc}
  \RequirePackage[T1]{fontenc}
\fi
\RequirePackage[default]{sourcesanspro}
\RequirePackage[nosymbolsc,slantedGreek]{newtxsf}


%% DIMENSIONS ________________________________________________________
\setstretch{1.15}
\RequirePackage{geometry}
\geometry{paperwidth=21cm, paperheight=29.7cm,
  left=3cm, right=3cm,
  top=1.75cm, bottom=3.6cm,
  footskip=0.9cm,
  footnotesep=\baselineskip, headheight=21\p@, headsep=\baselineskip}


%% COLOR _____________________________________________________________
\definecolor{Text}{RGB}{35, 31, 32}
\definecolor{LightCyan}{RGB}{102, 193, 191}
\definecolor{Cyan}{RGB}{0, 163, 166}
\definecolor{DarkCyan}{RGB}{39, 86, 98}
\definecolor{DarkGrey}{RGB}{121, 120, 112}
\definecolor{Grey}{RGB}{200, 200, 200}
\definecolor{LightGrey}{RGB}{246, 246, 246}
\definecolor{Green}{RGB}{157, 197, 68}
\definecolor{LightBlue}{RGB}{158, 214, 227}
\definecolor{Blue}{RGB}{66, 48, 137}
\definecolor{Red}{RGB}{237, 110, 108}
\definecolor{cb.Blue}{HTML}{0f3b57}
\definecolor{cb.Brown}{HTML}{7e392f}

\color{Text}


%% FONT ______________________________________________________________
\usepackage{fontspec}
\setmainfont[
  Path=font/Avenir Next Pro Complete Family Pack/,
  UprightFont=*-Regular,
  BoldFont=*-Bold,
  ItalicFont=*-It,
  Extension=.otf
  ]{Linotype - AvenirNextLTPro}

\setsansfont[
  Path=font/Raleway/,
  UprightFont=*-Regular,
  BoldFont=*-ExtraBold,
  ItalicFont=*-Italic,
  Extension=.ttf
  ]{Raleway}

\newfontfamily\ralewayblack[
  Path=font/Raleway/,
  UprightFont=*-Black,
  Extension=.ttf
]{Raleway}
\DeclareTextFontCommand{\textblack}{\ralewayblack}

\renewcommand{\Huge}{\fontsize{30}{36}\selectfont}


%% ABSTRACT __________________________________________________________
\renewcommand{\abstractname}{
    {\textcolor{Cyan}{\rule{0.4cm}{1.2\p@}}} \hspace{0.1cm}
        {\LARGE\bfseries\color{Cyan}\sffamily Résumé \hspace{0.1cm}}
    {\textcolor{Cyan}{\rule{11.8cm}{1.2\p@}}}\par\vspace{0.1cm}}
\setlength{\absleftindent}{\z@}
\setlength{\absrightindent}{\absleftindent}
\preto{\abstract}{%
  \setlength{\parindent}{\z@}%
  \newcommand{\keywords}[1]{%
  \emph{\footnotesize\@keywordsname : }\footnotesize#1\par
  }
}
\appto{\abstract}{%
  \setlength{\parindent}{\z@}%
  \setlength{\parskip}{1em}%
  \vskip-\parskip%
  \noindent\ignorespaces%
}


%% TOC _______________________________________________________________
\usepackage{tocloft}
\addtocontents{toc}{\protect\thispagestyle{fancy}}
\renewcommand{\contentsname}{
  {\textcolor{Cyan}{\rule{0.4cm}{1.2\p@}}} \hspace{0.1cm}
  {\LARGE\bfseries\color{Cyan}\sffamily Table des matières \hspace{0.1cm}}
  {\textcolor{Cyan}{\rule{8.4cm}{1.2\p@}}}\par\vspace{0.2cm}}

\setlength{\cftbeforesecskip}{3mm}
\setlength{\cftsecnumwidth}{0.7cm}
\renewcommand{\cftsecfont}{\bfseries\Large\sffamily}
\renewcommand\cftsecpagefont{\normalfont\Large\sffamily}

\setlength{\cftbeforesubsecskip}{0.7mm}
\setlength{\cftsubsecnumwidth}{1cm}
\renewcommand{\cftsubsecfont}{\bfseries\large\sffamily}
\renewcommand\cftsubsecpagefont{\normalfont\large\sffamily}

% \setlength{\cftsubsubsecnumwidth}{0.1cm}
% \renewcommand{\cftsubsubsecfont}{\normalfont\normalsize\sffamily}
% \renewcommand\cftsubsubsecpagefont{\normalfont\Large\sffamily}

% \renewcommand\cftsecafterpnum{\vspace{0.1cm}}

\renewcommand{\cftdot}{}


%% CHAPTER ___________________________________________________________
\newcounter{chapter}
\newif\iffirstchapter
\firstchaptertrue

\newcommand{\chapter}[1]{%
    \clearpage
    \stepcounter{chapter}
    \setcounter{section}{0}
    \setcounter{subsection}{0}
    \iffirstchapter
        \firstchapterfalse
    \else
        \addtocontents{toc}{\protect\vspace{0.5cm}}
    \fi
    \null
    \thispagestyle{empty}
    \vspace*{\fill}
    {\noindent{\Huge\bfseries\sffamily\color{LightCyan} \textblack{Chapitre \thechapter}}\\[0.5cm]
      \noindent{\huge\sffamily \textit{#1}}}
    \vfill
    \newpage
    \addcontentsline{toc}{section}{#1}%
  }

  
\newcommand{\bibchapter}[1]{%
    \clearpage
    \null
    \thispagestyle{empty}
    \vspace*{\fill}
    {\Huge\bfseries\sffamily\color{LightCyan} #1\par} % Centered title
    \vfill
    \newpage
    \addtocontents{toc}{\vspace{0.5cm}}
    \addcontentsline{toc}{section}{#1}
}


%% SECTION ___________________________________________________________
\titleformat{\section}{\huge\bfseries\color{LightCyan}\sffamily}{\hspace*{-1em}\makebox[\z@][r]{\thesection}}{1em}{\sffamily\huge\color{LightCyan}}

\titleformat{\subsection}{\Large\bfseries\color{LightCyan}\sffamily}{\hspace*{-1em}\makebox[\z@][r]{\thesubsection}}{1em}{\sffamily\Large\color{LightCyan}}

\titleformat{\subsubsection}{\normalsize\bfseries\color{LightCyan}\sffamily}{\hspace*{-1em}\makebox[\z@][r]{\thesubsubsection}}{1em}{\sffamily\normalsize\color{LightCyan}}

\titlespacing*{\section}{\z@}{\baselineskip}{\z@}
\titlespacing*{\subsection}{\z@}{\baselineskip}{\z@}
\titlespacing*{\subsubsection}{\z@}{\baselineskip}{\z@}
\setcounter{secnumdepth}{2}

\setlist{leftmargin=*, nosep}


%% HEADER ____________________________________________________________
\setlength{\footnotemargin}{-1em}
\pretocmd{\@makefntext}{%
  \renewcommand{\@makefnmark}{\thefootnote}
}{}{}
\fancyhf{}
\renewcommand{\headrule}{}
\preto{\footrule}{\begingroup\color{Cyan}}
\appto{\footrule}{\endgroup}


%% FOOTER ____________________________________________________________
\pagestyle{fancy}
\fancyfoot[R]{
{\large\color{Cyan} p. {\LARGE\sffamily\thepage}}
}


%% FIGURE ____________________________________________________________
\captionsetup*{singlelinecheck=false, font={normalsize, color=Cyan}, labelfont={bf, color=Cyan}, labelsep=period}


%% TABLE _____________________________________________________________
\captionsetup*[table]{position=top}
\captionsetup*[sub]{labelfont=small, justification=centering}
\newcommand{\thead}[1]{\bfseries\color{Cyan}\sffamily #1\rule[-1.2ex]{0pt}{2em}}
\renewcommand{\arraystretch}{1.2}


%% URL _______________________________________________________________
\PassOptionsToPackage{hyphens}{url}
\RequirePackage{hyperref}
\hypersetup{colorlinks, allcolors=Cyan, linktoc=all}
\urlstyle{same}


%% BIBLIO ____________________________________________________________

% \bibliographystyle{apalike}
% \renewcommand{\refname}{ }