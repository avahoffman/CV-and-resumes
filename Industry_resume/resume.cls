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
\usepackage[T1]{fontenc}
% Set margins for paper
\usepackage[letterpaper, margin=0.2in]{geometry}
% Force page width tables that wrap text
\usepackage{tabularx}
% Add background graphic (if desired) and little boxes for skills
\usepackage{tikz}
% Allow and define colors to be used
\RequirePackage{xcolor}
\definecolor{special}{HTML}{1b941b} 
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

\newcommand{\educationitem}[6]{
	\begin{tabular}{c}
		\hspace{-0.4cm}
		{\includegraphics[width=\logosize, height=\logosize]{#6}} 
		\hspace{\logopad}
	\end{tabular}
        & 
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
         {\begin{tabularx}{\experienceboxsize}{X}
                \small\textbf{#1} \\
                \small\textbf{#2} \vspace{-0.1cm} \\
                \scriptsize\textcolor{darkgray}{#3 $\cdot$ #4} \\
         \end{tabularx} }
    \end{tabularx}} 
    
    % Bullet points
    \vspace{-0.2cm}
    \begin{itemize}
    \small
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
                \Large\underline{EDUCATION} \\
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
         \Large\underline{TOOLS \& PACKAGES} \\
         \vspace{-0.4cm}
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
         \Large\underline{TECHNIQUES} \\
         \vspace{-0.4cm}
		#1
        \end{tabularx} 
    }
}

%----------------------------------------------------------------------------------------
%	 ACHIEVEMENTS
%----------------------------------------------------------------------------------------
\newcommand\addachievements[1]{
    \newcommand\achievementsfloat{
        \Large\underline{ACHIEVEMENTS} \\
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
        
            \Large\underline{EXPERIENCE} &  &\multirow[t]{2}{=}{
                    \educationfloat \\
                    \vspace{1cm}
                    \toolboxfloat \\
                    \vspace{0.5cm}
                    \techniquesfloat \\
                    \vspace{1.2cm}
                    \achievementsfloat \\
            } \\
           
    		#1
            
        \end{tabularx}
}