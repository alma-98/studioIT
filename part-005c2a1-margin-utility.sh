#!/bin/bash

set -e

echo "========================================"
echo " StudioIT v1.0"
echo " PART 005C.2A.1"
echo " MARGIN UTILITY"
echo "========================================"

mkdir -p src/styles

##########################################################
# APPEND MARGIN UTILITIES
##########################################################

cat >> src/styles/utilities.css <<'EOCSS'

/* ======================================================
   Margin Utility
====================================================== */

/* Margin */

.m-0{margin:0!important;}
.m-1{margin:4px!important;}
.m-2{margin:8px!important;}
.m-3{margin:12px!important;}
.m-4{margin:16px!important;}
.m-5{margin:20px!important;}
.m-6{margin:24px!important;}
.m-8{margin:32px!important;}
.m-10{margin:40px!important;}
.m-12{margin:48px!important;}
.m-16{margin:64px!important;}
.m-auto{margin:auto!important;}

/* Margin Top */

.mt-0{margin-top:0!important;}
.mt-1{margin-top:4px!important;}
.mt-2{margin-top:8px!important;}
.mt-3{margin-top:12px!important;}
.mt-4{margin-top:16px!important;}
.mt-5{margin-top:20px!important;}
.mt-6{margin-top:24px!important;}
.mt-8{margin-top:32px!important;}
.mt-10{margin-top:40px!important;}
.mt-12{margin-top:48px!important;}
.mt-16{margin-top:64px!important;}
.mt-auto{margin-top:auto!important;}

/* Margin Bottom */

.mb-0{margin-bottom:0!important;}
.mb-1{margin-bottom:4px!important;}
.mb-2{margin-bottom:8px!important;}
.mb-3{margin-bottom:12px!important;}
.mb-4{margin-bottom:16px!important;}
.mb-5{margin-bottom:20px!important;}
.mb-6{margin-bottom:24px!important;}
.mb-8{margin-bottom:32px!important;}
.mb-10{margin-bottom:40px!important;}
.mb-12{margin-bottom:48px!important;}
.mb-16{margin-bottom:64px!important;}
.mb-auto{margin-bottom:auto!important;}

/* Margin Left */

.ml-0{margin-left:0!important;}
.ml-1{margin-left:4px!important;}
.ml-2{margin-left:8px!important;}
.ml-3{margin-left:12px!important;}
.ml-4{margin-left:16px!important;}
.ml-5{margin-left:20px!important;}
.ml-6{margin-left:24px!important;}
.ml-8{margin-left:32px!important;}
.ml-10{margin-left:40px!important;}
.ml-12{margin-left:48px!important;}
.ml-16{margin-left:64px!important;}
.ml-auto{margin-left:auto!important;}

/* Margin Right */

.mr-0{margin-right:0!important;}
.mr-1{margin-right:4px!important;}
.mr-2{margin-right:8px!important;}
.mr-3{margin-right:12px!important;}
.mr-4{margin-right:16px!important;}
.mr-5{margin-right:20px!important;}
.mr-6{margin-right:24px!important;}
.mr-8{margin-right:32px!important;}
.mr-10{margin-right:40px!important;}
.mr-12{margin-right:48px!important;}
.mr-16{margin-right:64px!important;}
.mr-auto{margin-right:auto!important;}

/* Margin Horizontal */

.mx-0{margin-left:0!important;margin-right:0!important;}
.mx-1{margin-left:4px!important;margin-right:4px!important;}
.mx-2{margin-left:8px!important;margin-right:8px!important;}
.mx-3{margin-left:12px!important;margin-right:12px!important;}
.mx-4{margin-left:16px!important;margin-right:16px!important;}
.mx-5{margin-left:20px!important;margin-right:20px!important;}
.mx-6{margin-left:24px!important;margin-right:24px!important;}
.mx-8{margin-left:32px!important;margin-right:32px!important;}
.mx-10{margin-left:40px!important;margin-right:40px!important;}
.mx-12{margin-left:48px!important;margin-right:48px!important;}
.mx-16{margin-left:64px!important;margin-right:64px!important;}
.mx-auto{margin-left:auto!important;margin-right:auto!important;}

/* Margin Vertical */

.my-0{margin-top:0!important;margin-bottom:0!important;}
.my-1{margin-top:4px!important;margin-bottom:4px!important;}
.my-2{margin-top:8px!important;margin-bottom:8px!important;}
.my-3{margin-top:12px!important;margin-bottom:12px!important;}
.my-4{margin-top:16px!important;margin-bottom:16px!important;}
.my-5{margin-top:20px!important;margin-bottom:20px!important;}
.my-6{margin-top:24px!important;margin-bottom:24px!important;}
.my-8{margin-top:32px!important;margin-bottom:32px!important;}
.my-10{margin-top:40px!important;margin-bottom:40px!important;}
.my-12{margin-top:48px!important;margin-bottom:48px!important;}
.my-16{margin-top:64px!important;margin-bottom:64px!important;}
.my-auto{margin-top:auto!important;margin-bottom:auto!important;}

EOCSS

##########################################################
# VALIDASI
##########################################################

echo ""
echo "========================================"
echo " Margin Utility Added"
echo "========================================"

grep "Margin Utility" -A 5 src/styles/utilities.css

echo ""
echo "========================================"
echo " PART 005C.2A.1 SELESAI"
echo "========================================"

