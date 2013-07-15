//
//  KnotchMiniClientUtils.h
//  KnotchMiniproject
//
//  Created by Sidd Sathyam on 7/14/13.
//  Copyright (c) 2013 Sidd Sathyam. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KnotchMiniClientUtils : NSObject
	+(UIColor*) colorForSentimentValue:(int) sentimentValue;
	+ (NSString*) getLastUpdatedTime;
@end
