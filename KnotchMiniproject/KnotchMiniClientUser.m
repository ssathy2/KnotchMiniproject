//
//  KnotchMiniClientUser.m
//  KnotchMiniproject
//
//  Created by Sidd Sathyam on 7/14/13.
//  Copyright (c) 2013 Sidd Sathyam. All rights reserved.
//

#import "KnotchMiniClientUser.h"

@implementation KnotchMiniClientUser
@synthesize userLocation, userName, userNumFollowers, userNumFollowing, userNumGlory, userNumKnotches, userNumTopics, userProfilePictureURL;

-(id) initWithDictionary:(NSDictionary *)userInfoDict
{
	self = [super init];
	if(self)
	{
		if(userInfoDict) {
			self.userLocation = (NSString*)[userInfoDict objectForKey: @"location"];
			self.userName = (NSString*)[userInfoDict objectForKey: @"name"];
			self.userNumFollowers = [((NSString*)[userInfoDict objectForKey: @"num_followers"]) intValue];
			self.userNumFollowing = [((NSString*)[userInfoDict objectForKey: @"num_following"]) intValue];
			self.userNumGlory = [((NSString*)[userInfoDict objectForKey: @"num_glory"]) intValue];
			self.userNumTopics = [((NSString*)[userInfoDict objectForKey: @"num_topics"]) intValue];
			self.userProfilePictureURL = [NSURL URLWithString: (NSString*)[userInfoDict objectForKey: @"profilePicUrl"]];
		}
	}
	return self;
}
@end

