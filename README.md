# Fright Night Data Visualization Project

**Author:** Annie Walsh  
**Date:** July 2025  

---

## 🎃 Project Overview

This project explores interactive and animated data visualizations using a de-identified dataset from the **SAN & AML Lab's 2019 Haunted House Study**, where participants traversed the historic Eastern State Penitentiary and reported on their emotional and regulatory experiences.

The project demonstrates:

✅ Data cleaning and wrangling with `tidyverse`  
✅ Static and interactive visualizations with `ggplot2` and `plotly`  
✅ Animated visualizations with `gganimate`  
✅ A dynamic, user-controlled `Shiny` app for exploring the data interactively  

The work reflects best practices in R-based data visualization and is designed for both teaching and portfolio purposes.

---

## 📊 About the Dataset

Participants (PID) navigated Eastern State Penitentiary in small groups and identified:

- 10 emotionally significant events (`Event`) in chronological order  
- Specific emotions experienced (`Emotion`)  
- Emotional intensity (`Emo.Extent`) and regulation effort (`Reg.Extent`)  
- Additional individual differences:  
   - Depression (`BDI`), Anxiety (`STAI`), Emotion Regulation tendencies (`ERQ`), Uncertainty Tolerance (`IUS`), and Fear levels during the experience (`Fear_During`)  
   - Regulation strategy used: `Distraction` or `Reappraisal`  

**Note:** Data has been pre-processed and de-identified for visualization purposes.

---

## 🚀 Project Structure

data-visualization-shiny/
├── data/ # Contains df.rda (de-identified dataset)
├── outputs/ # Saved interactive plots (e.g., plotly .html files)
├── notebooks/ # R Markdown walkthrough (data-visualization.Rmd)
├── scripts/ # Standalone Shiny App (app.R)
├── .gitignore
├── README.md


---

## 💡 Key Features

- **Static Violin Plots** comparing emotional intensity by emotion and regulation strategy  
- **Interactive Plots with Plotly** (hover, zoom, inspect individual points)  
- **Animated Visualizations** with `gganimate` showing how patterns evolve across events  
- **Interactive Shiny App**:  
   - Filter by Emotion, Fear Level, and Regulation Strategy  
   - Explore real-time changes in emotional intensity vs. regulation effort  

---

## 🛠 Technologies Used

- `R`, `RStudio`  
- `tidyverse` for data manipulation  
- `ggplot2` for core plotting  
- `plotly` for interactive plots  
- `gganimate` for animated visualizations  
- `shiny` for web-based interactive exploration  
- `htmlwidgets` for exporting interactive plots  

---

## 📂 How to Run

### 1️⃣ Notebook Walkthrough

Navigate to `/notebooks`, open `data-visualization.Rmd`, and knit to HTML for a complete, narrative walkthrough of:

- Data overview  
- Exploratory plots  
- Interactive visualizations  
- Animated outputs  

**Requirements:**  
Install dependencies if needed:

```r
if (!require(pacman)) install.packages("pacman")
pacman::p_load(gganimate, htmlwidgets, naniar, plotly, RColorBrewer, shiny, tidyverse, transformr, VIM)
