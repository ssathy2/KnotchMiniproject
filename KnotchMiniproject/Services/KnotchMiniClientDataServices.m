//
//  KnotchMiniClientDataServices.m
//  KnotchMiniproject
//
//  Created by Sidd Sathyam on 7/14/13.
//  Copyright (c) 2013 Sidd Sathyam. All rights reserved.
//

#import "KnotchMiniClientDataServices.h"

@implementation KnotchMiniClientDataServices

// use this method to get the services object to make service calls with
+(KnotchMiniClientDataServices*) sharedServices
{
	static KnotchMiniClientDataServices* services;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		services = [[KnotchMiniClientDataServices alloc] init];
	});
	return services;
}

- (void) getKnotchesWithUserID:(NSString *)userID withCount:(int)count withSuccessHandler:(void (^)(NSURLRequest *, NSHTTPURLResponse *, id))successHandler withErrorHandler:(void (^)(NSURLRequest *, NSURLResponse *, NSError *, id))errorHandler
{
	NSURL* requestURL = [NSURL URLWithString: [NSString stringWithFormat: BASE_KNOTCH_USER_FEED_URL, KNOTCH_USER_ID, count]];
	NSURLRequest* request = [NSURLRequest requestWithURL: requestURL cachePolicy: NSURLRequestUseProtocolCachePolicy timeoutInterval: 60];
	AFJSONRequestOperation* jsonRequestOperation = [AFJSONRequestOperation JSONRequestOperationWithRequest: request success: successHandler failure:errorHandler];
	[jsonRequestOperation start];
}

- (void) getImageWithURL:(NSURL *)imageURL withSuccessHandler:(void (^)(UIImage *))success
{
	NSURLRequest* request = [NSURLRequest requestWithURL: imageURL cachePolicy: NSURLRequestUseProtocolCachePolicy timeoutInterval: 60];
	AFImageRequestOperation* imgRequestOperation = [AFImageRequestOperation imageRequestOperationWithRequest: request success: success];
	[imgRequestOperation start];
}

@end
