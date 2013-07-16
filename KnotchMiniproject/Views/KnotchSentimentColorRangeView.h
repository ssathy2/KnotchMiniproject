//
//  KnotchSentimentColorRangeView.h
//  KnotchMiniproject
//
//  Created by Sidd Sathyam on 7/15/13.
//  Copyright (c) 2013 Sidd Sathyam. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KnotchSentimentColorRangeView : UIView
	@property (weak, nonatomic) IBOutlet UIView *sentimentColorRangeContainerView;

	- (void) setSentimentDictionary: (NSDictionary*) dict withTotalKnotches: (int) totalKnotches;
@end
