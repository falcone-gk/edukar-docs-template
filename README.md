# README for Typst Template

This Typst template is designed for creating educational materials, such as exam papers, solution manuals, and presentations. It includes custom functions and styles to facilitate the creation of professional-looking documents. Below is a guide to help you understand and use the template effectively.

---

## Table of Contents
1. [Features](#features)
2. [Dependencies](#dependencies)
3. [Template Structure](#template-structure)
4. [Custom Functions](#custom-functions)
5. [Usage](#usage)
6. [Assets](#assets)
7. [License](#license)

---

## Features
- **Customizable Layouts**: Supports both A4 and presentation (16:9) formats.
- **Dynamic Content**: Includes functions for displaying series, underlining text, and creating answer sections.
- **Social Media Integration**: Easily add links to social media platforms like WhatsApp, YouTube, Facebook, and Instagram.
- **Header and Footer**: Customizable headers and footers with dynamic page numbering.
- **Styling Options**: Predefined colors, fonts, and alignment utilities for consistent design.

---

## Dependencies
This template relies on the following external packages:
- **Cetz**: Used for drawing and vector-based content.
- **Grayness**: Provides utilities for transparent images.

To use these packages, ensure they are imported at the beginning of your Typst file:
```typst
#import "@preview/cetz:0.3.1"
#import "@preview/grayness:0.2.0": transparent-image
```

## Template Structure
The template is organized into several key components:

### 1. **Global Variables**
- `bg_color`: Background color for the document.
- `primary_color`: Primary accent color for text and elements.
- `page_height` and `page_width`: Dimensions for the document layout.
- `panel_width`: Width of the left panel.

### 2. **Custom Functions**
- `center-rect(body)`: Centers content within a rectangle.
- `left-panel()`: Creates a left panel with social media links and contact information.
- `header-banner(title, area)`: Generates a header banner with a title and area description.
- `custom-footer(page, is-ppt)`: Creates a footer with copyright information and page numbering.
- `show-series()`: Displays a series of items with optional annotations.
- `ubox(width)`: Creates an underlined box for text.
- `conf()`: Configures the document layout based on the type (exam or presentation).

### 3. **Assets**
- Social media icons (`whatsapp.png`, `youtube.png`, `facebook.png`, `instagram.png`).
- Logos (`dark-logo.png`, `new-logo.jpg`, `logo-ppt.jpg`).
