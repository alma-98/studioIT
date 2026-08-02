#!/bin/bash

set -e

echo "========================================"
echo " StudioIT v1.0"
echo " PART 005C.2C"
echo " GAP UTILITY"
echo "========================================"

mkdir -p src/styles

##########################################################
# GAP UTILITIES
##########################################################

cat >> src/styles/utilities.css <<'EOCSS'

/* ======================================================
   Gap Utility
====================================================== */

/* Gap */

.gap-0{gap:0!important;}
.gap-1{gap:4px!important;}
.gap-2{gap:8px!important;}
.gap-3{gap:12px!important;}
.gap-4{gap:16px!important;}
.gap-5{gap:20px!important;}
.gap-6{gap:24px!important;}
.gap-8{gap:32px!important;}
.gap-10{gap:40px!important;}
.gap-12{gap:48px!important;}
.gap-16{gap:64px!important;}

/* Row Gap */

.row-gap-0{row-gap:0!important;}
.row-gap-1{row-gap:4px!important;}
.row-gap-2{row-gap:8px!important;}
.row-gap-3{row-gap:12px!important;}
.row-gap-4{row-gap:16px!important;}
.row-gap-5{row-gap:20px!important;}
.row-gap-6{row-gap:24px!important;}
.row-gap-8{row-gap:32px!important;}
.row-gap-10{row-gap:40px!important;}
.row-gap-12{row-gap:48px!important;}
.row-gap-16{row-gap:64px!important;}

/* Column Gap */

.col-gap-0{column-gap:0!important;}
.col-gap-1{column-gap:4px!important;}
.col-gap-2{column-gap:8px!important;}
.col-gap-3{column-gap:12px!important;}
.col-gap-4{column-gap:16px!important;}
.col-gap-5{column-gap:20px!important;}
.col-gap-6{column-gap:24px!important;}
.col-gap-8{column-gap:32px!important;}
.col-gap-10{column-gap:40px!important;}
.col-gap-12{column-gap:48px!important;}
.col-gap-16{column-gap:64px!important;}

EOCSS

##########################################################
# VALIDATION
##########################################################

echo ""
echo "========================================"
echo " Gap Utility Added"
echo "========================================"

grep "Gap Utility" -A 20 src/styles/utilities.css

##########################################################
# BUILD
##########################################################

echo ""
echo "========================================"
echo " BUILD PROJECT"
echo "========================================"

npm run build

##########################################################
# GIT
##########################################################

git add .

git commit -m "Part 005C.2C - Gap Utility Completed" || true

git push

##########################################################
# FIREBASE
##########################################################

firebase deploy

##########################################################
# SUMMARY
##########################################################

echo ""
echo "========================================"
echo " GAP UTILITY COMPLETED"
echo "========================================"

echo ""
echo "Project Console:"
echo "https://console.firebase.google.com/project/studioit-f2230/overview"

echo ""
echo "Hosting:"
echo "https://studioit.web.app"

echo ""
echo "========================================"
echo " PART 005C.2C SELESAI"
echo "========================================"

