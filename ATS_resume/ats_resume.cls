\ProvidesClass{resume}
\LoadClass[fontsize=11pt]{scrlttr2}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	PACKAGES AND PREAMBLE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Add symbols for social media
\usepackage{fontawesome}
%% Select font
%% See https://www.tug.org/FontCatalogue/sansseriffonts.html for more options and usage of sans-serif fonts
%\usepackage[familydefault,light]{Chivo} %% Option 'familydefault' only if the base font of the document is to be sans serif
\usepackage[sfdefault]{arimo}
\usepackage[T1]{fontenc}
% Set margins for paper
\usepackage[letterpaper, margin=0.2in]{geometry}
% allow different page geometries
\usepackage{afterpage}
% Force page width tables that wrap text
\usepackage{tabularx}
% Allow alignment of bullet points left
\usepackage{enumitem}
% Add background graphic (if desired) and little boxes for skills
\usepackage{tikz}
% Allow and define colors to be used
\RequirePackage{xcolor}
\definecolor{special}{HTML}{1b941b}
\definecolor{header}{HTML}{1b941b}
\definecolor{specialdark}{HTML}{0c410c}
\definecolor{darkgray}{HTML}{333333}
\definecolor{midgray}{HTML}{666666}
\definecolor{lightgray}{HTML}{999999}
% Allow hyperlinks
\RequirePackage[hidelinks]{hyperref}
% Allow logos/images
\usepackage{graphicx}
\graphicspath{ {./logos/} }
% Graphic text box
\usepackage{tcolorbox}
% Allow better alignment of text boxes within tabular env
\usepackage{multirow}
% Cheeky Footer packages
\usepackage[absolute]{textpos}
\usepackage{calc}
\usepackage{metalogo}
\textblockorigin{1cm}{\paperheight-1cm}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	USER DEFINED FUNCTIONS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Logo size, and how much to pad
\newcommand{\logosize}{0.6cm}
\newcommand{\logopad}{-0.5cm}
\newcommand{\logopadeducation}{-0.3cm}
\newcommand{\logopadachievements}{-0.4cm}
\newcommand{\logopadexperience}{-0.2cm}
\newcommand{\colordot}{\textcolor{special}{$\cdot$} }

\newlength\bulletpad
\settowidth\bulletpad{\textbullet}
\addtolength\bulletpad{-3mm}

\newcommand{\educationitem}[6]{
\vspace{0.1cm}
    {\begin{tabularx}{\experienceboxsize}{lX}
    	\begin{tabular}{c}
		\hspace{\logopad}
		{\includegraphics[width=\logosize, height=\logosize]{#6}}
		\hspace{\logopad}
	\end{tabular}
        &
        \hspace{\logopadeducation}
         {\begin{tabularx}{\experienceboxsize}{X}
                \small\textbf{#1} $\cdot$ \small\textbf{#2} \vspace{-0.1cm} \\
                \scriptsize\textcolor{darkgray}{#3 $\cdot$ #4} \\
         \end{tabularx} }
    \end{tabularx}}
}

\newcommand{\experienceitem}[6]{
\vspace{0.1cm}
    {\begin{tabularx}{\experienceboxsize}{lX}
    	\begin{tabular}{c}
		\hspace{\logopad}
		{\includegraphics[width=\logosize, height=\logosize]{#6}}
		\hspace{\logopad}
	\end{tabular}
        &
        \hspace{\logopadexperience}
         {\begin{tabularx}{\experienceboxsize}{X}
                \small\textbf{#1} $\cdot$ \small\textbf{#2} \vspace{-0.1cm} \\
                \scriptsize\textcolor{darkgray}{#3 $\cdot$ #4} \\
         \end{tabularx} }
    \end{tabularx}}

    % Bullet points
    \vspace{-5mm}
    \noindent\begin{itemize}[leftmargin=*,labelsep=-\bulletpad]
    \footnotesize
    \itemsep0.6mm
	#5
    \end{itemize}
}

\newcommand{\technicalskillitem}[2]{
\vspace{0.001cm}
    % Bullet points
    \noindent
    \footnotesize
	\textbf{#1} $\cdot$ {#2}
}

\newcommand{\achievementitem}[4]{
\vspace{0.1cm}
    {\begin{tabularx}{\experienceboxsize}{lX}
    	\begin{tabular}{c}
		\hspace{\logopad}
		#4
		\hspace{-0.3cm}
	\end{tabular}
        &
        \hspace{\logopadachievements}
         {\begin{tabularx}{\experienceboxsize}{X}
                \small\textbf{#1} \vspace{-0.1cm} \\
                \scriptsize\textcolor{darkgray}{#2 $\cdot$ #3} \\
         \end{tabularx} }
    \end{tabularx}}
}

%----------------------------------------------------------------------------------------
%	 PERSONAL INFORMATION
%----------------------------------------------------------------------------------------
% custom functions to be more user friendly
\newcommand{\name}[1]{\renewcommand{\name}{\textcolor{special}{#1}}}
\newcommand{\jobtitle}[1]{\renewcommand{\jobtitle}{#1}}
\newcommand{\email}[1]{\renewcommand{\email}{#1}}
\newcommand{\phone}[1]{\renewcommand{\phone}{#1}}
\newcommand{\linkedin}[1]{\renewcommand{\linkedin}{#1}}
\newcommand{\github}[1]{\renewcommand{\github}{#1}}
\newcommand{\website}[1]{\renewcommand{\website}{#1}}

\newcommand{\printheader}{
\begin{tabularx}{\textwidth}{Xr}
    \begin{tabular}{l}
        \Huge \name \\
        \large \textcolor{darkgray}{\jobtitle} \\
    \end{tabular}
    &
    \begin{tabular}{rc}
        \footnotesize \href{mailto:\email}{\email} & {\faEnvelopeO} \\
        \footnotesize \phone & {\faMobile} \\
        \footnotesize \href{https://www.linkedin.com\linkedin}{\linkedin} & {\faLinkedin} \\
        \footnotesize \href{https://www.github.com/\github}{\github} & {\faGithub} \\
        \footnotesize \href{http://\website}{\website} & {\faGlobe} \\
    \end{tabular}
\end{tabularx}
}

%----------------------------------------------------------------------------------------
%	 EDUCATION
%----------------------------------------------------------------------------------------
\newcommand\addeducation[1]{
    \begin{tabularx}{\textwidth}{p{\experienceboxsize}}
    \pgtwoheader % header for page two is scrunched without this
            \Large\textcolor{header}{EDUCATION} \\
    		#1
        \end{tabularx}
}

%----------------------------------------------------------------------------------------
%	 TECH SKILLS
%----------------------------------------------------------------------------------------
\newcommand\addtechnicalskills[1]{
        \begin{tabularx}{\experienceboxsize}{X}
         \Large\textcolor{header}{TECHNICAL SKILLS} \\
		#1
        \end{tabularx}
}

%----------------------------------------------------------------------------------------
%	 ACHIEVEMENTS
%----------------------------------------------------------------------------------------
\newcommand\addachievements[1]{
    \begin{tabularx}{\textwidth}{p{\experienceboxsize}}
            \Large\textcolor{header}{ACHIEVEMENTS} \\
    		#1
        \end{tabularx}
}

%----------------------------------------------------------------------------------------
%	 EXPERIENCE
%----------------------------------------------------------------------------------------
\newcommand\addexperience[1]{
    \begin{tabularx}{\textwidth}{p{\experienceboxsize}}
            \Large\textcolor{header}{EXPERIENCE} \\
    		#1
        \end{tabularx}
}

%----------------------------------------------------------------------------------------
%	 Cheeky Footer
%----------------------------------------------------------------------------------------
% Because I can't help myself
\newcommand\cheekyfooter[1]{

    \begin{textblock*}{\paperwidth-1cm}(0mm,0mm)
    	\begin{center}
       \scriptsize
       #1
       	\end{center}
    \end{textblock*}
  
}