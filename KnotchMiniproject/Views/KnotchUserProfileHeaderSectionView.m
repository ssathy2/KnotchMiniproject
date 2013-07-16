//
//  KnotchUserProfileHeaderSectionView.m
//  KnotchMiniproject
//
//  Created by Sidd Sathyam on 7/14/13.
//  Copyright (c) 2013 Sidd Sathyam. All rights reserved.
//

#import "KnotchUserProfileHeaderSectionView.h"
#import "KnotchMiniClientDataServices.h"

@implementation KnotchUserProfileHeaderSectionView
	@synthesize headerSectionFollowersNumberLabel;
	@synthesize headerSectionUser = _headerSectionUser;

static void dumpAllFonts() {
    for (NSString *familyName in [UIFont familyNames]) {
        for (NSString *fontName in [UIFont fontNamesForFamilyName:familyName]) {
            NSLog(@"%@", fontName);
        }
    }
}

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
		self.headerSectionNameLabel.font = [UIFont fontWithName: @"Aller" size: 17.0f];
		self.headerSectionLocationLabel.font = [UIFont fontWithName: @"Aller" size: 13.0f];
		self.headerSectionGloryNumberLabel.font = [UIFont fontWithName: @"Lato" size: 15.0f];
		self.headerSectionFollowersNumberLabel.font = [UIFont fontWithName: @"Lato" size: 15.0f];
		self.headerSectionFollowingNumberLabel.font = [UIFont fontWithName: @"Lato" size: 15.0f];
		
		
		_headerSectionUser = user;
		self.headerSectionFollowersNumberLabel.text = [NSString stringWithFormat: @"%i", _headerSectionUser.userNumFollowers];
		self.headerSectionFollowingNumberLabel.text = [NSString stringWithFormat: @"%i", _headerSectionUser.userNumFollowing];
		self.headerSectionGloryNumberLabel.text = [NSString stringWithFormat: @"%i", _headerSectionUser.userNumGlory];
		self.headerSectionLocationLabel.text = _headerSectionUser.userLocation;
		self.headerSectionNameLabel.text = _headerSectionUser.userName;
	}
}

- (void) setHeaderSectionImage: (UIImage*) img
{
	if(self.headerSectionImageView) {
		[self.headerSectionImageView setImage: img];
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
