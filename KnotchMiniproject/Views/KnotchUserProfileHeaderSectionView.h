//
//  KnotchUserProfileHeaderSectionView.h
//  KnotchMiniproject
//
//  Created by Sidd Sathyam on 7/14/13.
//  Copyright (c) 2013 Sidd Sathyam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KnotchMiniClientUser.h"

@interface KnotchUserProfileHeaderSectionView : UITableViewCell

@property (strong, nonatomic) KnotchMiniClientUser* headerSectionUser;
@property (weak, nonatomic) IBOutlet UIImageView *headerSectionImageView;
@property (weak, nonatomic) IBOutlet UILabel *headerSectionNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *headerSectionLocationLabel;
@property (weak, nonatomic) IBOutlet UILabel *headerSectionGloryNumberLabel;
@property (weak, nonatomic) IBOutlet UILabel *headerSectionFollowingNumberLabel;
@property (weak, nonatomic) IBOutlet UILabel *headerSectionFollowersNumberLabel;

- (void) setHeaderSectionImage: (UIImage*) img;
@end
