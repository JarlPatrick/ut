% XeLaTeX, LuaLaTeX, pdfLaTeX tugi
% Mitu juhendajat
% Tabelid
% Hyperlingi font
% Tabelid (paigutus, numeratsioon)
% Jooniste numeratsioon
% Automaatne nummerdamine ilma käsuta
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{trkut}[2018-09-30 TRK UT class]

% Numbrite vahel ja lõpus on punkt, chapter font large, 12pt.
\LoadClass[oneside, 12pt, headings=small, numbers=noendperiod]{scrreprt}

% Scriptimismacrod
\usepackage{etoolbox}

% Tühjad ääred
\usepackage[layout=a4paper, top=2.5cm, bottom=2.5cm, left=3cm, right=2cm, includeall=false]{geometry}

% Vali siia soovi korral meeldiv font (lmodern, times, mathpazo, mathptmx, txfonts)
\usepackage{mathpazo}

% Eesti keele tugi
\usepackage{polyglossia}
\setdefaultlanguage{estonian}

% Joonised
\usepackage{graphicx}

% Sisukorras ja viidetel on lingid
\usepackage{hyperref}
\hypersetup{
    colorlinks,
    citecolor=black,
    filecolor=black,
    linkcolor=black,
    urlcolor=black,
}

%% Tiitellehe genereerimine
% standardsete muutujate tõlked (alias)
%\def\autor#1{\gdef\@autor{#1}\ClassWarning{trkuur}{Use \\author instead of \\autor, the latter does not work without trkuur wraping}}
%\def\pealkiri#1{\gdef\@pealkiri{#1}\ClassWarning{trkuur}{Use \\title instead of \\pealkiri, the latter does not work without trkuur wraping}}
\def\autor#1{\gdef\@author{#1}}
\def\pealkiri#1{\gdef\@title{#1}}
% uued eestikeelsed muutujad
\def\klass#1{\gdef\@klass{#1}}
\def\juhendaja#1{\gdef\@juhendaja{#1}}
\def\asutus#1{\gdef\@asutus{#1}}
\def\paber#1{\gdef\@paber{#1}}
\def\koht#1{\gdef\@koht{#1}}

% vaikeväärtused
\paber{Uurimist\"o\"o}
\asutus{Tallinna Reaalkool}
\koht{Tallinn}

% Tiitellehe genereerimine
\renewcommand{\maketitle}{\newpage
	\thispagestyle{empty}
	\large	
	\begin{center}
        \expandafter{\@asutus} \\
	\end{center}
	\vspace{7cm}
	\begin{center}
		\LARGE
		\expandafter{\textbf{\@title}}
	\end{center}

	\centerline{\@paber}
	\vspace{3cm}
	\begin{flushright}
	\expandafter{\@author} \\
	\expandafter{\@klass} \\
	Juhendaja: \expandafter{\@juhendaja}
	\end{flushright}
	\vfill
	\centerline{\@koht{} \the\year}%
	\clearpage
	\normalsize
}

% Kinnituslehe genereerimine
\newcommand{\kinnitusleht}{%
	\newpage
	\addcontentsline{toc}{chapter}{Kinnitusleht}
	\setlength{\topskip}{2.5 cm}
	\setlength{\vskip}{0 cm}
	\Large{\textbf{Kinnitusleht}}
    \normalsize
    \vfill
    Kinnitan, et \begin{itemize}
        \item koostasin uurimistöö iseseisvalt. Kõigile töös kasutatud teiste autorite töödele ja
        andme\-allikatele on viidatud;
        \item olen teadlik, et uurimistööd ei edastata teistele tulu teenimise eesmärgil ega jagata
        tead\-likult plagieerimiseks.
    \end{itemize}
    .\dotfill \\
    kuupäev / nimi / allkiri \\
    \vfill
    \noindent
    Tunnistan uurimistöö kaitsmisvalmiks. \\
    \\
    Juhendajad \\
    \\
    .\dotfill \\
    kuupäev / nimi / allkiri
    \\
    \\
    .\dotfill \\
    kuupäev / nimi / allkiri
    \vfill
    \vfill
    \setlength{\topskip}{0 cm}
}


%% Leheküljenumbrid algavad sisukorra teiselt leheküljelt
\renewcommand\thepage{}
\newtoggle{nummerdamelehti}
\togglefalse{nummerdamelehti}
% Käsk nummerdamise alustamiseks
\newcommand{\nummerdame}{%
	\iftoggle{nummerdamelehti}{}{%
		\renewcommand\thepage{\arabic{page}}%
		\toggletrue{nummerdamelehti}%
		\thispagestyle{empty}%
	}
}

%Sisukord
\KOMAoptions{toc=chapterentrydotfill}% Peatükkide taga on punktiirjoon
\addtokomafont{chapterentry}{\mdseries}% Peatükid ei ole boldis
\renewcommand*{\@pnumwidth}{1em}% Punktiirjoone ja leheküljenumbrite vahe
\setcounter{tocdepth}{99}% Näitame kõikide - ka väga madala taseme - jaotuste pealkirju
\setcounter{secnumdepth}{99}% Numbreid ka neile


% Lisade pealkirjad stiilis "Lisa 2 Teise lisa pealkiri"
% Vaata https://tex.stackexchange.com/questions/163890
\let\oldaddchap\addchap
\g@addto@macro\appendix{%
	\renewcommand*{\thechapter}{%
		{\arabic{chapter}}
	}
	\renewcommand*{\chapterformat}{%
		{\chapapp\nobreakspace\thechapter\autodot\enskip}%
	}
	\renewcommand*{\chaptermarkformat}{%
		{\chapapp\nobreakspace\thechapter\autodot\enskip}%
	}
	\let\oldaddcontentsline\addcontentsline
	\newcommand\hackedaddcontentsline[3]{\oldaddcontentsline{#1}{#2}{\chapapp\nobreakspace#3}}
	\let\oldchapter\chapter
	\renewcommand*\chapter[1]{%
		\let\addcontentsline\hackedaddcontentsline%
		\oldchapter{#1}%
		\let\addcontentsline\oldaddcontentsline%
	}
	\renewcommand*{\chapterheadstartvskip}{\vspace{0pt}}
}

%%%%% Vaja implementeerida ja üle vaadata
%%% Loetelud ja listid tihedamini kokku
%%%% HACK: reimplement \AtBeginEnvironment for scribtex compatability
%\patchcmd\begin
%  {\csname #1\endcsname}
%  {\csuse{@begin@#1@hook}%
%   \csname #1\endcsname}
%  {}
%  {\etb@warning{%
%     Patching '\string\begin' failed!\MessageBreak
%     '\string\AtBeginEnvironment' will not work\@gobble}}
%
%\csgappto{@begin@enumerate@hook}{%
%    \setlength{\itemsep}{0pt}%
%    \setlength{\parskip}{1mm}%
%    \setlength{\parsep}{0pt}%
%  }
%
%\csgappto{@begin@itemize@hook}{%
%    \setlength{\itemsep}{0pt}%
%    \setlength{\parskip}{1mm}%
%    \setlength{\parsep}{0pt}%
%  }
%
%\csgappto{@begin@description@hook}{%
%    \setlength{\itemsep}{0pt}%
%    \setlength{\parskip}{1mm}%
%    \setlength{\parsep}{0pt}%
%  }
%
%  
%\usepackage{enumitem}
%\setlist{itemsep=0.1mm}

% Left-align all captions. Always.
\usepackage[tableposition=top]{caption}
\captionsetup{justification=justified,singlelinecheck=false}

% Joonis vahetult seda kirjeldava teksti juures ehk sama alapeatüki sees
\usepackage[section]{placeins}

% Captions to "Caption" style instead of "Source".
\newcommand{\trkcaptionsetup}{\captionsetup{labelformat=simple, labelsep=period, labelfont=bf, font=bf}}
\trkcaptionsetup % And this is also the default
% Captions to  "Source" mode. Only used internally by \allikas
\newcommand{\captionstosource}{\captionsetup{labelformat=simple, labelsep=period, font=normalfont}}
% Add source to a figure or table.
\newcommand{\allikas}[1]{\vspace{-1em}\captionstosource\caption*{Allikas: #1}\trkcaptionsetup}

%% Töö kõik tabelid tuleb nummerdada läbiva numeratsiooniga (ja kui juba tabelid, siis muu ka vist)
\usepackage{chngcntr}
\counterwithout{figure}{chapter}
\counterwithout{table}{chapter}
\counterwithout{equation}{chapter}
\counterwithout{footnote}{chapter}

% Reavahe on 1,5
\renewcommand{\baselinestretch}{1.5} 

% Punkti järel ei ole pikka tühikut
\frenchspacing

% Taandridasid pole
\setlength{\parindent}{0pt}

% Lõiguvahe 1em, ülaääre ja teksti vahel pole vaba ruumi
\setlength{\parskip}{1em}
\setlength{\topskip}{0pt}

% Pealkirjade vahed 
\RedeclareSectionCommand[
beforeskip=2.5 cm]{chapter}
\renewcommand*{\chapterheadendvskip}{\vspace{0em}}
\RedeclareSectionCommand[
beforeskip=1pt,
afterskip=1sp,
tocindent=2em]{section}
\RedeclareSectionCommand[
beforeskip=1pt,
afterskip=1sp,
tocindent=4em]{subsection}
\RedeclareSectionCommand[
beforeskip=1pt,
afterskip=1sp,
tocindent=6em]{subsubsection}
\RedeclareSectionCommand[
beforeskip=1pt,
afterskip=1sp,
tocindent=8em]{paragraph}
\RedeclareSectionCommand[
beforeskip=1pt,
afterskip=1sp,
indent=0pt,
tocindent=10em]{subparagraph}

%Pealkirjad boldis ja tekstiga sama fondiga
\setkomafont{disposition}{\rmfamily\bfseries}
