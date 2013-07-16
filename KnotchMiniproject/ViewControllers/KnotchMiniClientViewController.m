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
#import "KnotchSentimentColorRangeView.h"
#import "KnotchUserProfileHeaderNameBarView.h"

static NSString *KNOTCH_TABLEVIEW_CELL = @"KnotchUserProfileTableViewCell";
static NSString *KNOTCH_PROFILE_HEADER_CELL = @"KnotchUserProfileHeaderTableViewCell";

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

- (void)configureSentimentColorView
{
	KnotchSentimentColorRangeView* colorRangeView = (KnotchSentimentColorRangeView*)([[NSBundle mainBundle] loadNibNamed:@"KnotchSentimentColorRange" owner:self options: nil][0]);
	[self.tableView setTableHeaderView: colorRangeView];
}

- (void) updateKnotches
{
	currentKnotchesRetreived = 20;
	if(!knotches && !knotchUser) {
		knotches = [[NSMutableArray alloc] init];
		//knotchUser = [[KnotchMiniClientUser alloc] init];
	}
	[self updateKnotchesStartingAt:0 endingAt:currentKnotchesRetreived];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	[self updateKnotches];
	
	// retrieve 20 knotches at a time from services...
	[self configureTable];
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
		//[self.tableView reloadSections: [NSIndexSet indexSetWithIndex: 1] withRowAnimation: nil];
		[self.tableView reloadData];
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
	return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	if(section == 0) return 1;
	else {
		return knotches.count;
	}
}

- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
	if(section == 1)
	{
		KnotchSentimentColorRangeView* colorRangeView = (KnotchSentimentColorRangeView*)([[NSBundle mainBundle] loadNibNamed:@"KnotchSentimentColorRange" owner:self options: nil][0]);
		//[self.tableView setTableHeaderView: colorRangeView];
		
		NSMutableDictionary* sentimentDict = [NSMutableDictionary dictionary];
		for(KnotchData* data in knotches)
		{
			NSNumber* n = [sentimentDict objectForKey: [NSNumber numberWithInt: [data knotchSentiment]]];
			if(n) {
				[sentimentDict setObject: [NSNumber numberWithInt: [n intValue]+1]  forKey: [NSNumber numberWithInt: [data knotchSentiment]]];
			}
			else {
				[sentimentDict setObject: [NSNumber numberWithInt:1] forKey: [NSNumber numberWithInt: [data knotchSentiment]]];
			}
		}
		
		[colorRangeView setSentimentDictionary: sentimentDict withTotalKnotches: currentKnotchesRetreived];
		return colorRangeView;
	}
	else
	{
		KnotchUserProfileHeaderNameBarView* headerNameBar = (KnotchUserProfileHeaderNameBarView*)([[NSBundle mainBundle] loadNibNamed:@"KnotchUserProfileHeaderNameBar" owner:self options: nil][0]);
		[headerNameBar setHeaderBarViewName: [knotchUser userName]];
		return headerNameBar;
	}
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
	//if (section == 1)
	//{
		return 60.0;
	//}
	//else return .0;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	if(indexPath.section == 1) {
		KnotchUserProfileTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier: KNOTCH_TABLEVIEW_CELL];

		NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"KnotchUserProfileTableViewCell" owner:self options:nil];
		cell = [nib objectAtIndex:0];

		[cell setKnotchData: [knotches objectAtIndex: [indexPath row]]];
		cell.selectionStyle = UITableViewCellSelectionStyleNone;
		return cell;
	}
	else {
		KnotchUserProfileHeaderSectionView* cell = [tableView dequeueReusableCellWithIdentifier: KNOTCH_PROFILE_HEADER_CELL];

		NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"KnotchUserProfileHeaderSection" owner:self options:nil];
		cell = [nib objectAtIndex:0];
	
		[cell setHeaderSectionUser: knotchUser];
		cell.selectionStyle = UITableViewCellSelectionStyleNone;
		
		[[KnotchMiniClientDataServices sharedServices] getImageWithURL: [knotchUser userProfilePictureURL] withSuccessHandler:^ (UIImage* image) {
			[cell setHeaderSectionImage: image];
		}];

		return cell;
	}
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return NO;
}

- (void)refreshView: (UIRefreshControl*) refresh
{
	refresh.attributedTitle = [[NSAttributedString alloc] initWithString: @"Refreshing Knotches"];

	[self updateKnotches];
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
