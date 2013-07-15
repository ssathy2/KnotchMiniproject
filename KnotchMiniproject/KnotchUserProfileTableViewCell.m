//
//  KnotchUserProfileTableViewCell.m
//  KnotchMiniproject
//
//  Created by Sidd Sathyam on 7/14/13.
//  Copyright (c) 2013 Sidd Sathyam. All rights reserved.
//

#import "KnotchUserProfileTableViewCell.h"

@implementation KnotchUserProfileTableViewCell
@synthesize knotchData=_knotchData;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void) setKnotchData:(KnotchData *)data
{
	if(data != _knotchData)
	{
		_knotchData = data;
		self.knotchTopicLabel.text = _knotchData.knotchTopic;
		self.knotchUserResponseLabel.text = _knotchData.knotchComment;
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
