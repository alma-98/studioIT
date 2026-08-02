#!/bin/bash

set -e

echo "========================================"
echo " StudioIT v1.0"
echo " PART 005B.4D.1"
echo " FINAL LAYOUT EXPORT"
echo "========================================"

mkdir -p src/layout

##########################################################
# FINAL INDEX
##########################################################

cat > src/layout/index.ts <<'EOT'
export { default as Container } from "./Container";
export { default as Section } from "./Section";

export { default as Flex } from "./Flex";
export { default as Stack } from "./Stack";
export { default as Row } from "./Row";
export { default as Column } from "./Column";

export { default as Grid } from "./Grid";
export { default as AutoGrid } from "./AutoGrid";

export { default as Center } from "./Center";

export { default as Spacer } from "./Spacer";

export { default as Masonry } from "./Masonry";
export { default as MasonryItem } from "./MasonryItem";

export { default as Page } from "./Page";
export { default as Main } from "./Main";

export { default as Content } from "./Content";
export { default as Sidebar } from "./Sidebar";

export { default as Wrapper } from "./Wrapper";
export { default as Shell } from "./Shell";
EOT

##########################################################
# README
##########################################################

cat > src/layout/README.md <<'EOT'
# StudioIT Layout System

Layout System adalah fondasi seluruh halaman StudioIT.

========================================
KOMPONEN
========================================

Container
Section

Flex
Stack
Row
Column

Grid
AutoGrid

Center

Spacer

Masonry
MasonryItem

Page
Main

Content
Sidebar

Wrapper
Shell

========================================
STRUKTUR LANDING PAGE
========================================

Page
 -> Main
    -> Section
       -> Container
          -> Grid
             -> Card
             -> Card
             -> Card

========================================
STRUKTUR DASHBOARD
========================================

Shell
 -> Sidebar
 -> Content

========================================

Semua halaman StudioIT wajib menggunakan Layout System.

StudioIT v1.0

EOT

##########################################################
# VALIDASI
##########################################################

echo ""
echo "========================================"
echo "Layout Components"
echo "========================================"

find src/layout -maxdepth 1 -type f | sort

echo ""
echo "========================================"
echo "Preview index.ts"
echo "========================================"

cat src/layout/index.ts

echo ""
echo "========================================"
echo "Preview README"
echo "========================================"

head -40 src/layout/README.md

echo ""
echo "========================================"
echo "PART 005B.4D.1 SELESAI"
echo "========================================"

