/*
 *  Foundation+Extensions.h
 *  Gigbook
 *
 *  Created by Scott Chandler on 4/26/10.
 *  Copyright 2010 Wooly Beast Software, LLC. All rights reserved.
 *
 */
#import <Foundation/Foundation.h>

#import "NSArray+Extensions.h"
#import "NSString+Extensions.h"
#import "NSBundle+Extensions.h"
#import "NSDate+Extensions.h"
#import "NSValue+Extensions.h"
#import "NSCalendar+Extensions.h"

#define	NSRangeFirst(r)	(r.location)
#define	NSRangeLast(r)	(r.location+r.length-1)
