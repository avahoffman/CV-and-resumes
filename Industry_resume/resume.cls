\ProvidesClass{resume}
\LoadClass[fontsize=10pt]{scrlttr2}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	PACKAGES AND PREAMBLE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Add symbols for social media
\usepackage{fontawesome}
%% Select font
%% See https://www.tug.org/FontCatalogue/sansseriffonts.html for more options and usage of sans-serif fonts
\usepackage[familydefault,light]{Chivo} %% Option 'familydefault' only if the base font of the document is to be sans serif
\usepackage{helvet}
\usepackage[T1]{fontenc}
% Set margins for paper
\usepackage[letterpaper, margin=0.2in]{geometry}
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
	\begin{tabular}{c}
		\hspace{-0.4cm}
		{\includegraphics[width=\logosize, height=\logosize]{#6}} 
		\hspace{\logopad}
	\end{tabular}
        & 
         \hspace{\logopadeducation}
         \begin{tabular}{ll}
                \small\textbf{#1 $\cdot$ #2 $\cdot$ #3} \vspace{-0.2cm} \\
                \scriptsize\textcolor{darkgray}{#4 $\cdot$ #5} \\
         \end{tabular}  \\
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
                \small\textbf{#1} \\
                \small\textbf{#2} \vspace{-0.1cm} \\
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

\newcommand\toolboxitem[2]{%
    \tikz[baseline]{%
        \node[anchor=base, 
                    text=white, 
                    fill=#1, 
                    text depth=.5mm, 
                    below=1mm, % space underneath skill boxes
                    rounded corners=0.1cm] 
        {#2};
    }
}

\newcommand{\achievementitem}[4]{
	\begin{tabular}{c}
		\hspace{-0.7cm}
		#4 
		\hspace{\logopad}
	\end{tabular}
        & 
        \hspace{\logopadachievements}
         \begin{tabular}{ll}
                \small\textbf{#1} \vspace{-0.2cm} \\
                \scriptsize\textcolor{darkgray}{#2 $\cdot$ #3} \\
         \end{tabular} \vspace{0.1cm} \\
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
    \newcommand\educationfloat{
                \Large\textcolor{header}{\underline{EDUCATION}} \\
                \vspace{0.2cm}
                {
                \begin{tabularx}{\educationboxsize}{lX}
			#1
                \end{tabularx}
                }
    }
}

%----------------------------------------------------------------------------------------
%	 TOOLBOX
%----------------------------------------------------------------------------------------
\newcommand\addtoolbox[1]{
    \newcommand\toolboxfloat{
        \begin{tabularx}{\educationboxsize}{X}
         \Large\textcolor{header}{\underline{TOOLS \& PACKAGES}} \\
         \vspace{-6mm}
		#1
        \end{tabularx} 
    }
}

%----------------------------------------------------------------------------------------
%	 TECHNIQUES
%----------------------------------------------------------------------------------------
\newcommand\addtechniques[1]{
    \newcommand\techniquesfloat{
        \begin{tabularx}{\educationboxsize}{X} 
         \Large\textcolor{header}{\underline{TECHNIQUES}} \\
         \vspace{-6mm}
		#1
        \end{tabularx} 
    }
}

%----------------------------------------------------------------------------------------
%	 ACHIEVEMENTS
%----------------------------------------------------------------------------------------
\newcommand\addachievements[1]{
    \newcommand\achievementsfloat{
        \Large\textcolor{header}{\underline{ACHIEVEMENTS}} \\
        \vspace{0.2cm}
        {
        \begin{tabularx}{\educationboxsize}{lX}
		#1
        \end{tabularx}
        } 
    }
}

%----------------------------------------------------------------------------------------
%	 EXPERIENCE
%----------------------------------------------------------------------------------------
% This one works a little differently since it incorporates all the previous sections into it
\newcommand\addexperience[1]{
    \begin{tabularx}{\textwidth}{p{\experienceboxsize}p{\dividerwidth}X}
        
            \Large\textcolor{header}{\underline{EXPERIENCE}} &  &\multirow[t]{2}{=}{
                    \educationfloat \\
                    \vspace{8mm}
                    \toolboxfloat \\
                    \vspace{8mm}
                    \techniquesfloat \\
                    \vspace{8mm}
                    \achievementsfloat \\
            } \\
           
    		#1
            
        \end{tabularx}
}