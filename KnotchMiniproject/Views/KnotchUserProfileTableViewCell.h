//
//  KnotchUserProfileTableViewCell.h
//  KnotchMiniproject
//
//  Created by Sidd Sathyam on 7/14/13.
//  Copyright (c) 2013 Sidd Sathyam. All rights reserved.
//

#import "KnotchData.h"
#import <UIKit/UIKit.h>

@interface KnotchUserProfileTableViewCell : UITableViewCell
	@property (weak, nonatomic) IBOutlet UILabel *knotchTopicLabel;
	@property (weak, nonatomic) IBOutlet UILabel *knotchUserResponseLabel;
	@property (weak, nonatomic) IBOutlet UIView *knotchUserResponseLabelContainer;
@property (weak, nonatomic) IBOutlet UILabel *knotchUserResponseApostrophe;
	@property (strong, nonatomic) KnotchData* knotchData;
@end
