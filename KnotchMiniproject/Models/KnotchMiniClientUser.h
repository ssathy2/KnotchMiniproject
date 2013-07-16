//
//  KnotchMiniClientUser.h
//  KnotchMiniproject
//
//  Created by Sidd Sathyam on 7/14/13.
//  Copyright (c) 2013 Sidd Sathyam. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KnotchMiniClientUser : NSObject
	@property (nonatomic) int userNumKnotches;
	@property (nonatomic) int userNumTopics;
	@property (nonatomic) int userNumFollowing;
	@property (nonatomic) int userNumFollowers;
	@property (nonatomic) int userNumGlory;
	@property (strong, nonatomic) NSString* userLocation;
	@property (strong, nonatomic) NSURL* userProfilePictureURL;
	@property (strong, nonatomic) NSString* userName;

	- (id)initWithDictionary: (NSDictionary*) userInfoDict;
@end
