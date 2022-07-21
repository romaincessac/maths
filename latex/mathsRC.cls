% <------------------------------ Classe mathsRC ------------- Version 2.4 ------------------------------------->%
% <------------------------------- Romain CESSAC ------------- Mai 2022 ------------------------------------->%

% --------------------------------------------------------------------------------------------------------------------------- %
% --------------------------------------------------------------------------------------------------------------------------- %
% -----------------------------  Création de la classe et méthode de compilation

% -------------------   Veillez à placer ce fichier dans le répertoire de compilation de votre document

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{mathsRC}[30/05/2022, v2.4]
\LoadClass[a4paper,11pt]{article}

% -----------------------------  Compilation XeLaTeX OBLIGATOIRE ------------------------------------------ %
\RequirePackage[no-math]{fontspec}

% --------------------------------------------------------------------------------------------------------------------------- %
% --------------------------------------------------------------------------------------------------------------------------- %
% -----------------------------  Packages 

%\RequirePackage[14pt]{extsizes}	%Tailles de police inhabituelles à charger avant geometry
\RequirePackage[left=1.1cm,right=1.1cm,top=1.1cm,bottom=1.6cm]{geometry}	% marges
\RequirePackage[dvips]{graphicx}          % Pour insérer des images
\RequirePackage{amsmath,amsfonts,amssymb,amsthm} 	% Spécial math
\RequirePackage[french]{babel}    	 % Typo. française
	\frenchbsetup{StandardLists=true}	% Bullet pour le itemize
	\setlength{\parindent}{0mm}   	% Pas de retrait de paragraphe
\RequirePackage{hyperref}		% Liens
\RequirePackage{bookmark}
\RequirePackage{multicol}		% Texte sur plusieurs colonnes
\RequirePackage{multirow}
\RequirePackage[np]{numprint}		% Ecriture FR des nombres via \np{ . }
\RequirePackage{ProfCollege}		% Bibliothèques de commandes géométriques et résolutions automatiques de problèmes
%\RequirePackage{xcolor}	% Chargé dans ProfCollege
%\RequirePackage[most,skins,breakable]{tcolorbox}		% Chargé dans ProfCollege
	\tcbuselibrary{skins}		% Skins pour les boîtes
\RequirePackage{tikz}		% Tracés graphiques
	\usetikzlibrary{arrows}
	\usetikzlibrary{decorations.markings}
	\tikzstyle directed=[postaction={decorate, decoration={markings, mark=at position .65 with {\arrow{latex}}}}]
\RequirePackage{tkz-base} 	% Droites graduées et axes
\RequirePackage{tkz-tab}		% Tableaux de variations, signes ...
	\tikzset{node style/.style = {inner sep = 2pt, outer sep = 2pt}}	% Correction d'un problème d'affichage des node dans les tcolorbox pour tkz-tab
\RequirePackage{pgfplots} 
	\pgfplotsset{compat=1.17}
\RequirePackage{esvect}		% Vecteurs via \vv{.}			
\RequirePackage{fancyhdr,lastpage}		% Pieds de page	
\RequirePackage{systeme}	% Systèmes d'équations avec \systeme{}{}...
\RequirePackage{titling} 		% Utilisation de \thetitle, \theauthor et \thedate 
\RequirePackage{tabularx}	% Tableaux plus complexes
\RequirePackage{fancybox}	% Encadrements de résultats 
\RequirePackage{lscape}
\RequirePackage{framed}		% pour barre ds environment algo
\RequirePackage{bbding}		% pour des jolis symboles
\RequirePackage{enumerate}
\RequirePackage{enumitem}
	\setlist[enumerate,1]{label=\bfseries\arabic*)} 		% Numéros en gras listes
	\setlist[enumerate,2]{label=\bfseries\alph*)} 		% Numéros en gras listes
	\setlist[enumerate,3]{label=\bfseries\roman*)} 		% Numéros en gras listes
\RequirePackage{fontawesome5}		% Petits logos originaux
\RequirePackage{listings}		% Codes informatiques
\RequirePackage{xsim}		% Environnements d'exercices, textes à trous ...
\RequirePackage{tasks}		% QCM
	\RenewTasksEnvironment[label=\bfseries\arabic*)]{tasks} % Plusieurs items sur la même ligne


% --------------------------------------------------------------------------------------------------------------------------- %
% --------------------------------------------------------------------------------------------------------------------------- %
% -----------------------------  Style des sections et tableaux

\RequirePackage{titlesec}
	\renewcommand{\thesection}{\Roman{section} - }
	\renewcommand{\thesubsection}{\Alph{subsection}) }
	\renewcommand{\thesubsubsection}{\roman{subsubsection}. }
	\titleformat{\section}[hang]{\filcenter\Large \bfseries}{\thesection}{0pt}{}[\hrule height 0.8pt]
	\titleformat{\subsection}[hang]{\large\bfseries}{\thesubsection}{0pt}{}
	\titleformat{\subsubsection}[hang]{\normalsize}{\bfseries\thesubsubsection}{0pt}{}
	
%\setlength{\arrayrulewidth}{0.3mm}
\setlength{\tabcolsep}{10pt}
%\renewcommand{\arraystretch}{1.5}

% --------------------------------------------------------------------------------------------------------------------------- %
% --------------------------------------------------------------------------------------------------------------------------- %
% -----------------------------  Polices par défaut

\RequirePackage[warnings-off={mathtools-colon,mathtools-overbracket}]{unicode-math}
\setmathfont{Asana-Math.otf}
%\RequirePackage{setspace}		% Interligne
%\setstretch{1.5}

% --------------------------------------------------------------------------------------------------------------------------- %
% ---------------------------------------  OPTION ARIAL ------------------------------------------------------------- %
% -----------------------------  Choix de polices différentes

\DeclareOption{arial}		% Police Arial pour lecture facilitée élèves DYS
{
\setmainfont{Arial}
}
\ProcessOptions

% --------------------------------------------------------------------------------------------------------------------------- %
% --------------------------------------------------------------------------------------------------------------------------- %
% -----------------------------  Commandes

\renewcommand{\P}{\ensuremath{\mathbb{P}}} 	% Probabilité
\renewcommand{\S}{\ensuremath{\mathcal{S}}} 	% Ensemble solution
\newcommand{\ssi}{\ensuremath{\Leftrightarrow}}	% Double flèche ssi
\newcommand{\imp}{\ensuremath{\Leftarrow}}		% Implication
\newcommand{\rec}{\ensuremath{\Rightarrow}}		% Réciproque
\newcommand{\euro}{\eurologo}  	% Symbole euro
\DeclareTextSymbol{\degre}{T1}{6} 		% Degré
\DeclareTextSymbol{\degre}{OT1}{23}
\newcommand{\R}{\ensuremath{\mathbb{R}}}		% Réels
\newcommand{\C}{\ensuremath{\mathbb{C}}}		% Complexes
\newcommand{\Z}{\ensuremath{\mathbb{Z}}}		% Relatifs
\newcommand{\N}{\ensuremath{\mathbb{N}}}		% Naturels
\newcommand{\Q}{\ensuremath{\mathbb{Q}}}		% Rationnels
\newcommand{\D}{\ensuremath{\mathbb{D}}}		% Décimaux
\newcommand{\dx}{\ensuremath{\text{d}x}}		% dx
\newcommand{\dt}{\ensuremath{\text{d}t}}		% dt
\newcommand{\E}{\ensuremath{\text{e}}}			% e exponentielle
\newcommand{\co}{\ensuremath{\mathcal{C}}} 		% C calligraphié
\newcommand{\Oij}{\ensuremath{\left(\text{O}\,;\,\vec{\imath},\vec{\jmath}\right)}~}		% repère oij
\newcommand{\Ouv}{\ensuremath{\left(\text{O}\,;\,\vec{u},\vec{v}\right)}~}		% repère ouv
\newcommand{\Oijk}{\ensuremath{\left(\text{O}\,;\,\vec{\imath},\vec{\jmath},\vec{k}\right)}~}		% repère oijk
% Coordonnées de vecteurs
%dim 2
\newcommand\coorddeux[2]{\begin{pmatrix} 
 #1 \\
 #2
 \end{pmatrix}}
%dim 3
\newcommand\coordtrois[3]{\begin{pmatrix} 
 #1 \\
 #2 \\
 #3
 \end{pmatrix}}
 %dim 4
\newcommand\coordquatre[4]{\begin{pmatrix} 
 #1 \\
 #2 \\
 #3 \\
 #4
 \end{pmatrix}}
% Partie entière, norme et valeur absolue
\newcommand*\ent[1]{\left\lfloor #1\right\rfloor}
\newcommand*\norme[1]{\left\lVert #1\right\rVert}
\newcommand*\abs[1]{\left\lvert #1\right\rvert}
% Intervalles
\newcommand*\intervalle[4]{\left#1 #2 \, ; #3 \right#4}
\newcommand*\intervalleOO[2]{\intervalle{]}{#1}{#2}{[}}
\newcommand*\intervalleFF[2]{\intervalle{[}{#1}{#2}{]}}
\newcommand*\intervalleOF[2]{\intervalle{]}{#1}{#2}{]}}
\newcommand*\intervalleFO[2]{\intervalle{[}{#1}{#2}{[}}

% --------------------------------------------------------------------------------------------------------------------------- %
% ----------------------------------  OPTION COULEUR ----------------------------------------------------------- %
% -----------------------------  Couleurs

% Sans option de couleurs
\definecolor{colRCalpha}{rgb}{0,0,0} 		% Résultats
\definecolor{colRCbeta}{rgb}{0,0,0}		% Définitions
\definecolor{colRCgamma}{HTML}{808080} 		% Exemples
\definecolor{colRComega}{HTML}{808080} 		% Remarques
\definecolor{colsecRCalpha}{HTML}{FFFFFF} 		% Fond des résultats 
\definecolor{colsecRCbeta}{HTML}{FFFFFF} 		% Fond des définitions
\definecolor{colsecRCgamma}{HTML}{FFFFFF} 		% Fond des exemples 
\definecolor{colsecRComega}{HTML}{FFFFFF} 		% Fond des remarques

% Avec l'option « couleur »
\DeclareOption{couleur}
{
	\definecolor{colRCalpha}{HTML}{f00020} 
	\definecolor{colRCbeta}{rgb}{0,0.6,0.4}
	\definecolor{colRCgamma}{HTML}{2B70FB}
	\definecolor{colRComega}{HTML}{808080}
	\definecolor{colsecRCalpha}{HTML}{f00020} 
	\definecolor{colsecRCbeta}{rgb}{0,0.6,0.4}
	\definecolor{colsecRCgamma}{HTML}{2B70FB}
	\definecolor{colsecRComega}{HTML}{808080}
}
\ProcessOptions

% Avec l'option « couleur2 »
\DeclareOption{couleur2}
{
	\definecolor{colRCalpha}{HTML}{FF7713}
	\definecolor{colRCbeta}{HTML}{36CD05}
	\definecolor{colRCgamma}{HTML}{BA0ED8} 
	\definecolor{colRComega}{HTML}{808080}
	\definecolor{colsecRCalpha}{HTML}{FF7713}
	\definecolor{colsecRCbeta}{HTML}{36CD05}
	\definecolor{colsecRCgamma}{HTML}{BA0ED8} 
	\definecolor{colsecRComega}{HTML}{808080}
}
\ProcessOptions

% Avec l'option « couleur3 »
\DeclareOption{couleur3}
{
	\definecolor{colRCalpha}{HTML}{E61142}
	\definecolor{colRCbeta}{HTML}{132AEE}
	\definecolor{colRCgamma}{HTML}{863D03}  
	\definecolor{colRComega}{HTML}{808080}
	\definecolor{colsecRCalpha}{HTML}{E61142}
	\definecolor{colsecRCbeta}{HTML}{132AEE}
	\definecolor{colsecRCgamma}{HTML}{863D03}  
	\definecolor{colsecRComega}{HTML}{808080}
}
\ProcessOptions

% Avec l'option « couleur4 »
\DeclareOption{couleur4}
{
	\definecolor{colRCalpha}{HTML}{7D33FF}
	\definecolor{colRCbeta}{HTML}{E1B400}
	\definecolor{colRCgamma}{HTML}{03A081}  
	\definecolor{colRComega}{HTML}{808080}
	\definecolor{colsecRCalpha}{HTML}{7D33FF}
	\definecolor{colsecRCbeta}{HTML}{E1B400}
	\definecolor{colsecRCgamma}{HTML}{03A081}  
	\definecolor{colsecRComega}{HTML}{808080}
}
\ProcessOptions

% Avec l'option « couleur5 »
\DeclareOption{couleur5}
{
	\definecolor{colRCalpha}{HTML}{8E44AD}
	\definecolor{colRCbeta}{HTML}{3498DB}
	\definecolor{colRCgamma}{HTML}{1F618D}  
	\definecolor{colRComega}{HTML}{808080}
	\definecolor{colsecRCalpha}{HTML}{8E44AD}
	\definecolor{colsecRCbeta}{HTML}{3498DB}
	\definecolor{colsecRCgamma}{HTML}{1F618D}  
	\definecolor{colsecRComega}{HTML}{808080}
}
\ProcessOptions

% --------------------------------------------------------------------------------------------------------------------------- %
% --------------------------------------------------------------------------------------------------------------------------- %
% ----------------------------- Environnements

\tcbuselibrary{theorems}		% Théorèmes depuis tcolorbox et charge amsmath	

% Théoreme
\newtcbtheorem[no counter]{theoreme1}{Théorème}{%
	lower separated=false,
	breakable,
	colback=colsecRCalpha!5,
	beamer,
	drop fuzzy shadow=colRCalpha,
	colframe=colRCalpha,
	fonttitle=\bfseries,
	coltitle=white,
	colbacktitle=colRCalpha,
	enhanced jigsaw,
	boxrule=0.8pt,
	attach boxed title to top left={xshift=2mm,yshift=0mm}, 
	boxed title style={sharp corners},
	sharp corners
}{theoreme1}
\newenvironment{theoreme}[1][]{\begin{theoreme1}{#1}{}}{\end{theoreme1}}

% Définition
\newtcbtheorem[no counter]{defn1}{Définition}{%
	lower separated=false,
	breakable,
	colback=colsecRCbeta!5,
	beamer,
	drop fuzzy shadow=colRCbeta,
	colframe=colRCbeta,
	fonttitle=\bfseries,
	coltitle=white,
	colbacktitle=colRCbeta,
	enhanced jigsaw,
	boxrule=0.8pt,
	attach boxed title to top left={xshift=2mm,yshift=0mm}, 
	boxed title style={sharp corners},
	sharp corners
}{defn1}
\newenvironment{definition}[1][]{\begin{defn1}{#1}{}}{\end{defn1}}

% Définitions
\newtcbtheorem[no counter]{defns1}{Définitions}{%
	lower separated=false,
	breakable,
	colback=colsecRCbeta!5,
	beamer,
	drop fuzzy shadow=colRCbeta,
	colframe=colRCbeta,
	fonttitle=\bfseries,
	coltitle=white,
	colbacktitle=colRCbeta,
	enhanced jigsaw,
	boxrule=0.8pt,
	attach boxed title to top left={xshift=2mm,yshift=0mm}, 
	boxed title style={sharp corners},
	sharp corners
}{defns1}
\newenvironment{definitions}[1][]{\begin{defns1}{#1}{}}{\end{defns1}}

% Propriété
\newtcbtheorem[no counter]{prop1}{Propriété}{%
	lower separated=false,
	breakable,
	colback=colsecRCalpha!5,
	beamer,
	drop fuzzy shadow=colRCalpha,
	colframe=colRCalpha,
	fonttitle=\bfseries,
	coltitle=white,
	colbacktitle=colRCalpha,
	enhanced jigsaw,
	boxrule=0.8pt,
	attach boxed title to top left={xshift=2mm,yshift=0mm}, 
	boxed title style={sharp corners},
	sharp corners
}{prop1}
\newenvironment{propriete}[1][]{\begin{prop1}{#1}{}}{\end{prop1}}

% Propriétés
\newtcbtheorem[no counter]{props1}{Propriétés}{%
	lower separated=false,
	breakable,
	colback=colsecRCalpha!5,
	beamer,
	drop fuzzy shadow=colRCalpha,
	colframe=colRCalpha,
	fonttitle=\bfseries,
	coltitle=white,
	colbacktitle=colRCalpha,
	enhanced jigsaw,
	boxrule=0.8pt,
	attach boxed title to top left={xshift=2mm,yshift=0mm}, 
	boxed title style={sharp corners},
	sharp corners
}{props1}
\newenvironment{proprietes}[1][]{\begin{props1}{#1}{}}{\end{props1}}

% Lemme
\newtcbtheorem[no counter]{lemm1}{Lemme}{%
	lower separated=false,
	breakable,
	colback=colsecRCalpha!5,
	beamer,
	drop fuzzy shadow=colRCalpha,
	colframe=colRCalpha,
	fonttitle=\bfseries,
	coltitle=white,
	colbacktitle=colRCalpha,
	enhanced jigsaw,
	boxrule=0.8pt,
	attach boxed title to top left={xshift=2mm,yshift=0mm}, 
	boxed title style={sharp corners},
	sharp corners
}{lemm1}
\newenvironment{lemme}[1][]{\begin{lemm1}{#1}{}}{\end{lemm1}}

% Corollaire
\newtcbtheorem[no counter]{coro1}{Corollaire}{%
	lower separated=false,
	breakable,
	colback=colsecRCalpha!5,
	beamer,
	drop fuzzy shadow=colRCalpha,
	colframe=colRCalpha,
	fonttitle=\bfseries,
	coltitle=white,
	colbacktitle=colRCalpha,
	enhanced jigsaw,
	boxrule=0.8pt,
	attach boxed title to top left={xshift=2mm,yshift=0mm}, 
	boxed title style={sharp corners},
	sharp corners
}{coro1}
\newenvironment{corollaire}[1][]{\begin{coro1}{#1}{}}{\end{coro1}}

% Remarque
\newtcbtheorem[no counter]{remarque1}{Remarque}{%
	lower separated=false,
	breakable,
	colback=colsecRComega!5,
	beamer,
	drop fuzzy shadow=colRComega,
	colframe=colRComega,
	fonttitle=\bfseries,
	coltitle=white,
	colbacktitle=colRComega,
	enhanced jigsaw,
	boxrule=0.8pt,
	attach boxed title to top left={xshift=2mm,yshift=0mm}, 
	boxed title style={sharp corners},
	sharp corners
}{remarque1}
\newenvironment{remarque}[1][]{\begin{remarque1}{#1}{}}{\end{remarque1}}

% Remarques
\newtcbtheorem[no counter]{remarques1}{Remarques}{%
	lower separated=false,
	breakable,
	colback=colsecRComega!5,
	beamer,
	drop fuzzy shadow=colRComega,
	colframe=colRComega,
	fonttitle=\bfseries,
	coltitle=white,
	colbacktitle=colRComega,
	enhanced jigsaw,
	boxrule=0.8pt,
	attach boxed title to top left={xshift=2mm,yshift=0mm}, 
	boxed title style={sharp corners},
	sharp corners
}{remarques1}
\newenvironment{remarques}[1][]{\begin{remarques1}{#1}{}}{\end{remarques1}}

% Méthode
\newtcbtheorem[no counter]{methode1}{Méthode}{%
	lower separated=false,
	breakable,
	colback=colsecRCgamma!5,
	beamer,
	drop fuzzy shadow=colRCgamma,
	colframe=colRCgamma,
	fonttitle=\bfseries,
	coltitle=white,
	colbacktitle=colRCgamma,
	enhanced jigsaw,
	boxrule=0.8pt,
	attach boxed title to top left={xshift=2mm,yshift=0mm}, 
	boxed title style={sharp corners},
	sharp corners
}{methode1}
\newenvironment{methode}[1][]{\begin{methode1}{#1}{}}{\end{methode1}}

% Exemple
\newtcbtheorem[no counter]{exemple1}{Exemple}{%
	lower separated=false,
	breakable,
	colback=colsecRCgamma!5,
	beamer,
	drop fuzzy shadow=colRCgamma,
	colframe=colRCgamma,
	fonttitle=\bfseries,
	coltitle=white,
	colbacktitle=colRCgamma,
	enhanced jigsaw,
	boxrule=0.8pt,
	attach boxed title to top left={xshift=2mm,yshift=0mm}, 
	boxed title style={sharp corners},
	sharp corners
}{exemple1}
\newenvironment{exemple}[1][]{\begin{exemple1}{#1}{}}{\end{exemple1}}

% Exemples
\newtcbtheorem[no counter]{exemples1}{Exemples}{%
	lower separated=false,
	breakable,
	colback=colsecRCgamma!5,
	beamer,
	drop fuzzy shadow=colRCgamma,
	colframe=colRCgamma,
	fonttitle=\bfseries,
	coltitle=white,
	colbacktitle=colRCgamma,
	enhanced jigsaw,
	boxrule=0.8pt,
	attach boxed title to top left={xshift=2mm,yshift=0mm}, 
	boxed title style={sharp corners},
	sharp corners
}{exemple1}
\newenvironment{exemples}[1][]{\begin{exemples1}{#1}{}}{\end{exemples1}}

% Démonstration
\newenvironment{demonstration}
{\begin{proof}} 
{\end{proof}}

% Correction
\newtheoremstyle{corr}
{\topsep} 
{\topsep}
{\upshape} 
{0pt}
{\upshape}
{}
{ }
{\itshape\textcolor{black}{\thmname{#1}\thmnumber{~#2} \thmnote{#3}:}}
\theoremstyle{corr}
\newtheorem*{correction}{Correction}

% Exercice de cours
\newtcbtheorem[no counter]{exercice1}{Exercice}{%
	lower separated=true,
	breakable=true,
	colback=white,
	beamer,
	colframe=black,
	fonttitle=\bfseries,
	colbacktitle=black,
	coltitle=white,
	enhanced jigsaw,
	sharp corners,
	boxrule=0pt,
	bottomrule=0pt,
	toptitle=0.07cm,
	bottomtitle=0.1cm,
	frame empty,
}{exercice1}

% Exercice de devoir
\newtcbtheorem{exercice2}{Exercice}{%
	lower separated=true,
	breakable=true,
	colback=white,
	beamer,
	colframe=black,
	fonttitle=\bfseries,
	colbacktitle=black,
	coltitle=white,
	enhanced jigsaw,
	sharp corners,
	boxrule=0pt,
	bottomrule=0pt,
	toptitle=0.07cm,
	bottomtitle=0.1cm,
	frame empty,
	separator sign={ |}
}{exercice2}

% Exercice d'activité et de fiche d'exercice
\newtcbtheorem{exercice3}{Exercice}{%
	lower separated=true,
	breakable=true,
	colback=white,
	beamer,
	colframe=black,
	fonttitle=\bfseries,
	colbacktitle=black,
	coltitle=white,
	enhanced jigsaw,
	sharp corners,
	boxrule=0pt,
	bottomrule=0pt,
	toptitle=0.07cm,
	bottomtitle=0.1cm,
	frame empty
}{exercice3}

% Question de test ou QCM
\newcounter{compteurQCM}[section]
\newtheoremstyle{test}
{\topsep} 
{\topsep}
{\upshape} 
{0pt}
{\upshape}
{}
{ }
{\bfseries\textcolor{black}{\thmname{#1}\thmnumber{~#2} \thmnote{#3}:}}
\theoremstyle{test}
\newtheorem{question}[compteurQCM]{Question}

% Culture générale : étymologie, histoire des maths, blague...
\newenvironment{culture}[1][]{
\begin{tcolorbox}[frame hidden,breakable,interior hidden,enhanced,borderline west={2pt}{2pt}{black}]\textbf{#1}}{\end{tcolorbox}}

% --------------------------------------------------------------------------------------------------------------------------- %
% --------------------------------------------------------------------------------------------------------------------------- %
% ----------------------------- Clés à remplir dans le préambule pour en-têtes et pieds de page

\newcommand{\numero}[1]{%
\def\thenumero{#1}}
\newcommand{\classe}[1]{%
\def\theclasse{#1}}
\newcommand{\duree}[1]{%
\def\theduree{#1}}

% --------------------------------------------------------------------------------------------------------------------------- %
% ------------------------------------ TYPE DE DOCUMENT ------------------------------------------------------- %
% ----------------------------- Cours

\DeclareOption{cours}
{
\renewcommand{\maketitle}
{
\renewcommand{\leq}{\ensuremath{\leqslant}} 	% Typographie française pour les inégalités //// doit être exécuté APRES le \begin{document}
\renewcommand{\geq}{\ensuremath{\geqslant}}
\renewcommand{\nleq}{\ensuremath{\nleqslant}}
\renewcommand{\ngeq}{\ensuremath{\ngeqslant}}
%
{\LARGE{\textsc{Chapitre \textbf{\thenumero}}}}

\vspace{2mm}
{\Huge{\textbf{\thetitle}}}
}
\pagestyle{fancy}
\fancyhead[L]{}
\fancyhead[C]{}
\fancyhead[R]{}
\fancyfoot[L]{\theclasse}
\fancyfoot[C]{\textbf{\thepage}}
\fancyfoot[R]{\thedate}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{1.5pt}

\newenvironment{exercice}[1][]{\begin{exercice1}{#1}{}}{\end{exercice1}}
}
\ProcessOptions

% --------------------------------------------------------------------------------------------------------------------------- %
% ------------------------------------ TYPE DE DOCUMENT ------------------------------------------------------- %
% ----------------------------- Devoir surveillé
\DeclareOption{ds}
{
\renewcommand{\maketitle}
{
\renewcommand{\leq}{\ensuremath{\leqslant}} 	% Typographie française pour les inégalités //// doit être exécuté APRES le \begin{document}
\renewcommand{\geq}{\ensuremath{\geqslant}}
\renewcommand{\nleq}{\ensuremath{\nleqslant}}
\renewcommand{\ngeq}{\ensuremath{\ngeqslant}}
%
{\Huge{\textbf{DEVOIR SURVEILLÉ N°\thenumero}}}

\vspace{2mm}
{\Large{\textsc{\theduree}}}

\vspace{3mm}
\textit{\small{Toute réponse doit être justifiée sauf mention contraire. Bon courage !}}
}
\pagestyle{fancy}
\fancyhead[L]{}
\fancyhead[C]{}
\fancyhead[R]{}
\fancyfoot[L]{\theclasse}
\fancyfoot[C]{\textbf{\thepage/\pageref*{LastPage}}}
\fancyfoot[R]{\thedate}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{1.5pt}

\newenvironment{exercice}[1][]{\begin{exercice2}{#1}{}}{\end{exercice2}}
}
\ProcessOptions


% --------------------------------------------------------------------------------------------------------------------------- %
% ------------------------------------ TYPE DE DOCUMENT ------------------------------------------------------- %
% ----------------------------- Devoir maison
\DeclareOption{dm}
{
\renewcommand{\maketitle}
{
\renewcommand{\leq}{\ensuremath{\leqslant}} 	% Typographie française pour les inégalités //// doit être exécuté APRES le \begin{document}
\renewcommand{\geq}{\ensuremath{\geqslant}}
\renewcommand{\nleq}{\ensuremath{\nleqslant}}
\renewcommand{\ngeq}{\ensuremath{\ngeqslant}}
%
{\Huge{\textbf{DEVOIR MAISON N°\thenumero}}}

\vspace{3mm}
}
\pagestyle{fancy}
\fancyhead[L]{}
\fancyhead[C]{}
\fancyhead[R]{}
\fancyfoot[L]{\theclasse}
\fancyfoot[C]{\textbf{\thepage/\pageref*{LastPage}}}
\fancyfoot[R]{À rendre le \thedate}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{1.5pt}

\newenvironment{exercice}[1][]{\begin{exercice2}{#1}{}}{\end{exercice2}}
}
\ProcessOptions


% --------------------------------------------------------------------------------------------------------------------------- %
% ------------------------------------ TYPE DE DOCUMENT ------------------------------------------------------- %
% ----------------------------- Corrigé DS
\DeclareOption{corrigeds}
{
\renewcommand{\maketitle}
{
\renewcommand{\leq}{\ensuremath{\leqslant}} 	% Typographie française pour les inégalités //// doit être exécuté APRES le \begin{document}
\renewcommand{\geq}{\ensuremath{\geqslant}}
\renewcommand{\nleq}{\ensuremath{\nleqslant}}
\renewcommand{\ngeq}{\ensuremath{\ngeqslant}}
%
{\Huge{\textbf{DEVOIR SURVEILLÉ N°\thenumero}}}

\vspace{2mm}
{\Large{\textsc{Corrigé}}}

\vspace{3mm}
}
\pagestyle{fancy}
\fancyhead[L]{}
\fancyhead[C]{}
\fancyhead[R]{}
\fancyfoot[L]{\theclasse}
\fancyfoot[C]{\textbf{\thepage}}
\fancyfoot[R]{\thedate}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{1.5pt}

\newenvironment{exercice}[1][]{\begin{exercice2}{#1}{}}{\end{exercice2}}
}
\ProcessOptions



% --------------------------------------------------------------------------------------------------------------------------- %
% ------------------------------------ TYPE DE DOCUMENT ------------------------------------------------------- %
% ----------------------------- Corrigé DM
\DeclareOption{corrigedm}
{
\renewcommand{\maketitle}
{
\renewcommand{\leq}{\ensuremath{\leqslant}} 	% Typographie française pour les inégalités //// doit être exécuté APRES le \begin{document}
\renewcommand{\geq}{\ensuremath{\geqslant}}
\renewcommand{\nleq}{\ensuremath{\nleqslant}}
\renewcommand{\ngeq}{\ensuremath{\ngeqslant}}
%
{\Huge{\textbf{DEVOIR MAISON N°\thenumero}}}

\vspace{2mm}
{\Large{\textsc{Corrigé}}}

\vspace{3mm}
}
\pagestyle{fancy}
\fancyhead[L]{}
\fancyhead[C]{}
\fancyhead[R]{}
\fancyfoot[L]{\theclasse}
\fancyfoot[C]{\textbf{\thepage}}
\fancyfoot[R]{\thedate}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{1.5pt}

\newenvironment{exercice}[1][]{\begin{exercice2}{#1}{}}{\end{exercice2}}
}
\ProcessOptions



% --------------------------------------------------------------------------------------------------------------------------- %
% ------------------------------------ TYPE DE DOCUMENT ------------------------------------------------------- %
% ----------------------------- Fiche d'exercices
\DeclareOption{exercices}
{
\renewcommand{\maketitle}
{
\renewcommand{\leq}{\ensuremath{\leqslant}} 	% Typographie française pour les inégalités //// doit être exécuté APRES le \begin{document}
\renewcommand{\geq}{\ensuremath{\geqslant}}
\renewcommand{\nleq}{\ensuremath{\nleqslant}}
\renewcommand{\ngeq}{\ensuremath{\ngeqslant}}
%
{\Huge{\textbf{FICHE D'EXERCICES}}}

\vspace{2mm}
{\LARGE{\textsc{\thetitle}}}
}
\pagestyle{fancy}
\fancyhead[L]{}
\fancyhead[C]{}
\fancyhead[R]{}
\fancyfoot[L]{\theclasse}
\fancyfoot[C]{\textbf{\thepage}}
\fancyfoot[R]{\thedate}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{1.5pt}

\newenvironment{exercice}[1][]{\begin{exercice3}{#1}{}}{\end{exercice3}}
}
\ProcessOptions


% --------------------------------------------------------------------------------------------------------------------------- %
% ------------------------------------ TYPE DE DOCUMENT ------------------------------------------------------- %
% ----------------------------- Activité
\DeclareOption{activite}
{
\renewcommand{\maketitle}
{
\renewcommand{\leq}{\ensuremath{\leqslant}} 	% Typographie française pour les inégalités //// doit être exécuté APRES le \begin{document}
\renewcommand{\geq}{\ensuremath{\geqslant}}
\renewcommand{\nleq}{\ensuremath{\nleqslant}}
\renewcommand{\ngeq}{\ensuremath{\ngeqslant}}
%
{\LARGE{\textsc{Activité}}}

\vspace{2mm}
{\Huge{\textbf{\thetitle}}}
}
\pagestyle{fancy}
\fancyhead[L]{}
\fancyhead[C]{}
\fancyhead[R]{}
\fancyfoot[L]{\theclasse}
\fancyfoot[C]{\textbf{\thepage}}
\fancyfoot[R]{\thedate}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{1.5pt}

\newenvironment{exercice}[1][]{\begin{exercice3}{#1}{}}{\end{exercice3}}
}
\ProcessOptions


% --------------------------------------------------------------------------------------------------------------------------- %
% ------------------------------------ TYPE DE DOCUMENT ------------------------------------------------------- %
% ----------------------------- Test / QCM
\DeclareOption{test}
{
\renewcommand{\maketitle}
{
\newgeometry{left=0.7cm,right=0.7cm,top=0.7cm,bottom=0.7cm}	% Peu de bordure de page
\RenewTasksEnvironment[label=$\square$]{tasks} % Petits carrés pour qcm
\renewcommand{\leq}{\ensuremath{\leqslant}} 	% Typographie française pour les inégalités //// doit être exécuté APRES le \begin{document}
\renewcommand{\geq}{\ensuremath{\geqslant}}
\renewcommand{\nleq}{\ensuremath{\nleqslant}}
\renewcommand{\ngeq}{\ensuremath{\ngeqslant}}
\newcommand{\sujet}{\textbf{NOM:} \blank[width=10cm]\ \hspace{5cm} \textbf{Note:}
%
\setcounter{compteurQCM}{0}}
}
\pagestyle{fancy}
\fancyhead[L]{}
\fancyhead[C]{}
\fancyhead[R]{}
\fancyfoot[L]{}
\fancyfoot[C]{}
\fancyfoot[R]{}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}
}
\ProcessOptions


% --------------------------------------------------------------------------------------------------------------------------- %
% --------------------------------------------------------------------------------------------------------------------------- %
% ----------------------------- Commandes et environnements ALGORITHMIQUE et PROGRAMMATION

% Insérer quelques commandes de code
\newcommand{\code}[1]{{\ttfamily \footnotesize #1}}

% Lien vers une activité Capytale
\definecolor{colRCcapy}{HTML}{008000}
\DeclareTotalTCBox{\liencapytale}{ s O{} m }
	{enhanced,size=fbox,on line,arc=3pt,colback=colRCcapy,colframe=colRCcapy,fontupper=\IfBooleanTF{#1}{\ttfamily}{\sffamily}\bfseries,colupper=white}%
	{#3#2~{\scriptsize\faLink}}
\newcommand{\capytale}[1]{\href{https://capytale2.ac-paris.fr/web/c/#1}{\liencapytale{#1}}}	% Capsule Capytale avec lien vers Capytale / Importé depuis ProfLycée CTAN

% Environnement de code Python
\lstdefinestyle{pythonRC}{%
	language=Python,
 	breaklines=true,
 	basicstyle   = \footnotesize\ttfamily,
 	keywordstyle =    \bfseries\color{colRCcapy},
  	keywordstyle = [2]\color{orange},
  	commentstyle =    \color{gray}\itshape,
  	stringstyle  =    \color{red},
  	frame = leftline,
  	xleftmargin=25pt,
  	xrightmargin=25pt,
  	framesep= 5pt,
  	framerule=2pt,
  	aboveskip= -3ex,                  
  	tabsize=3,
  	rulecolor=\color{black},
}

\lstdefinestyle{pythonRCnumbers}{%
  	language=Python,
  	breaklines=true,
  	basicstyle   = \footnotesize\ttfamily,
  	keywordstyle =    \bfseries\color{colRCcapy},
  	keywordstyle = [2]\color{orange},
  	commentstyle =    \color{gray}\itshape,
  	stringstyle  =    \color{red},
  	frame = leftline,
  	numbers=right,
  	xleftmargin=25pt,
  	xrightmargin=25pt,
  	framesep= 5pt,
  	framerule=2pt,
  	aboveskip= -3ex,                  
  	tabsize=3,
  	rulecolor=\color{black},
}

\lstnewenvironment{python*} % Sans numérotation des lignes
  {\lstset{style=pythonRC}\faPython}
  {}
  
\lstnewenvironment{python} % Avec numérotation des lignes
  {\lstset{style=pythonRCnumbers}\faPython}
  {}
 
% Environnement pseudo-code, langage naturel...
\lstdefinelanguage{PseudoCode}{keywords={},comment=[l]{}}
\lstdefinestyle{algoRC}{%
  language=PseudoCode,
  breaklines=true,
  basicstyle   = \footnotesize\ttfamily,
  keywordstyle =    \bfseries\color{black},
  commentstyle =    \color{gray}\itshape,
  literate={=}{$\leftarrow{}$}{1} {==}{$={}$}{1},
  frame = leftline,
  rulecolor=\color{gray},
  xleftmargin=25pt,
  xrightmargin=25pt,
  framesep= 5pt,
  framerule=2pt,
  aboveskip= -3ex,                  
  tabsize=3,
  morekeywords={POUR, ALLANT, DE, À, SI, SINON, SINONSI, ALORS, TANT, QUE,FINPOUR,FINSI,FINTANTQUE,FIN,DÉBUT, DÉFINIR,VARIABLES,VARIABLE,LIRE,AFFICHER,ÉCRIRE,AFFECTER,FAIRE,SAISIR}
}

\lstnewenvironment{algorithme}
  {\lstset{style=algoRC}\faEdit}
  {}
  