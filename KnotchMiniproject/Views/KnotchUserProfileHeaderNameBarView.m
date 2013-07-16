//
//  KnotchUserProfileHeaderNameBarView.m
//  KnotchMiniproject
//
//  Created by Sidd Sathyam on 7/15/13.
//  Copyright (c) 2013 Sidd Sathyam. All rights reserved.
//

#import "KnotchUserProfileHeaderNameBarView.h"

@implementation KnotchUserProfileHeaderNameBarView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void) setHeaderBarViewName:(NSString*) user
{
	self.headerBarViewNameLabel.text = user;
	self.headerBarViewNameLabel.font = [UIFont fontWithName: @"Aller" size: 20.0f];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
