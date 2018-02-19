%
% Main document
% ===========================================================================
% This is part of the document "Project documentation template".
% Authors: brd3, kaa1, ldd1
%

%---------------------------------------------------------------------------
\ProvidesClass{bfh_template}

\LoadClass[
	a4paper,				% paper format
	10pt,					% fontsize
	onside,				% double-sided ( onside / twoside )
	openright,				% begin new chapter on right side
	notitlepage,			% use no standard title page
	parskip=half,			% set paragraph skip to half of a line
]{scrreprt}					% KOMA-script report
%---------------------------------------------------------------------------

\raggedbottom
\KOMAoptions{cleardoublepage=plain}										% Add header and footer on blank pages


% Load Standard Packages:
%---------------------------------------------------------------------------
\usepackage[standard-baselineskips]{cmbright}

\usepackage[ngerman]{babel}												% german hyphenation
\usepackage[latin1]{inputenc}  											% Unix/Linux - load extended character set (ISO 8859-1)
%\usepackage[ansinew]{inputenc}  										% Windows - load extended character set (ISO 8859-1)
\usepackage[T1]{fontenc}												% hyphenation of words with ‰,ˆ and ¸
\usepackage{textcomp}													% additional symbols
\usepackage{ae}															% better resolution of Type1-Fonts 
\usepackage{etoolbox}													% color manipulation of header and footer
\usepackage{graphicx}                      								% integration of images
\usepackage{float}														% floating objects
\usepackage{caption}													% for captions of figures and tables
\usepackage{booktabs}													% package for nicer tables
\usepackage{tocvsec2}													% provides means of controlling the sectional numbering
%---------------------------------------------------------------------------

% Eigene Packete
%---------------------------------------------------------------------------
\usepackage{hhline}														% Dicke Linien in Tabellen
\usepackage{listings}													% Fuer Terminal Ausgabe
\usepackage{scrhack}													% clears warning \float@addtolists detected!
\usepackage{xcolor}
\usepackage{titling}													% to use title author in document

\usepackage{etoolbox}
%\newtoggle{paper}
%%\toggletrue{paper}
%\togglefalse{paper}

\input{essentials/settings}


%=================================
\usepackage{accsupp}% http://ctan.org/pkg/accsupp						% Damit Nummern nicht Kopiert werden sollten
\newcommand{\emptyaccsupp}[1]{\BeginAccSupp{ActualText={}}#1\EndAccSupp{}}

\usepackage{listings}% http://ctan.org/pkg/listings
\lstset
{
    numbers=left,
    numbersep=2em,
    numberstyle=\tiny\emptyaccsupp,
    frame=single,
    framesep=\fboxsep,
    framerule=\fboxrule,
    rulecolor=\color{black},
    xleftmargin=\dimexpr\fboxsep+\fboxrule\relax,
    xrightmargin=\dimexpr\fboxsep+\fboxrule\relax,
    breaklines=true,
    basicstyle=\small\tt,
    backgroundcolor=\color{gray!10},
    tabsize=2,
    columns=flexible,
    %morekeywords={maketitle},
}
%=================================

\usepackage{dirtree}													% Baumansicht von Ordnern und Dateien
\usepackage{wrapfig}													% Text um Bilder
\usepackage[printonlyused]{acronym}										% f¸r Abk¸rzungsverzeichnis
\usepackage{pdflscape}

\usepackage{pgfplots}													% f¸r Matlabplots
\pgfplotsset{compat=newest}
\pgfplotsset{plot coordinates/math parser=false}
\newlength\figureheight
\newlength\figurewidth
\usepgfplotslibrary{external}

\usetikzlibrary{plotmarks}
\usepackage{tikz}
\usetikzlibrary{external}
\tikzexternalize[prefix=cache/]
\tikzset{external/mode=list and make}
\tikzset{external/export=false}

\usepackage{pdfpages}													% f¸r PDFs einbinden
\usepackage{mcode}	                          							% f¸r Matlab Code einzubinden
%\usepackage[framed,numbered,autolinebreaks,useliterate]{mcode}			% f¸r Matlab Code einzubinden

% um svg Dateien einzubinden
\usepackage{color}
\usepackage{transparent}
\graphicspath{{svg/}}

\usepackage{siunitx}													% Einheiten nach SI
\usepackage{lmodern}													% Damit siunitx nicht Verpixelt
\usepackage[ruled,vlined,linesnumbered]{algorithm2e}					% Einfache Algorithmen aufzeigen
\usepackage{subcaption}													% Mehrere Bilder nebeneinander (a und b)
\usepackage{multirow}													% Tabellen speziell gestalten
\usepackage{rotating}													% Eintrag in Tabelle rotieren
\usepackage{nameref}													% Verweis mit Namen
%---------------------------------------------------------------------------

% Load Math Packages
%---------------------------------------------------------------------------
\usepackage{amsmath}                    	   							% various features to facilitate writing math formulas
\usepackage{amsthm}                       	 							% enhanced version of latex's newtheorem
\usepackage{amsfonts}                      								% set of miscellaneous TeX fonts that augment the standard CM
\usepackage{amssymb}													% mathematical special characters
\usepackage{exscale}													% mathematical size corresponds to textsize
%---------------------------------------------------------------------------

% Package to facilitate placement of boxes at absolute positions
%---------------------------------------------------------------------------
\usepackage[absolute]{textpos}
\setlength{\TPHorizModule}{1mm}
\setlength{\TPVertModule}{1mm}
%---------------------------------------------------------------------------					
			
% Definition of Colors
%---------------------------------------------------------------------------
\RequirePackage{color}                          % Color (not xcolor!)
\definecolor{linkblue}{rgb}{0,0,0.8}            % Standard
\definecolor{darkblue}{rgb}{0,0.08,0.45}        % Dark blue
\definecolor{bfhgrey}{rgb}{0.41,0.49,0.57}      % BFH grey
\definecolor{bfhblack}{rgb}{0,0,0}              % BFH black

\iftoggle{blacklinkcolor}{ % using paper
	\definecolor{linkcolor}{rgb}{0,0,0}        	% Black for the print-version!
}{ % electronic
	\definecolor{linkcolor}{rgb}{0,0,0.8}     	% Blue for the web- and cd-version!
}

%---------------------------------------------------------------------------

% Hyperref Package (Create links in a pdf)
%---------------------------------------------------------------------------
\usepackage[
	pdftex,ngerman,bookmarks,plainpages=false,pdfpagelabels,
	backref = {false},										% No index backreference
	colorlinks = {true},                  					% Color links in a PDF
	hypertexnames = {true},              					% no failures "same page(i)"
	bookmarksopen = {true},               					% opens the bar on the left side
	bookmarksopenlevel = {0},             					% depth of opened bookmarks
	%pdftitle = { \mytitle },	   							% PDF-property
	%pdfauthor = {luded2},        					  		% PDF-property
	%pdfsubject = {LaTeX\ Dokument},        				% PDF-property
	linkcolor = {linkcolor},              					% Color of Links
	citecolor = {linkcolor},              					% Color of Cite-Links
	urlcolor = {linkcolor},               					% Color of URLs
]{hyperref}
%---------------------------------------------------------------------------

% Set up page dimension
%---------------------------------------------------------------------------
\usepackage{geometry}

\iftoggle{print}{ % using paper
  \geometry{
	a4paper,
	left=28mm,
	right=15mm,
	top=30mm,
	headheight=20mm,
	headsep=10mm,
	textheight=242mm,
	footskip=15mm
	}
}{ % electronic
  \geometry{
	a4paper,
	left=17mm,
	right=17mm,
	top=30mm,
	headheight=20mm,
	headsep=10mm,
	textheight=242mm,
	footskip=15mm
	}
}
%---------------------------------------------------------------------------

% Makeindex Package
%---------------------------------------------------------------------------
\usepackage{makeidx}                         		% To produce index
\makeindex                                    	% Index-Initialisation
%---------------------------------------------------------------------------

% Glossary Package
%---------------------------------------------------------------------------
% the glossaries package uses makeindex
% if you use TeXnicCenter do the following steps:
%  - Goto "Ausgabeprofile definieren" (ctrl + F7)
%  - Select the profile "LaTeX => PDF"
%  - Add in register "Nachbearbeitung" a new "Postprozessoren" point named Glossar
%  - Select makeindex.exe in the field "Anwendung" ( ..\MiKTeX x.x\miktex\bin\makeindex.exe )
%  - Add this [ -s "%tm.ist" -t "%tm.glg" -o "%tm.gls" "%tm.glo" ] in the field "Argumente"
%
% for futher informations go to http://ewus.de/tipp-1029.html
%---------------------------------------------------------------------------
\usepackage[nonumberlist]{glossaries}
\makeglossaries
\include{database/glossar}
%---------------------------------------------------------------------------



% Set up header and footer
%---------------------------------------------------------------------------


% % % % defined commands % % % % 
%\renewcommand{\arraystretch}{1.5}% Du weiﬂt was Du damit machst?
%\newcommand{\versiondate}{29. Januar 2016}
%\newcommand{\firstAuthor}{Firstname Lastname}
%\newcommand{\shortAuthors}{F. Lastname}
%\newcommand{\authorname}{\firstAuthor}
 
%\usepackage[automark,headsepline,footsepline,plainfootsepline]{scrlayer-scrpage}
\usepackage[automark,headsepline,footsepline]{scrlayer-scrpage}
\automark[chapter]{chapter}% Eventuell wenn doppelseitig
\setkomafont{pageheadfoot}{\color{bfhblack}\footnotesize\scriptsize}
\setkomafont{pagenumber}{\color{bfhblack}}
\clearpairofpagestyles
\ohead*{\headmark}
\ifoot*{\mytitle, Version \versionnumber, \versiondate}
\ofoot*{\pagemark}
%\ofoot*{\thepage}
\ModifyLayer[addvoffset=-.6ex]{scrheadings.foot.above.line}% Linie verschieben
\ModifyLayer[addvoffset=-.6ex]{plain.scrheadings.foot.above.line}% Linie verschieben
\color{bfhblack}                            % Farbe wieder auf schwarz stellen

\pagestyle{plain}
\pagenumbering{roman}
%\settocdepth{section}						% Set depth of toc 
\setcounter{secnumdepth}{5}	