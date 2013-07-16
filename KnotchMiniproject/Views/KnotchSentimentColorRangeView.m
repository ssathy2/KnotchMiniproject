//
//  KnotchSentimentColorRangeView.m
//  KnotchMiniproject
//
//  Created by Sidd Sathyam on 7/15/13.
//  Copyright (c) 2013 Sidd Sathyam. All rights reserved.
//

#import "KnotchSentimentColorRangeView.h"
#import "KnotchMiniClientUtils.h"

@implementation KnotchSentimentColorRangeView {
	NSDictionary* knotchData;
	int numTotalKnotches;
}

- (void) setSentimentDictionary:(NSDictionary *)dict withTotalKnotches:(int)totalKnotches
{
	knotchData = dict;
	numTotalKnotches = totalKnotches;
	
	[self drawSentimentBar];
}

- (void) removeAllSubviews: (UIView*) v
{
	for(UIView* sub in [v subviews])
	{
		[sub removeFromSuperview];
	}
}

- (void) drawSentimentBar
{
	if([[[self sentimentColorRangeContainerView] subviews] count] > 0)
	{
		[self removeAllSubviews: [self sentimentColorRangeContainerView]];
	}
	
	CGRect containerRect = [[self sentimentColorRangeContainerView] bounds];
	float xColorView = containerRect.origin.x;
	NSSortDescriptor* sortOrder = [NSSortDescriptor sortDescriptorWithKey: @"self" ascending: YES];
	for(NSNumber* n in [[knotchData allKeys] sortedArrayUsingDescriptors: [NSArray arrayWithObject: sortOrder]])
	{
		float colorViewWidth = ([[knotchData objectForKey: n] doubleValue] / numTotalKnotches) * containerRect.size.width;
		UIView* color = [[UIView alloc] initWithFrame: CGRectMake(xColorView, containerRect.origin.y, colorViewWidth, containerRect.size.height)];
		xColorView += colorViewWidth;
		[color setBackgroundColor: [KnotchMiniClientUtils colorForSentimentValue: [n intValue]]];
		[[self sentimentColorRangeContainerView] addSubview: color];
	}
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
		[self addSubview: [self sentimentColorRangeContainerView]];
		[self bringSubviewToFront: [self sentimentColorRangeContainerView]];
    }
    return self;
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
