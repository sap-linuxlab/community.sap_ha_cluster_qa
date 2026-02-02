/*
 * Copyright (c) 1996, 2013, Oracle and/or its affiliates. All rights reserved.
 * ORACLE PROPRIETARY/CONFIDENTIAL. Use is subject to license terms.
 *
 *
 *
 *
 *
 *
 *
 *
 *
 *
 *
 *
 *
 *
 *
 *
 *
 *
 *
 *
 */

#ifndef _JAVASOFT_JNI_MD_H_
#define _JAVASOFT_JNI_MD_H_

/* SAPJVM JS, stuefe 2013-12-04: Instrument jse memory management to go through VM. */
#ifdef SAPJVM_JSE_MEMORY_LEAK_DETECTION
#include "sapjvm_mallinstr.h"
#endif /* SAPJVM_JSE_MEMORY_LEAK_DETECTION */

#ifndef __has_attribute
  #define __has_attribute(x) 0
#endif
/* SAPJVM MBS 2014-01-10 : Oracle JDK8 has a little different code here but we keep what we did */
/* SAPJVM JD 2007-10-16 */
#if defined(__GNUC__) && (__GNUC__ >= 4)
#define JNIEXPORT       __attribute__((visibility("default")))
#define JNIIMPORT       __attribute__((visibility("default")))
/* SAPJVM 2013-11-25 TK use  visibility=default also on solaris */
#elif defined(__solaris__)
#define JNIEXPORT     __global
#define JNIIMPORT     __global
#else
  #define JNIEXPORT
  #define JNIIMPORT
#endif

#define JNICALL

typedef int jint;
#ifdef _LP64 /* 64-bit Solaris */
typedef long jlong;
#else
typedef long long jlong;
#endif

typedef signed char jbyte;

#endif /* !_JAVASOFT_JNI_MD_H_ */
