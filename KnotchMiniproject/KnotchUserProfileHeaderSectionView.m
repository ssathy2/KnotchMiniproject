//
//  KnotchUserProfileHeaderSectionView.m
//  KnotchMiniproject
//
//  Created by Sidd Sathyam on 7/14/13.
//  Copyright (c) 2013 Sidd Sathyam. All rights reserved.
//

#import "KnotchUserProfileHeaderSectionView.h"

@implementation KnotchUserProfileHeaderSectionView
	@synthesize headerSectionUser = _headerSectionUser;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void) setHeaderSectionUser:(KnotchMiniClientUser *) user
{
	if(user != _headerSectionUser)
	{
		_headerSectionUser = user;
		self.headerSectionFollowersNumberLabel.text = [NSString stringWithFormat: @"%i", _headerSectionUser.userNumFollowers];
		self.headerSectionFollowingNumberLabel.text = [NSString stringWithFormat: @"%i", _headerSectionUser.userNumFollowing];
		self.headerSectionGloryNumberLabel.text = [NSString stringWithFormat: @"%i", _headerSectionUser.userNumGlory];
		//self.headerSectionImageView = [UIImage image], _headerSectionUser.userNumGlory];
		self.headerSectionLocationLabel.text = _headerSectionUser.userLocation;
		self.headerSectionNameLabel.text = _headerSectionUser.userName;
		
	}
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
