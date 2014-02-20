//
//  WoolyMemory.h
//  WoolyFoundation
//
//  Created by Scott Chandler on 2/19/14.
//
//

#ifndef WoolyFoundation_WoolyMemory_h
#define WoolyFoundation_WoolyMemory_h

#ifndef WBRetain
#if !__has_feature(objc_arc)
#define	WBRetain(obj)	[obj retain]
#else
#define	WBRetain(obj)	(void)0
#endif
#endif

#ifndef WBRelease
#if !__has_feature(objc_arc)
#define	WBRelease(obj)	[obj release]
#else
#define	WBRelease(obj)	(void)0
#endif
#endif

#ifndef WBAutorelease
#if !__has_feature(objc_arc)
#define	WBAutorelease(obj)	[obj autorelease]
#else
#define	WBAutorelease(obj)
#endif
#endif

#ifndef WBSuperDealloc
#if !__has_feature(objc_arc)
#define	WBSuperDealloc	[super dealloc]
#else
#define	WBSuperDealloc	(void)0
#endif
#endif


#endif
