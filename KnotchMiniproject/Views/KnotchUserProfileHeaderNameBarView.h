//
//  KnotchUserProfileHeaderNameBarView.h
//  KnotchMiniproject
//
//  Created by Sidd Sathyam on 7/15/13.
//  Copyright (c) 2013 Sidd Sathyam. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KnotchUserProfileHeaderNameBarView : UIView
	@property (weak, nonatomic) IBOutlet UILabel *headerBarViewNameLabel;
	- (void) setHeaderBarViewName:(NSString*) user;
@end
