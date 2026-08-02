#!/bin/bash

set -e

echo "========================================"
echo " StudioIT v1.0"
echo " PART 005C.2B.1"
echo " PADDING UTILITY"
echo "========================================"

mkdir -p src/styles

##########################################################
# APPEND PADDING UTILITIES
##########################################################

cat >> src/styles/utilities.css <<'EOCSS'

/* ======================================================
   Padding Utility
====================================================== */

/* Padding */

.p-0{padding:0!important;}
.p-1{padding:4px!important;}
.p-2{padding:8px!important;}
.p-3{padding:12px!important;}
.p-4{padding:16px!important;}
.p-5{padding:20px!important;}
.p-6{padding:24px!important;}
.p-8{padding:32px!important;}
.p-10{padding:40px!important;}
.p-12{padding:48px!important;}
.p-16{padding:64px!important;}

/* Padding Top */

.pt-0{padding-top:0!important;}
.pt-1{padding-top:4px!important;}
.pt-2{padding-top:8px!important;}
.pt-3{padding-top:12px!important;}
.pt-4{padding-top:16px!important;}
.pt-5{padding-top:20px!important;}
.pt-6{padding-top:24px!important;}
.pt-8{padding-top:32px!important;}
.pt-10{padding-top:40px!important;}
.pt-12{padding-top:48px!important;}
.pt-16{padding-top:64px!important;}

/* Padding Bottom */

.pb-0{padding-bottom:0!important;}
.pb-1{padding-bottom:4px!important;}
.pb-2{padding-bottom:8px!important;}
.pb-3{padding-bottom:12px!important;}
.pb-4{padding-bottom:16px!important;}
.pb-5{padding-bottom:20px!important;}
.pb-6{padding-bottom:24px!important;}
.pb-8{padding-bottom:32px!important;}
.pb-10{padding-bottom:40px!important;}
.pb-12{padding-bottom:48px!important;}
.pb-16{padding-bottom:64px!important;}

/* Padding Left */

.pl-0{padding-left:0!important;}
.pl-1{padding-left:4px!important;}
.pl-2{padding-left:8px!important;}
.pl-3{padding-left:12px!important;}
.pl-4{padding-left:16px!important;}
.pl-5{padding-left:20px!important;}
.pl-6{padding-left:24px!important;}
.pl-8{padding-left:32px!important;}
.pl-10{padding-left:40px!important;}
.pl-12{padding-left:48px!important;}
.pl-16{padding-left:64px!important;}

/* Padding Right */

.pr-0{padding-right:0!important;}
.pr-1{padding-right:4px!important;}
.pr-2{padding-right:8px!important;}
.pr-3{padding-right:12px!important;}
.pr-4{padding-right:16px!important;}
.pr-5{padding-right:20px!important;}
.pr-6{padding-right:24px!important;}
.pr-8{padding-right:32px!important;}
.pr-10{padding-right:40px!important;}
.pr-12{padding-right:48px!important;}
.pr-16{padding-right:64px!important;}

/* Padding Horizontal */

.px-0{padding-left:0!important;padding-right:0!important;}
.px-1{padding-left:4px!important;padding-right:4px!important;}
.px-2{padding-left:8px!important;padding-right:8px!important;}
.px-3{padding-left:12px!important;padding-right:12px!important;}
.px-4{padding-left:16px!important;padding-right:16px!important;}
.px-5{padding-left:20px!important;padding-right:20px!important;}
.px-6{padding-left:24px!important;padding-right:24px!important;}
.px-8{padding-left:32px!important;padding-right:32px!important;}
.px-10{padding-left:40px!important;padding-right:40px!important;}
.px-12{padding-left:48px!important;padding-right:48px!important;}
.px-16{padding-left:64px!important;padding-right:64px!important;}

/* Padding Vertical */

.py-0{padding-top:0!important;padding-bottom:0!important;}
.py-1{padding-top:4px!important;padding-bottom:4px!important;}
.py-2{padding-top:8px!important;padding-bottom:8px!important;}
.py-3{padding-top:12px!important;padding-bottom:12px!important;}
.py-4{padding-top:16px!important;padding-bottom:16px!important;}
.py-5{padding-top:20px!important;padding-bottom:20px!important;}
.py-6{padding-top:24px!important;padding-bottom:24px!important;}
.py-8{padding-top:32px!important;padding-bottom:32px!important;}
.py-10{padding-top:40px!important;padding-bottom:40px!important;}
.py-12{padding-top:48px!important;padding-bottom:48px!important;}
.py-16{padding-top:64px!important;padding-bottom:64px!important;}

EOCSS

##########################################################
# VALIDASI
##########################################################

echo ""
echo "========================================"
echo " Padding Utility Added"
echo "========================================"

grep "Padding Utility" -A 8 src/styles/utilities.css

echo ""
echo "========================================"
echo " File Size"
echo "========================================"

ls -lh src/styles/utilities.css

echo ""
echo "========================================"
echo " PART 005C.2B.1 SELESAI"
echo "========================================"

