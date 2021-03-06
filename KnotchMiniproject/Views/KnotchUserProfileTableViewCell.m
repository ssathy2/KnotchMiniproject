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
		
		self.knotchTopicLabel.font = [UIFont fontWithName: @"Aller" size: 15.0f];
		self.knotchUserResponseLabel.font = [UIFont fontWithName: @"Lato" size: 15.0f];
		
		self.knotchUserResponseApostrophe.font = [UIFont fontWithName: @"Lato" size: 30.0f];
		
		self.knotchTopicLabel.text = _knotchData.knotchTopic;
		self.knotchUserResponseLabel.text = _knotchData.knotchComment;
		self.knotchUserResponseLabelContainer.backgroundColor = [KnotchMiniClientUtils colorForSentimentValue: [_knotchData knotchSentiment]];
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
