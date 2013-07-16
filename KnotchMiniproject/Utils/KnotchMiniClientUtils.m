//
//  
//  KnotchMiniproject
//
//  Created by Sidd Sathyam on 7/14/13.
//  Copyright (c) 2013 Sidd Sathyam. All rights reserved.
//

#import "KnotchMiniClientUtils.h"

static const NSDictionary* SENTIMENT_COLOR;
@implementation KnotchMiniClientUtils

__attribute__((constructor))
static void initialize_navigationBarImages() {
	SENTIMENT_COLOR = @{
					 @0: @0x2e5ca6, @2: @0x586db9, @4: @0x008fd0, @6: @0x57cccc, @8: @0xceebee, @10: @0xffffff, @12: @0xffeec3, @14: @0xffcc43, @16: @0xffa02d, @18: @0xff6d3a, @20: @0xee443a};
}

//TAKEN FROM http://cocoamatic.blogspot.com/2010/07/uicolor-macro-with-hex-values.html
+ (UIColor *)colorWithHex:(int)hexValue alpha:(CGFloat)alpha
{
	return [UIColor
			colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0
			green:((float)((hexValue & 0xFF00) >> 8))/255.0
			blue:((float)(hexValue & 0xFF))/255.0 alpha:alpha];
}

+ (UIColor*)colorForSentimentValue:(int)sentimentValue
{
	NSNumber* color = [SENTIMENT_COLOR objectForKey: [NSNumber numberWithInt: sentimentValue]];
	return [self colorWithHex: [color intValue] alpha: 1.0f];
}

+ (NSString*) getLastUpdatedTime
{
	NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
	[formatter setDateFormat: @"MMM d, h:mm a"];
	
	NSString* lastUpdated = [NSString stringWithFormat: @"Last updated on %@", [formatter stringFromDate: [NSDate date]]];
	return lastUpdated;
}

@end
