% <------------------------------ Classe Möbius-Éval ------------- Version 1 ------------------------------------->%
% <------------------------------- Romain CESSAC ------------- Juillet 2022 ------------------------------------->%

% --------------------------------------------------------------------------------------------------------------------------- %
% --------------------------------------------------------------------------------------------------------------------------- %
% -----------------------------  Création de la classe et méthode de compilation

% -------------------   Veillez à placer ce fichier dans le répertoire de compilation de votre document

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{mobius-eval}[23/07/2022, v1.0]
\LoadClass{article}

% -----------------------------  Compilation XeLaTeX OBLIGATOIRE ------------------------------------------ %
\RequirePackage[no-math]{fontspec}

% --------------------------------------------------------------------------------------------------------------------------- %
% --------------------------------------------------------------------------------------------------------------------------- %
% -----------------------------  Packages 

\RequirePackage[11pt]{extsizes}	%Tailles de police inhabituelles à charger avant geometry

\DeclareOption{14pt}
{
\usepackage[14pt]{extsizes}	%Tailles de police inhabituelles à charger avant geometry
}
\ProcessOptions

\RequirePackage{anyfontsize}
\RequirePackage[a4paper,left=1.3cm,right=1.3cm,top=1.3cm,bottom=1.7cm]{geometry}	% marges
\RequirePackage[dvips]{graphicx}          % Pour insérer des images
\RequirePackage{amsmath,amsfonts,amssymb,amsthm} 	% Spécial math
\RequirePackage[french]{babel}    	 % Typo. française
	\frenchbsetup{StandardLists=true}	% Bullet pour le itemize
	\setlength{\parindent}{0mm}   	% Pas de retrait de paragraphe
\RequirePackage{hyperref}		% Liens
\RequirePackage{multicol}		% Texte sur plusieurs colonnes
\RequirePackage{multirow}
\RequirePackage[np]{numprint}		% Ecriture FR des nombres via \np{ . }
\RequirePackage[usenames,dvipsnames]{xcolor}
\RequirePackage[most,skins,breakable]{tcolorbox}
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
\RequirePackage{bookmark}
\RequirePackage{systeme}	% Systèmes d'équations avec \systeme{}{}...
\RequirePackage{titling} 		% Utilisation de \thetitle, \theauthor et \thedate 
\RequirePackage{tabularx}	% Tableaux plus complexes
\RequirePackage{fancybox}	% Encadrements de résultats 
\RequirePackage{lscape}
\RequirePackage{framed}		% pour barre ds environment algo

% -------------------------- Listes
\RequirePackage{pifont}		% Perso des puces
\RequirePackage{enumerate}
\RequirePackage{enumitem}
	\setlist[enumerate,1]{label=\bfseries\arabic*.,leftmargin=*} 		% Numéros en gras listes
	\setlist[enumerate,2]{label=\bfseries\alph*)} 		% Numéros en gras listes
	\setlist[enumerate,3]{label=\bfseries\roman*} 		% Numéros en gras listes
	\setlist[itemize,1]{label=$\blacktriangleright$,leftmargin=*} 		% Listes de puces
	\setlist[itemize,2]{label=$\vartriangleright$} 		% Listes de puces
	
	
\RequirePackage{fontawesome5}		% Petits logos originaux
\RequirePackage{listings}		% Codes informatiques

\RequirePackage{xsim}		% Environnements d'exercices, textes à trous ...
\RequirePackage{tasks}		% QCM
	%\RenewTasksEnvironment[label=\bfseries\arabic*)]{tasks} % Plusieurs items sur la même ligne
	\RenewTasksEnvironment[label=$\square$]{tasks} % Petits carrés pour qcm


% --------------------------------------------------------------------------------------------------------------------------- %
% --------------------------------------------------------------------------------------------------------------------------- %
% -----------------------------  Style des sections et tableaux

\RequirePackage{titlesec}
	\renewcommand{\thesection}{\arabic{section}}
	\renewcommand{\thesubsection}{\arabic{section}.\arabic{subsection}}
	\renewcommand{\thesubsubsection}{\roman{subsubsection}}

	
%\setlength{\arrayrulewidth}{0.3mm}
\setlength{\tabcolsep}{10pt}
%\renewcommand{\arraystretch}{1.5}

% --------------------------------------------------------------------------------------------------------------------------- %
% --------------------------------------------------------------------------------------------------------------------------- %
% -----------------------------  Polices par défaut

\setmainfont{Times New Roman}
\RequirePackage[warnings-off={mathtools-colon,mathtools-overbracket}]{unicode-math}
\setmathfont{Asana-Math.otf}
%\RequirePackage{setspace}		% Interligne
%\setstretch{1.5}

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
% ------------------------------------------------- EN TÊTE ------------------------------------------------------------ %
% --------------------------------------------------------------------------------------------------------------------------- %

% ----------------------------- Clés à remplir dans le préambule pour en-têtes et pieds de page

\newcommand{\classe}[1]{%
\def\theclasse{#1}}
\newcommand{\numero}[1]{%
\def\thenumero{#1}}
\newcommand{\duree}[1]{%
\def\theduree{#1}}

\newcommand{\calc}{%
\def\thecalc{\faCheck}}
\newcommand{\nocalc}{%
\def\thecalc{\faMinusCircle}}

\pagestyle{fancy}
\fancyhead[L]{}
\fancyhead[R]{}

\fancyfoot[L]{\textcolor{lightgray}{\thedate}}
\fancyfoot[C]{\colorbox{lightgray}{\textcolor{white}{\textbf{\thepage\ / \pageref*{LastPage}}}}}
\fancyfoot[R]{\textcolor{lightgray}{\faArrowCircleRight\ \href{https://romaincessac.github.io/maths/}{$https{:}//romaincessac.github.io/maths/$}}}

\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}

\renewcommand{\maketitle}
{
\renewcommand{\leq}{\ensuremath{\leqslant}} 	% Typographie française pour les inégalités //// doit être exécuté APRES le \begin{document}
\renewcommand{\geq}{\ensuremath{\geqslant}}
\renewcommand{\nleq}{\ensuremath{\nleqslant}}
\renewcommand{\ngeq}{\ensuremath{\ngeqslant}}
%
\begin{multicols}{2}
\textcolor{lightgray}{Classe:} \theclasse

\textcolor{lightgray}{Calculatrice:} \thecalc

\textcolor{lightgray}{Durée:} \theduree
\begin{center}
	\Huge{\textbf{\thetitre n°\thenumero}}
\end{center}
\end{multicols}
\vspace{0.2cm}
	{\color{lightgray}\hrule height 4pt}

\vspace{0.2cm}
}


% --------------------------------------------------------------------------------------------------------------------------- %
% -------------------------------------------------  OPTION ----------------------------------------------------------- %
% -----------------------------  Couleurs

% Sans option 
\definecolor{couleurA}{HTML}{EF6303}	%orange
\definecolor{couleurB}{HTML}{444549} 	%gris foncé
\definecolor{couleurC}{HTML}{f00020} 	%rouge
\definecolor{couleurD}{rgb}{0,0.6,0.4}	%vert
\definecolor{couleurE}{HTML}{042B74} 	%bleu foncé

% Avec l'option « impression »
\DeclareOption{impression}
{
	\definecolor{couleurA}{rgb}{0,0,0}
	\definecolor{couleurB}{HTML}{444549}
	\definecolor{couleurC}{rgb}{0,0,0} 
	\definecolor{couleurD}{rgb}{0,0,0}
	\definecolor{couleurE}{rgb}{0,0,0}
}
\ProcessOptions


% --------------------------- Type de document

\DeclareOption{ds}
{
\def\thetitre{Devoir surveillé }
}
\ProcessOptions

\DeclareOption{dm}
{
\def\thetitre{Devoir maison }
}
\ProcessOptions

\DeclareOption{test}
{
\def\thetitre{Test }
}
\ProcessOptions

% --------------------------------------------------------------------------------------------------------------------------- %
% --------------------------------------------------------------------------------------------------------------------------- %
% ----------------------------- Environnements

\tcbuselibrary{theorems}		% Théorèmes depuis tcolorbox et charge amsmath	

% Attention
\newtcbtheorem[no counter]{attention1}{\faExclamationTriangle \ \ Attention}{%
	lower separated=false,
	breakable,
	colback=couleurA!10,
	colframe=white,
	fonttitle=\bfseries,
	coltitle=couleurA,
	colbacktitle=white,
	enhanced jigsaw,
	attach boxed title to top left={xshift=2mm,yshift=0mm}, 
	boxed title style={sharp corners},
	sharp corners,
	separator sign={ \ |\ }
}{attention1}
\newenvironment{attention}[1][]{\begin{attention1}{#1}{}}{\end{attention1}}

% Contexte ------------- Dépend du contexte
\newtcbtheorem[no counter]{contexte1}{\faHistory \ }{%
	lower separated=false,
	breakable,
	colback=couleurA!10,
	colframe=white,
	fonttitle=\bfseries,
	coltitle=couleurA,
	colbacktitle=white,
	enhanced jigsaw,
	attach boxed title to top left={xshift=2mm,yshift=0mm}, 
	boxed title style={sharp corners},
	sharp corners,
	separator sign={ }
}{attention1}
\newenvironment{contexte}[1][]{\begin{contexte1}{#1}{}}{\end{contexte1}}

% Exercice numéroté
\newtcbtheorem{exercice2}{Exercice}{%
	lower separated=true,
	breakable=true,
	colback=white,
	beamer,
	colframe=white,
	fonttitle=\bfseries,
	colbacktitle=black,
	coltitle=white,
	enhanced jigsaw,
	attach boxed title to top left={xshift=2mm,yshift=0mm}, 
	boxed title style={sharp corners},
	sharp corners,
	frame empty,
	separator sign={ \ |\ }
}{exercice2}
\newenvironment{exercice}[1][]{\begin{exercice2}{#1}{}}{\end{exercice2}}

% Correction
\newtcbtheorem[no counter]{correct1}{Correction}{%
	lower separated=true,
	breakable=true,
	colback=white,
	colframe=white,
	fonttitle=\bfseries,
	colbacktitle=couleurD,
	coltitle=white,
	enhanced jigsaw,
	attach boxed title to top left={xshift=2mm,yshift=0mm}, 
	boxed title style={sharp corners},
	sharp corners,
	colupper=couleurD,
	fontupper=\small,
	frame empty,
	separator sign={ \ |\ }
}{correct1}
\newenvironment{correction}[1][]{\begin{correct1}{#1}{}}{\end{correct1}}

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

\lstdefinestyle{pythonRCnumbers}{%
  	language=Python,
  	breaklines=true,
  	basicstyle   = \footnotesize\ttfamily,
  	keywordstyle =    \bfseries\color{colRCcapy},
  	keywordstyle = [2]\color{orange},
  	commentstyle =    \color{gray}\itshape,
  	stringstyle  =    \color{red},
  	frame = leftline,
  	numbers=left,
  	xleftmargin=15pt,
  	xrightmargin=0pt,
  	framesep= 5pt,
  	framerule=0pt,
  	aboveskip=4pt,                  
  	tabsize=3,
}
\lstnewenvironment{python} % Avec numérotation des lignes
  {\lstset{style=pythonRCnumbers}}
  {}
 
% Environnement pseudo-code, langage naturel...
\lstdefinelanguage{PseudoCode}{keywords={},comment=[l]{}}
\lstdefinestyle{algoRC}{%
  language=PseudoCode,
  breaklines=true,
  basicstyle   = \scriptsize\ttfamily,
  keywordstyle =    \bfseries\color{black},
  commentstyle =    \color{gray}\itshape,
  literate={=}{$\leftarrow{}$}{1} {==}{$={}$}{1},
  frame = leftline,
  xleftmargin=15pt,
  xrightmargin=0pt,
  framesep= 5pt,
  framerule=0pt,
  aboveskip=4pt,                  
  tabsize=3,
  rulecolor=\color{black},
  morekeywords={POUR, ALLANT, DE, À, SI, SINON, SINONSI, ALORS, TANT, QUE,FINPOUR,FINSI,FINTANTQUE,FIN,DÉBUT, DÉFINIR,VARIABLES,VARIABLE,LIRE,AFFICHER,ÉCRIRE,AFFECTER,FAIRE,SAISIR}
}

\lstnewenvironment{algorithme}
  {\lstset{style=algoRC}}
  {}
  