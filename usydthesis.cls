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

% Options
\DeclareOption{titlecap}{\let\@titlecap\iftrue}
\ProcessOptions

% Load the original template, which is report for thesis
\LoadClass[10pt]{report}

% Options for the thesis
\newcommand*{\statement}[1]{\gdef\@statement{#1} }
\newcommand*{\school}[1]{\gdef\@school{#1} }
\newcommand*{\faculty}[1]{\gdef\@faculty{#1} }
\newcommand*{\dedication}[1]{\gdef\@dedication{#1} }

% Standard packages
\RequirePackage[a4paper]{geometry}
\RequirePackage{graphicx}
\RequirePackage[table]{xcolor}
\RequirePackage{datetime}
\RequirePackage{appendix}
\usepackage[colorlinks=true,breaklinks=true]{hyperref}
\RequirePackage{url}
\RequirePackage{datetime}
\RequirePackage{afterpage}

% Tables
\RequirePackage{tabularx}
\RequirePackage{booktabs}
\RequirePackage{multirow}

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


% USYD Title Page
\renewcommand*{\maketitle}{%
    \thispagestyle{empty}
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
