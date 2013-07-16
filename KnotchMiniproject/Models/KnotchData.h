//
//  KnotchData.h
//  KnotchMiniproject
//
//  Created by Sidd Sathyam on 7/14/13.
//  Copyright (c) 2013 Sidd Sathyam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KnotchMiniClientUser.h"

@interface KnotchData : NSObject
	@property (strong, nonatomic) NSString* knotchTopic;
	@property (strong, nonatomic) NSString* knotchComment;
	@property (strong, nonatomic) NSString* knotchID;
	@property (nonatomic) int knotchSentiment;
	@property (nonatomic, strong) NSDate* knotchPostedDate;
	//@property (strong, nonatomic) KnotchMiniClientUser* knotchUserSubmitted;

	-(id)initWithDictionary: (NSDictionary*) dict;
@end
