//
//  KnotchMiniClientViewController.m
//  KnotchMiniproject
//
//  Created by Sidd Sathyam on 7/14/13.
//  Copyright (c) 2013 Sidd Sathyam. All rights reserved.
//

#import "KnotchMiniClientViewController.h"
#import "KnotchUserProfileTableViewCell.h"
#import "KnotchUserProfileHeaderSectionView.h"
#import "KnotchMiniClientUser.h"
#import "KnotchMiniClientDataServices.h"

static NSString *KNOTCH_TABLEVIEW_CELL = @"KnotchUserProfileTableViewCell";

@interface KnotchMiniClientViewController (){
	NSMutableArray* knotches;
	KnotchMiniClientUser* knotchUser;
	int currentKnotchesRetreived;
}

@end

@implementation KnotchMiniClientViewController

// Put all table configuration init stuff here
- (void)configureTable
{
	UIRefreshControl* refresh = [[UIRefreshControl alloc] init];
	refresh.attributedTitle = [[NSAttributedString alloc] initWithString: @"Pull to Refresh"];
	[refresh addTarget:self
				action:@selector(refreshView:)
	  forControlEvents:UIControlEventValueChanged];
	self.refreshControl = refresh;
}

- (void)configureHeaderView
{
	KnotchUserProfileHeaderSectionView* headerView = (KnotchUserProfileHeaderSectionView*)([[NSBundle mainBundle] loadNibNamed:@"KnotchUserProfileHeaderSection" owner:self options: nil][0]);
	[headerView setHeaderSectionUser: knotchUser];
	[[KnotchMiniClientDataServices sharedServices] getImageWithURL: [knotchUser userProfilePictureURL] withSuccessHandler:^ (UIImage* image) {
		[headerView setHeaderSectionImage: image];
	}];
	[self.view addSubview: headerView];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	[self configureTable];
	
	// retrieve 20 knotches at a time from services...
	currentKnotchesRetreived = 20;
	if(!knotches && !knotchUser) {
		knotches = [[NSMutableArray alloc] init];
		knotchUser = [[KnotchMiniClientUser alloc] init];
	}
	[self updateKnotchesStartingAt:0 endingAt:currentKnotchesRetreived];
}

- (void) updateKnotchesStartingAt: (int)startNumber endingAt: (int) endNumber
{
	KnotchMiniClientDataServices* services = [KnotchMiniClientDataServices sharedServices];
	[services getKnotchesWithUserID: KNOTCH_USER_ID withCount: endNumber withSuccessHandler: ^(NSURLRequest* request, NSHTTPURLResponse* response, id JSON) {
		NSLog(@"Update knotches sucessful...");
		NSDictionary* responseJSON = (NSDictionary*) JSON;
		knotchUser = [[KnotchMiniClientUser alloc] initWithDictionary: [responseJSON objectForKey: @"userInfo"]];
		NSArray* arr = [responseJSON objectForKey: @"knotches"];
		NSDictionary* dict;
		for(int i = startNumber; i < endNumber; i++)
		{
			dict = arr[i];
			KnotchData* data = [[KnotchData alloc] initWithDictionary: dict];
			[knotches addObject: data];
		}
		[self.tableView reloadData];
		[self configureHeaderView];
	} withErrorHandler: ^(NSURLRequest* request, NSURLResponse* response, NSError* error, id JSON)
	{
		NSLog(@"ERROR: Oh noes...the notches were not retrieved");
		NSLog(@"%@", error);
	}];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table View
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}

/*- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
	if(section == 0)
	{
		KnotchUserProfileHeaderSectionView* headerView = (KnotchUserProfileHeaderSectionView*)([[NSBundle mainBundle] loadNibNamed:@"KnotchUserProfileHeaderSection" owner:self options: nil][0]);
		[headerView setHeaderSectionUser: knotchUser];
		[[KnotchMiniClientDataServices sharedServices] getImageWithURL: [knotchUser userProfilePictureURL] withSuccessHandler:^ (UIImage* image) {
			[headerView setHeaderSectionImage: image];
		}];
		return headerView;
	}
	else return nil;
}*/

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return knotches.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    KnotchUserProfileTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier: KNOTCH_TABLEVIEW_CELL];
    //if(cell == nil){
	NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"KnotchUserProfileTableViewCell" owner:self options:nil];
	cell = [nib objectAtIndex:0];
	//}

	[cell setKnotchData: [knotches objectAtIndex: [indexPath row]]];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return NO;
}

- (void)refreshView: (UIRefreshControl*) refresh
{
	refresh.attributedTitle = [[NSAttributedString alloc] initWithString: @"Refreshing Front Page Posts"];
	
	currentKnotchesRetreived = 20;
	[self updateKnotchesStartingAt: 0 endingAt: currentKnotchesRetreived];
	refresh.attributedTitle = [[NSAttributedString alloc] initWithString: [KnotchMiniClientUtils getLastUpdatedTime]];
	[refresh endRefreshing];
	
}

- (void) tableView: (UITableView*) tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
	if ((indexPath.section == [self.tableView numberOfSections] - 1)
		&& (indexPath.row == [self.tableView numberOfRowsInSection:indexPath.section] - 1))
	{
		[self updateKnotchesStartingAt: currentKnotchesRetreived endingAt: currentKnotchesRetreived+20];
		currentKnotchesRetreived += 20;
	}
}

@end
