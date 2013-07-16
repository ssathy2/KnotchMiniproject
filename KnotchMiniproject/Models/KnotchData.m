//
//  KnotchData.m
//  KnotchMiniproject
//
//  Created by Sidd Sathyam on 7/14/13.
//  Copyright (c) 2013 Sidd Sathyam. All rights reserved.
//


/*_id: "51cb400cd3a48fb64d000137"
comment: "Same sex marriage is now legal in 13 states. 30% of Americans live in a state where gay couples can marry legally. 😊"
sentiment: 20
timestamp: "2013-06-26T19:25:00.612Z"
topic: "Gay marriage"
user: "1572450228"*/

#import "KnotchData.h"

@implementation KnotchData
	@synthesize knotchComment, knotchID, knotchTopic;//, knotchUserSubmitted;

	-(id)initWithDictionary:(NSDictionary *)dict
	{
		self = [super init];
		if(self)
		{
			if(dict)
			{
				self.knotchComment = (NSString*)[dict objectForKey: @"comment"];
				self.knotchID = (NSString*)[dict objectForKey: @"_id"];
				self.knotchPostedDate = (NSDate*)[dict objectForKey: @"timestamp"];
				self.knotchTopic = (NSString*)[dict objectForKey: @"topic"];
				self.knotchSentiment = (int)[[dict objectForKey: @"sentiment"] intValue];
			}
		}
		return self;
	}
@end
