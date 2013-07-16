//
//  KnotchMiniClientDataServices.h
//  KnotchMiniproject
//
//  Created by Sidd Sathyam on 7/14/13.
//  Copyright (c) 2013 Sidd Sathyam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFJSONRequestOperation.h"
#import "AFImageRequestOperation.h"

#define BASE_KNOTCH_USER_FEED_URL @"http://dev.knotch.it:8080/miniProject/user_feed/%@/%i"
#define KNOTCH_USER_ID @"500e3b57bbcd08696800000a"

@interface KnotchMiniClientDataServices : NSObject
+ (KnotchMiniClientDataServices*) sharedServices;

- (void) getKnotchesWithUserID: (NSString*) userID withCount: (int) count withSuccessHandler: (void (^)(NSURLRequest *request, NSHTTPURLResponse *response, id JSON))successHandler withErrorHandler: (void (^)(NSURLRequest *request ,NSURLResponse *response ,NSError *error, id JSON))errorHandler;

- (void) getImageWithURL: (NSURL*) imageURL withSuccessHandler: (void (^)(UIImage *image)) sucess;

@end
