%-----------------------------------------------------------------------
%
% This is xresume.cls (v0.1, 14 Oct 2021) written by Japin Li.
%
% Copyright (c) 2021, Japin Li <japinli@hotmail.com>.
%
%-----------------------------------------------------------------------
\NeedsTeXFormat{LaTeX2e}[2019/12/20]
\ProvidesClass{xresume}[2021/10/14 xresume v0.1, xresume template.]
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

\LoadClass{article}

% Specifies horizontal and vertical page margins.
\RequirePackage[margin=2cm]{geometry}
\RequirePackage{fontspec} % Required for specifying custom fonts in XeLaTeX
% https://github.com/ReScience/ReScience-submission/issues/32
\defaultfontfeatures{Extension = .otf}
\RequirePackage{fontawesome}
\RequirePackage{xcolor} % Required for custom colors.
\RequirePackage[UTF8]{ctex}
\RequirePackage{tikz}
\usetikzlibrary{arrows}
\RequirePackage[skins]{tcolorbox}
\RequirePackage{graphicx}
\RequirePackage{etoolbox}
\RequirePackage{dashrule}
\RequirePackage{multirow,tabularx}
\RequirePackage{changepage}
\RequirePackage{enumitem}
\RequirePackage{hyperref}
\hypersetup{
    pdfborder = {0 0 0}
}

\setlist{leftmargin=*,labelsep=0.5em,nosep,itemsep=0.25\baselineskip,after=\vskip0.25\baselineskip}
\setlist[itemize]{label=\itemmarker}

\colorlet{accent}{blue!70!black}
\colorlet{heading}{black}
\colorlet{emphasis}{black}

\pagestyle{empty} % Do not show page number.

\setlength{\parindent}{0pt}

\newcommand{\divider}{\textcolor{body!30}{\hdashrule{\linewidth}{0.6pt}{0.5ex}}\medskip}

\newcommand{\itemmarker}{{\small\textbullet}}
\newcommand{\ratingmarker}{\faCircle}

\newcommand{\emailsymbol}{\faAt}
\newcommand{\phonesymbol}{\faPhoneSquare}
\newcommand{\homepagesymbol}{\faChain}
\newcommand{\locationsymbol}{\faMapMarker}
\newcommand{\githubsymbol}{\faGithub}
\newcommand{\blogsymbol}{\faPencilSquareO}
\newcommand{\birthsymbol}{\ifdef{\@female}{\faFemale}{\faMale}}

\newcommand{\printinfo}[2]{\mbox{\textcolor{accent}{#1}\hspace{0.5em}#2\hspace{1em}}}

\newcommand{\female}{\def\@female}
\newcommand{\name}[1]{\def\@name{#1}}
\newcommand{\tagline}[1]{\def\@tagline{#1}}
\newcommand{\photo}[2]{\def\@photo{#2}\def\@photodiameter{#1}}
\newcommand{\email}[1]{\printinfo{\emailsymbol}{#1}}
\newcommand{\phone}[1]{\printinfo{\phonesymbol}{#1}}
\newcommand{\homepage}[1]{\printinfo{\homepagesymbol}{#1}}
\newcommand{\location}[1]{\printinfo{\locationsymbol}{#1}}
\newcommand{\github}[1]{\printinfo{\githubsymbol}{#1}}
\newcommand{\blog}[1]{\printinfo{\blogsymbol}{#1}}
\newcommand{\birth}[1]{\printinfo{\birthsymbol}{#1}}

\newcommand{\personalinfo}[1]{\def\@personalinfo{#1}}

\newcommand{\makecvheader}{%
  \begingroup
    \ifdef{\@photodiameter}{\begin{minipage}{\dimexpr\linewidth-\@photodiameter}}{}%
    \raggedright\color{emphasis}%
    {\Huge\bfseries\MakeUppercase{\@name}\par}
    \medskip
    {\large\bfseries\color{accent}\@tagline\par}
    \medskip
    {\footnotesize\bfseries\@personalinfo\par}
    \ifdef{\@photodiameter}{%
    \end{minipage}\hfill%
    \begin{minipage}{\@photodiameter}
    \tikz\path[fill overzoom image={\@photo}]circle[radius=0.5\linewidth];
    \end{minipage}\par}{}%
  \endgroup\medskip
}

\renewenvironment{quote}{\color{accent}\itshape\large}{\par}

\newcommand{\cvsection}[1]{
  \bigskip%
  {\color{heading}\LARGE\bfseries\MakeUppercase{#1}}\\[-1ex]
  {\color{heading}\rule{\linewidth}{2pt}\par}\medskip
}

\newcommand{\cvtag}[1]{%
  \tikz[baseline]\node[anchor=base,draw=body!30,rounded corners,inner xsep=1ex,inner ysep =0.75ex,text height=1.5ex,text depth=.25ex]{#1};
}

\newcommand{\cvevent}[4]{%
  {\large\color{emphasis}#1\par}
  \smallskip
  \textbf{\color{accent}#2}\par
  \smallskip
  {\small\makebox[0.5\linewidth][l]{\faCalendar \hspace{0.5em}#3}%
  \ifstrequal{#4}{}{}{\makebox[0.5\linewidth][l]{\faMapMarker\hspace{0.5em}#4}}\par}
  \medskip
}

\newcommand{\cvproject}[4]{
  {\makebox[0.5\linewidth][l]{\large\textbf{\color{emphasis}#1}}}
  {\makebox[0.5\linewidth][r]{\textbf{\color{accent}#2}}}\par
  \smallskip
  {\small\makebox[0.7\linewidth][l]{{\color{accent}\faFire}\hspace{0.5em}#3}}
  {\small\makebox[0.3\linewidth][r]{\faCalendarCheckO\hspace{0.5em}#4}}\par
  \medskip
}

\newcommand{\cvjob}[4]{
  {\makebox[0.5\linewidth][l]{\large\color{emphasis}#1}}
  {\makebox[0.5\linewidth][r]{\textbf{\color{accent}#2}}}\par
  \smallskip
  {\small\makebox[0.5\linewidth][l]{\faCalendar \hspace{0.5em}#3}%
    \ifstrequal{#4}{}{}{\makebox[0.5\linewidth][r]{\faMapMarker\hspace{0.5em}#4}}\par}
  \medskip
}

\newcommand{\cvopensource}[1]{
  {\large\color{emphasis}#1\par}
  \medskip
}

\newcommand{\cvachievement}[3]{%
  \begin{tabularx}{\linewidth}{@{}p{2em} @{\hspace{1ex}} >{\raggedright\arraybackslash}X@{}}
  \multirow{2}{*}{\Large\color{accent}#1} & \bfseries\textcolor{emphasis}{#2}\\
  & #3
  \end{tabularx}%
  \smallskip
}

\newcommand{\cvskill}[2]{%
\textcolor{emphasis}{\textbf{#1}}\hfill
\foreach \x in {1,...,5}{%
  \space{\ifnumgreater{\x}{#2}{\color{body!30}}{\color{accent}}\faCircle}}\par%
}

%% End of file `xresume.cls`.
