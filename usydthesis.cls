% Sydney University Thesis Template
% Author: Christopher Natoli
%
% This package provides the style and functionality for the PhD Thesis under
% appropriate policies for 2020.
% Please note, there are changes (such as Logo, required headings) that may
% have changed, and so must be altered.
%
% This is free software: you can redistribute it and/or modify it under the
% terms of the GNU Lesser General Public License as published by the Free
% Software Foundation, either version 3 of the License, or (at your option) any
% later version.
%
% The style is distributed in the hope that it will be useful, but WITHOUT ANY
% WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
% A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more
% details.
%
% You should have received a copy of the GNU Lesser General Public License
% along with this file. If not, see <http://www.gnu.org/licenses/>.

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{usydthesis}[The University of Sydney Thesis Template]

% ------------ Documentclass options [things in squares] -------------- %

% titlecap: use if you want capitalized title on your page.
\DeclareOption{titlecap}{\let\@titlecap\iftrue}

% ispdf: if you're looking for digital submission, it's a pdf - else
%        the margins are set for printing.
\DeclareOption{ispdf}{\let\@ispdf\iftrue}

\ProcessOptions

% ---------------- Original template and definitions ------------------ %

% Load the original template, which is report for thesis
\LoadClass[10pt]{book}

% Options for the thesis
\newcommand*{\statement}[1]{\gdef\@statement{#1} }
\newcommand*{\school}[1]{\gdef\@school{#1} }
\newcommand*{\faculty}[1]{\gdef\@faculty{#1} }
\newcommand*{\dedication}[1]{\gdef\@dedication{#1} }

% ------------------- Standard Packages to Use ----------------------- %

% Check if it's for a pdf (digital) - don't have binding offsets
\ifx\@ispdf\undefined
    \RequirePackage[a4paper]{geometry}
\else
    \RequirePackage[a4paper, twoside]{geometry}
    \geometry{bindingoffset=1.25cm}
\fi


\RequirePackage{graphicx}
\RequirePackage[table]{xcolor}
\RequirePackage{datetime}
\RequirePackage{appendix}
\RequirePackage{hyperref}

\hypersetup{
    colorlinks=true, %set true if you want colored links
    linktoc=all,     %set to all if you want both sections and subsections linked
    %linktocpage=true, % uncomment if you want just the page number linked
    breaklinks=true
}

\RequirePackage{url}
\RequirePackage{datetime}
\RequirePackage{afterpage}
\RequirePackage{fancyhdr}

% Tables
\RequirePackage{tabularx}
\RequirePackage{booktabs}
\RequirePackage{multirow}


% -------------------------- Definitions --------------------------- %

% New ``Blank Page''
\newcommand\blankpage{%
    \null
    \thispagestyle{empty}%
    \newpage}


% Small definitions
\ifx\@titlecap\undefined
\else
    % Require the bold extra if titlecap is added
    \RequirePackage{bold-extra}
\fi

% Table of contents, etc - add empty page style
\AtBeginDocument{\addtocontents{toc}{\protect\thispagestyle{empty}}}


% ------------------------ Header and Footer ----------------------- %

% Headers and footers
\fancypagestyle{fancybook}{%
    \fancyhf{}% Reset the headers and the footers
    \cfoot{}

    \renewcommand*{\chaptermark}[1]{ \markboth{\chaptername\ \thechapter: ##1}{} }%
    \renewcommand*{\sectionmark}[1]{ \markright{\thesection\ ##1} }%

    \fancyhead[RO,LE]{\bf \thepage}
    \fancyhead[RE]{\leftmark}
    \fancyhead[LO]{\rightmark}

    % \renewcommand*{\sectionmark}[1]{ \markright{\thesection\ ##1} }%
    % \renewcommand*{\chaptermark}[1]{ \markboth{\chaptername\ \thechapter: ##1}{} }%

    % Increase the length of the header such that the folios
    % (typography jargon for page numbers) move into the margin
    % Put some space and a vertical bar between the folio and the rest of the header
    % \fancyhead[LE]{\thepage\hskip3mm\vrule\hskip3mm\leftmark}%
    % \fancyhead[RO]{\rightmark\hskip3mm\vrule\hskip3mm\thepage}%
    \cfoot{}
}


% USYD Title Page
\renewcommand*{\maketitle}{%
    \thispagestyle{empty}
    \pagenumbering{gobble}
    \begin{center}
        {\huge\bfseries\boldmath
        \ifx\@titlecap\undefined
        \else
            \scshape
        \fi
        \@title}\\
        \vspace{0.3\textheight}
        {\Large\bfseries
        \@author
        }\\
        \vspace{0.3\textheight}
        {\itshape\large
            \ifx\@statement\undefined
            A thesis submitted to fulfil requirements for the degree of\\\vspace*{0.2cm} Doctor of Philosophy
            \else
                \@statement
            \fi
        }\\
        \vspace{\fill}
        {
            \@school\\\vspace{0.3cm}
            \@faculty\\\vspace{0.3cm}
            The University of Sydney
        }\\
        \vspace{\fill}
        {\large
            \monthname\ \the\year
        }
    \end{center}
    \newpage
    \pagenumbering{roman}
}

\newcommand*{\makededication}{%
    \ifx\@dedication\undefined
    \else
        \thispagestyle{empty}
        \newpage
        \hspace{0pt}
        \vfill
        \begin{center}
        \itshape
        \@dedication
        \end{center}
        \vfill
        \hspace{0pt}
    \fi
    \blankpage
}
