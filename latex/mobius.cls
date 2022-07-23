% <------------------------------ Classe Möbius ------------- Version 1 ------------------------------------->%
% <------------------------------- Romain CESSAC ------------- Juillet 2022 ------------------------------------->%

% --------------------------------------------------------------------------------------------------------------------------- %
% --------------------------------------------------------------------------------------------------------------------------- %
% -----------------------------  Création de la classe et méthode de compilation

% -------------------   Veillez à placer ce fichier dans le répertoire de compilation de votre document

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{mobius}[23/07/2022, v1.0]
\LoadClass[twocolumn]{article}

% -----------------------------  Compilation XeLaTeX OBLIGATOIRE ------------------------------------------ %
\RequirePackage[no-math]{fontspec}

% --------------------------------------------------------------------------------------------------------------------------- %
% --------------------------------------------------------------------------------------------------------------------------- %
% -----------------------------  Packages 

\RequirePackage[11pt]{extsizes}	%Tailles de police inhabituelles à charger avant geometry

% ------------------- Option 14pt ignorer l'erreur à la compilation avec s
\DeclareOption{14pt}
{
\usepackage[14pt]{extsizes}	%Tailles de police inhabituelles à charger avant geometry
}
\ProcessOptions

\RequirePackage{anyfontsize}
\setlength{\columnsep}{24pt}		% Espace entre les deux sous-pages
\RequirePackage[a4paper,left=1.3cm,right=0.8cm,top=0.9cm,bottom=1.7cm,landscape]{geometry}	% marges
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
\RequirePackage{liseret}		% Liseret latéral sur toute la page !!!!! Non-présent TeXLive !!!!!!

%\RequirePackage{xsim}		% Environnements d'exercices, textes à trous ...
\RequirePackage{tasks}		% QCM
	\RenewTasksEnvironment[label=\bfseries\arabic*)]{tasks} % Plusieurs items sur la même ligne


% --------------------------------------------------------------------------------------------------------------------------- %
% --------------------------------------------------------------------------------------------------------------------------- %
% -----------------------------  Style des sections et tableaux

\RequirePackage{titlesec}
	\renewcommand{\thesection}{\arabic{section}}
	\renewcommand{\thesubsection}{\arabic{section}.\arabic{subsection}}
	\renewcommand{\thesubsubsection}{\roman{subsubsection}}

\titleformat % sections
{\section}
[block]
{\color{black}\normalsize\bfseries}
{\colorbox{black}{\textcolor{white}{\thesection}}}
{6pt}
{}
[{\color{black}\hrule height 1.5pt}\vspace{0\baselineskip}]

\titleformat % sous-sections
{\subsection}
[block]
{\hspace{25pt} \color{couleurB}\small\bfseries}
{\colorbox{couleurB}{\textcolor{white}{\thesubsection}}}
{5pt}
{}

\titleformat % sous-sous-sections
{\subsubsection}
[block]
{\hspace{60pt} \color{gray}\footnotesize\bfseries}
{\colorbox{gray}{\textcolor{white}{\thesubsubsection}}}
{4pt}
{}

	
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
% ------------------------------------------------- EN TÊTE ------------------------------------------------------------ %
% --------------------------------------------------------------------------------------------------------------------------- %

% ----------------------------- Clés à remplir dans le préambule pour en-têtes et pieds de page

\newcommand{\classe}[1]{%
\def\theclasse{#1}}
\newcommand{\chapitre}[1]{%
\def\thechapitre{#1}}
\newcommand{\titre}[1]{%
\def\thetitre{#1}}


\pagestyle{fancy}
\fancyhead[L]{}
\fancyhead[R]{}
\fancyfoot[L]{}
\fancyfoot[C]{\textcolor{lightgray}{\faArrowCircleRight\ \href{https://romaincessac.github.io/maths/}{$https{:}//romaincessac.github.io/maths/$}}}
\fancyfoot[R]{\colorbox{lightgray}{\textcolor{white}{\textbf{\thepage\ / \pageref*{LastPage}}}}}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}
\liseret[
position=left,
color=lightgray,
align=bottom,
sep=1pt]{\ \thedate \hfill \textbf{\thetitre} \hfill \theclasse\ }

\renewcommand{\maketitle}
{
\renewcommand{\leq}{\ensuremath{\leqslant}} 	% Typographie française pour les inégalités //// doit être exécuté APRES le \begin{document}
\renewcommand{\geq}{\ensuremath{\geqslant}}
\renewcommand{\nleq}{\ensuremath{\nleqslant}}
\renewcommand{\ngeq}{\ensuremath{\ngeqslant}}
%
\

\begin{center}
	{\colorbox{black}{\textcolor{white}{\Huge{\textbf{\thechapitre}}}}}
	
	\vspace{0.5cm}
	{\color{black}\huge{\textbf{\thetitre}}}
	
	\vspace{0.5cm}
	{\color{lightgray}\hrule height 4pt}
\end{center}

\vspace{0.3cm}
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

\DeclareOption{cours}
{
\newenvironment{exercice}[1][]{\begin{exercice1}{#1}{}}{\end{exercice1}}	% Choix de l'environnement exercice non-numéroté
}
\ProcessOptions

\DeclareOption{exo}
{
\chapitre{\huge Exercices}
\newenvironment{exercice}[1][]{\begin{exercice2}{#1}{}}{\end{exercice2}}	% Choix de l'environnement exercice numéroté
}
\ProcessOptions

\DeclareOption{act}
{
\chapitre{\huge Activité}
\newenvironment{exercice}[1][]{\begin{exercice2}{#1}{}}{\end{exercice2}}	% Choix de l'environnement exercice numéroté
}
\ProcessOptions
% --------------------------------------------------------------------------------------------------------------------------- %
% --------------------------------------------------------------------------------------------------------------------------- %
% ----------------------------- Environnements

\tcbuselibrary{theorems}		% Théorèmes depuis tcolorbox et charge amsmath	

% Résumé
\newtcbtheorem[no counter]{resume1}{\faCompass \ \ Résumé}{%
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
	sharp corners
}{resume1}
\newenvironment{resume}{\begin{resume1}{}{}}{\end{resume1}}

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

% Méthode
\newtcbtheorem[no counter]{methode1}{\faCogs\ \ Méthode}{%
	lower separated=false,
	breakable,
	colback=couleurE!8,
	colframe=white,
	fonttitle=\bfseries,
	coltitle=couleurE,
	colbacktitle=white,
	enhanced jigsaw,
	attach boxed title to top left={xshift=2mm,yshift=0mm}, 
	boxed title style={sharp corners},
	sharp corners,
	separator sign={ \ |\ }
}{attention1}
\newenvironment{methode}[1][]{\begin{methode1}{#1}{}}{\end{methode1}}

 % Algo Prog
\newtcbtheorem[no counter]{algo1}{\faCode\ \ Algorithmique \& Programmation}{%
	lower separated=false,
	breakable,
	colback=gray!10,
	colframe=white,
	fonttitle=\bfseries,
	coltitle=gray,
	colbacktitle=white,
	enhanced jigsaw,
	attach boxed title to top left={xshift=2mm,yshift=0mm}, 
	boxed title style={sharp corners},
	sharp corners,
	separator sign={ \ |\ }
}{algo1}
\newenvironment{algo}[1][]{
\begin{algo1}{#1}{}
}{
\end{algo1}
}

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


% Définition
\newtcbtheorem[no counter]{defn1}{Définition}{%
	lower separated=false,
	breakable,
	colback=couleurD!8,
	colframe=white,
	fonttitle=\bfseries,
	coltitle=white,
	colbacktitle=couleurD,
	enhanced jigsaw,
	attach boxed title to top left={xshift=2mm,yshift=-2mm}, 
	boxed title style={sharp corners},
	sharp corners,
	separator sign={ \ |\ }
}{defn1}
\newenvironment{definition}[1][]{\begin{defn1}{#1}{}}{\end{defn1}}

% Définitions
\newtcbtheorem[no counter]{defns1}{Définitions}{%
	lower separated=false,
	breakable,
	colback=couleurD!8,
	colframe=white,
	fonttitle=\bfseries,
	coltitle=white,
	colbacktitle=couleurD,
	enhanced jigsaw,
	attach boxed title to top left={xshift=2mm,yshift=-2mm}, 
	boxed title style={sharp corners},
	sharp corners,
	separator sign={ \ |\ }
}{defns1}
\newenvironment{definitions}[1][]{\begin{defns1}{#1}{}}{\end{defns1}}

% Théoreme
\newtcbtheorem[no counter]{theoreme1}{Théorème}{%
	lower separated=false,
	breakable,
	colback=couleurC!8,
	colframe=white,
	fonttitle=\bfseries,
	coltitle=white,
	colbacktitle=couleurC,
	enhanced jigsaw,
	attach boxed title to top left={xshift=2mm,yshift=-2mm}, 
	boxed title style={sharp corners},
	sharp corners,
	separator sign={\ \ |\ },
	frame empty,
}{theoreme1}
\newenvironment{theoreme}[1][]{\begin{theoreme1}{#1}{}}{\end{theoreme1}}

% Propriété
\newtcbtheorem[no counter]{prop1}{Propriété}{%
	lower separated=false,
	breakable,
	colback=couleurC!8,
	colframe=white,
	fonttitle=\bfseries,
	coltitle=white,
	colbacktitle=couleurC,
	enhanced jigsaw,
	attach boxed title to top left={xshift=2mm,yshift=-2mm}, 
	boxed title style={sharp corners},
	sharp corners,
	separator sign={ \ |\ }
}{prop1}
\newenvironment{propriete}[1][]{\begin{prop1}{#1}{}}{\end{prop1}}

% Propriétés
\newtcbtheorem[no counter]{props1}{Propriétés}{%
	lower separated=false,
	breakable,
	colback=couleurC!8,
	colframe=white,
	fonttitle=\bfseries,
	coltitle=white,
	colbacktitle=couleurC,
	enhanced jigsaw,
	attach boxed title to top left={xshift=2mm,yshift=-2mm}, 
	boxed title style={sharp corners},
	sharp corners,
	separator sign={ \ |\ }
}{props1}
\newenvironment{proprietes}[1][]{\begin{props1}{#1}{}}{\end{props1}}

% Lemme
\newtcbtheorem[no counter]{lemm1}{Lemme}{%
	lower separated=false,
	breakable,
	colback=couleurC!8,
	colframe=white,
	fonttitle=\bfseries,
	coltitle=white,
	colbacktitle=couleurC,
	enhanced jigsaw,
	attach boxed title to top left={xshift=2mm,yshift=-2mm}, 
	boxed title style={sharp corners},
	sharp corners,
	separator sign={ \ |\ }
}{lemm1}
\newenvironment{lemme}[1][]{\begin{lemm1}{#1}{}}{\end{lemm1}}

% Corollaire
\newtcbtheorem[no counter]{coro1}{Corollaire}{%
	lower separated=false,
	breakable,
	colback=couleurC!8,
	colframe=white,
	fonttitle=\bfseries,
	coltitle=white,
	colbacktitle=couleurC,
	enhanced jigsaw,
	attach boxed title to top left={xshift=2mm,yshift=-2mm}, 
	boxed title style={sharp corners},
	sharp corners,
	separator sign={ \ |\ }
}{coro1}
\newenvironment{corollaire}[1][]{\begin{coro1}{#1}{}}{\end{coro1}}

% Exemple(s)
\def\thmhead@plain#1#2#3{%
  \thmname{#1}\thmnumber{\@ifnotempty{#1}{ }\@upn{#2}}%
  \thmnote{ {\the\thm@notefont(#3)}}}


\newtheoremstyle{exp}% name of the style to be used
{}% measure of space to leave above the theorem. E.g.: 3pt
{}% measure of space to leave below the theorem. E.g.: 3pt
{\normalsize}% name of font to use in the body of the theorem
{}% measure of space to indent
{\color{couleurE}\bfseries}% name of head font
{\quad}% punctuation between head and body
{ }% space after theorem head; " " = normal interword space
{\thmname{#1} \thmnote{- #3}}
\theoremstyle{exp}
\newtheorem*{exemple}{Exemple}
\newtheorem*{exemples}{Exemples}

% Remarque(s)
\newtheoremstyle{rmq}% name of the style to be used
{}% measure of space to leave above the theorem. E.g.: 3pt
{}% measure of space to leave below the theorem. E.g.: 3pt
{\normalsize}% name of font to use in the body of the theorem
{}% measure of space to indent
{\color{couleurA}\bfseries}% name of head font
{\quad}% punctuation between head and body
{ }% space after theorem head; " " = normal interword space
{\thmname{#1} \thmnote{- #3}}
\theoremstyle{rmq}
\newtheorem*{remarque}{Remarque}
\newtheorem*{remarques}{Remarques}

% Démonstration
\newenvironment{demonstration}
{\begin{proof}
\small} 
{\end{proof}}


% Exercice non-numéroté
\newtcbtheorem[no counter]{exercice1}{Exercice}{%
	lower separated=true,
	breakable=true,
	colback=white,
	beamer,
	colframe=white,
	fonttitle=\bfseries,
	colbacktitle=black,
	coltitle=white,
	enhanced jigsaw,
	sharp corners,
	attach boxed title to top left={xshift=2mm,yshift=0mm}, 
	boxed title style={sharp corners},
	frame empty,
	separator sign={ \ |\ }
}{exercice1}

% Exercice numéroté
\newtcbtheorem{exercice2}{Exercice}{%
	lower separated=false,
	breakable,
	colback=couleurB!8,
	colframe=white,
	fonttitle=\bfseries,
	coltitle=white,
	colbacktitle=couleurB,
	enhanced jigsaw,
	attach boxed title to top left={xshift=2mm,yshift=-2mm}, 
	boxed title style={sharp corners},
	sharp corners,
	separator sign={ \ |\ }
}{exercice2}

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

