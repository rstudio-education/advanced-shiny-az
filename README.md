# advanced-shiny-az

## Overview

Shiny is the leading R package for developing interactive web apps. These give your clients, users, or students the power and sophistication of R with a friendly, no-code interface custom designed to your purpose. This workshop will begin with an overview of interactivity options in R (R Markdown documents with Shiny components, parameterized reports, and dashboards), will explore features of reactive programming, building complex apps with modules, and will wrap up with a session on troubleshooting Shiny apps.

### Audience

This course is designed for advanced R users who already have some experience with Shiny but want to level up their Shiny skills.
If you need a Shiny refresher ahead of the course, we suggest taking this R Studio tutorial: https://shiny.rstudio.com/tutorial.

### Learning objectives

During this course you will learn about: 

-	Spectrum of reproducible dynamic reporting from R Markdown to Shiny
-	Building functional and visually appealing user interfaces
-	Reactive programming: theory and application
-	Leveraging Shiny modules as your app grows
-	Troubleshooting your Shiny app

After this course you should be able to:

- Create and deploy a Shiny app from scratch
- Enhance a complex Shiny app by breaking it into modules
- Employ a principled approach to debugging Shiny apps

## Materials

All course materials can be found at [rstd.io/adv-shiny-az](https://rstd.io/adv-shiny-az).

You have two options for following along with the exercises:

- On RStudio Cloud (strongly recommended) - Go to [rstd.io/adv-shiny-az-cloud](https://rstd.io/adv-shiny-az-cloud), log in, and join the workspace. All packages you will need are already pre-installed in the projects in this workspace and the files needed for exercises have already been uploaded there as well.
- Locally - Click on [View the Project on GitHub](https://github.com/rstudio-education/advanced-shiny-az) and either download the contents of the repo or fork and clone it. If you choose this route, start working on the exercises by clicking on the `advanced-shiny-az.Rproj` file to launch the RStudio session. Then, install the latest versions of all packages listed below using the code provided.

<details>
<summary>Packages</summary>
```r
install.packages("bslib")
install.packages("cranlogs")
install.packages("devtools")
install.packages("DT")
install.packages("golem")
install.packages("flexdashboard")
install.packages("gapminder")
install.packages("jsonlite")
install.packages("lubridate")
install.packages("miniUI")
install.packages("openintro")
install.packages("shiny")
install.packages("shinyBS")
install.packages("shinydashboard")
install.packages("shinyjs")
install.packages("shinytest")
install.packages("shinythemes")
install.packages("shinytoastr")
install.packages("testthat")
install.packages("thematic")
install.packages("tidyverse")
devtools::install_github("ThinkR-open/shinysnippets")
devtools::install_github("ropenhealth/openfda")
```
</details>

## Schedule

Each day we'll take two 10-minute breaks one hour and two hours into the workshop (e.g., 10:30am ET and 11:30am ET). 

### Day 1 - 7 September 2021

- [Welcome](https://rstudio-education.github.io/advanced-shiny-az/00-welcome/00-welcome.pdf)
- [From reproducibility to interactivity](https://rstudio-education.github.io/advanced-shiny-az/01-reproducible-to-interactive/01-reproducible-to-interactive.pdf)
- [Building user interfaces](https://rstudio-education.github.io/advanced-shiny-az/02-building-ui/02-building-ui.pdf)

### Day 2 - 9 September 2021

- [Reactive programming](https://rstudio-education.github.io/advanced-shiny-az/03-react-prog/03-react-prog.pdf)
- Modules
- Troubleshooting

## Packages

### From CRAN:

- bslib
- cranlogs
- devtools
- DT
- golem
- flexdashboard
- gapminder
- jsonlite
- lubridate
- miniUI
- openintro
- shiny
- shinyBS
- shinydashboard
- shinyjs
- shinytest
- shinythemes
- shinytoastr
- testthat
- thematic
- tidyverse

### From GitHub:

We won't spend a huge amount of time on these, but I'll show a couple examples or use a dataset or two from them

- shinysnippets - https://github.com/ThinkR-open/shinysnippets
- openfda - https://github.com/ropenhealth/openfda