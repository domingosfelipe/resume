\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{domingosfelipe-resume}[v0.1]  

\LoadClass{article} 

\RequirePackage[a4paper, margin=2.2cm]{geometry}  
\RequirePackage[utf8]{inputenc}  
\RequirePackage[brazil]{babel}
\RequirePackage[T1]{fontenc}  
\RequirePackage{lmodern}
\RequirePackage[parfill]{parskip}  
\RequirePackage{array}  
\RequirePackage{ifthen}  
\RequirePackage{ragged2e}  
\RequirePackage{hyperref}
\RequirePackage{url}  
\RequirePackage{microtype}
\RequirePackage{textcomp}
\RequirePackage{enumitem}
\RequirePackage{needspace} 

\hypersetup{  
  pdfauthor={Felipe Domingos},  
  pdftitle={Curriculum Vitae-Felipe Domingos},  
  pdfsubject={Curriculum Vitae-Felipe Domingos},  
  pdfkeywords={CV,Curriculum Vitae,Felipe Domingos,Curriculum Felipe Domingos,CV Felipe Domingos},  
  pdfstartpage={1},  
  colorlinks=true, linkcolor=blue, urlcolor=blue  
}

\author{Felipe Domingos}

\pagestyle{empty} 

\renewcommand{\familydefault}{\rmdefault}
\normalfont
  
\def \name #1{\def\@name{#1}}
\def \@name {}

\let \@website \relax  
\let \@email \relax  
\let \@phonenumber \relax

\def \address #1 {  
    \@ifundefined{@website}{  
        \def \@website {#1}  
    }{  
        \@ifundefined{@email}{  
            \def \@email {#1}  
        }{
            \def \@phonenumber {#1}
        }  
    }  
}  

\def \PrintCommunicationData {
  \begingroup
    \small
    \renewcommand{\UrlFont}{\small\ttfamily}
    \centering
    \textbullet~ \@website
    \nolinebreak \hspace{1.5em plus 0.5em minus 0.5em} \textbullet~ \@email
    \nolinebreak \hspace{1.5em plus 0.5em minus 0.5em} \textbullet~ \@phonenumber
    \par
  \endgroup
  \smallskip
}
  
\def \PrintName {  
  \begingroup  
    \hfil{\MakeUppercase{\huge\bf \@name}}\hfil
    \bigskip
    \break
  \endgroup 
}
    
\newcommand{\resume}[2]{  
  \medskip
  \MakeUppercase{\bf #1}  
  \medskip  
  \hrule  
  \medskip 
  \parbox{\textwidth}{#2}
  \smallskip
}  
  
\newenvironment{rSection}[1]{  
  \begin{samepage}  
    \medskip  
    \MakeUppercase{\bf #1}  
    \medskip  
    \hrule  
    \medskip  
    \begin{list}{}{\setlength{\leftmargin}{1.5em}}  
    \item[]
}{
    \end{list} 
    \end{samepage}
    \vspace{\baselineskip}
}  

\newenvironment{rExperienceSubsection}[4]{
  \begin{samepage}
    \needspace{2\baselineskip}
    \textbf{#1} --- \textbf{#2} \hfill \textbf{#3} -- \textbf{#4}
    \vspace{0.3em}
    \begin{itemize}[label=\textbullet,leftmargin=1em,itemsep=0.2em,topsep=0pt]
}{
    \end{itemize}
    \end{samepage}
    \vspace{\baselineskip}
}

\newenvironment{rEducationSubsection}[2]{  
  \begin{samepage}  
    \needspace{2\baselineskip}  
    \textbf{#1} \hfill \textbf{#2}
    \begin{itemize}[label=\textbullet,leftmargin=1em,itemsep=0.2em,topsep=0pt]
}{
    \end{itemize}
    \vspace{\baselineskip}
    \end{samepage}
}

\newenvironment{rSkillsSubsection}{
  \begin{samepage}
    \needspace{\baselineskip}
    \begin{itemize}[label=\textbullet,leftmargin=1em,itemsep=0.2em,topsep=0pt]
}{
  \end{itemize} 
  \vspace{\baselineskip} 
  \end{samepage}
}

\AtBeginDocument{ 
    \PrintName \PrintCommunicationData 
}

\endinput