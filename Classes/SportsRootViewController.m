//
//  RootViewController.m
//  tableViewShell
//
//  Created by VJ Cerniglia on 6/29/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "SportsRootViewController.h"
#import "SportsViewController.h"
#import "customSportsCell.h"



//static NSString *kCellIdentifier = @"MyIdentifier";
static NSString *kTitleKey = @"title";
static NSString *kViewControllerKey = @"viewController";
static NSString *kImageKey = @"image";


@implementation SportsRootViewController

@synthesize menuList;
@synthesize mensList;
@synthesize womensList;
@synthesize tvCell;


- (void)viewDidLoad {
    [super viewDidLoad];
	
	self.mensList = [NSMutableArray array];
	self.womensList = [NSMutableArray array];
	
	SportsViewController *baseballController = [[SportsViewController alloc] initWithNibName:@"sportsView" bundle:nil];
	[self.mensList addObject:[NSDictionary dictionaryWithObjectsAndKeys:NSLocalizedString(@"Baseball", @""), kTitleKey, NSLocalizedString(@"baseball.jpg", @""), kImageKey,  baseballController, kViewControllerKey,  nil]];
	[baseballController release];
	
	SportsViewController *mensBasketballController = [[SportsViewController alloc] initWithNibName:@"sportsView" bundle:nil];
	[self.mensList addObject:[NSDictionary dictionaryWithObjectsAndKeys:NSLocalizedString(@"Basketball", @""), kTitleKey, NSLocalizedString(@"basketball.jpg", @""), kImageKey, mensBasketballController, kViewControllerKey,nil]];
	[mensBasketballController release];
	
	SportsViewController *footballController = [[SportsViewController alloc] initWithNibName:@"sportsView" bundle:nil];
	[self.mensList addObject:[NSDictionary dictionaryWithObjectsAndKeys:NSLocalizedString(@"Football", @""), kTitleKey, NSLocalizedString(@"football.jpg", @""), kImageKey, footballController, kViewControllerKey,nil]];
	[footballController release];
	
	SportsViewController *mensGolfController = [[SportsViewController alloc] initWithNibName:@"sportsView" bundle:nil];
	[self.mensList addObject:[NSDictionary dictionaryWithObjectsAndKeys:NSLocalizedString(@"Golf", @""), kTitleKey, NSLocalizedString(@"golf.jpg", @""), kImageKey, mensGolfController, kViewControllerKey,nil]];
	[mensGolfController release];
	
	SportsViewController *mensSoccerController = [[SportsViewController alloc] initWithNibName:@"sportsView" bundle:nil];
	[self.mensList addObject:[NSDictionary dictionaryWithObjectsAndKeys:NSLocalizedString(@"Soccer", @""), kTitleKey, NSLocalizedString(@"soccer.jpg", @""), kImageKey, mensSoccerController, kViewControllerKey,nil]];
	[mensSoccerController release];
	
	SportsViewController *mensTennisController = [[SportsViewController alloc] initWithNibName:@"sportsView" bundle:nil];
	[self.mensList addObject:[NSDictionary dictionaryWithObjectsAndKeys:NSLocalizedString(@"Tennis", @""), kTitleKey, NSLocalizedString(@"tennis.jpg", @""), kImageKey, mensTennisController, kViewControllerKey,nil]];
	[mensTennisController release];
	
	SportsViewController *mensTrackController = [[SportsViewController alloc] initWithNibName:@"sportsView" bundle:nil];
	[self.mensList addObject:[NSDictionary dictionaryWithObjectsAndKeys:NSLocalizedString(@"Track", @""), kTitleKey, NSLocalizedString(@"trackandfield.jpg", @""), kImageKey, mensTrackController, kViewControllerKey,nil]];
	[mensTrackController release];
	
	SportsViewController *mensCrossCountryController = [[SportsViewController alloc] initWithNibName:@"sportsView" bundle:nil];
	[self.mensList addObject:[NSDictionary dictionaryWithObjectsAndKeys:NSLocalizedString(@"Cross Country", @""), kTitleKey, NSLocalizedString(@"crosscountry.jpg", @""), kImageKey, mensCrossCountryController, kViewControllerKey,nil]];
	[mensCrossCountryController release];
	
	SportsViewController *womensBasketballController = [[SportsViewController alloc] initWithNibName:@"sportsView" bundle:nil];
	[self.womensList addObject:[NSDictionary dictionaryWithObjectsAndKeys:NSLocalizedString(@"Basketball", @""), kTitleKey, NSLocalizedString(@"basketball.jpg", @""), kImageKey, womensBasketballController, kViewControllerKey,nil]];
	[womensBasketballController release];
	
	SportsViewController *fieldHockeyController = [[SportsViewController alloc] initWithNibName:@"sportsView" bundle:nil];
	[self.womensList addObject:[NSDictionary dictionaryWithObjectsAndKeys:NSLocalizedString(@"Field Hockey", @""), kTitleKey, NSLocalizedString(@"fieldhockey.jpg", @""), kImageKey, fieldHockeyController, kViewControllerKey,nil]];
	[fieldHockeyController release];
	
	SportsViewController *womensGolfController = [[SportsViewController alloc] initWithNibName:@"sportsView" bundle:nil];
	[self.womensList addObject:[NSDictionary dictionaryWithObjectsAndKeys:NSLocalizedString(@"Golf", @""), kTitleKey, NSLocalizedString(@"golf.jpg", @""), kImageKey, womensGolfController, kViewControllerKey,nil]];
	[womensGolfController release];
	
	SportsViewController *womensSoccerController = [[SportsViewController alloc] initWithNibName:@"sportsView" bundle:nil];
	[self.womensList addObject:[NSDictionary dictionaryWithObjectsAndKeys:NSLocalizedString(@"Soccer", @""), kTitleKey, NSLocalizedString(@"soccer.jpg", @""), kImageKey, womensSoccerController, kViewControllerKey,nil]];
	[womensSoccerController release];
	
	SportsViewController *womensTennisController = [[SportsViewController alloc] initWithNibName:@"sportsView" bundle:nil];
	[self.womensList addObject:[NSDictionary dictionaryWithObjectsAndKeys:NSLocalizedString(@"Tennis", @""), kTitleKey, NSLocalizedString(@"tennis.jpg", @""), kImageKey, womensTennisController, kViewControllerKey,nil]];
	[womensTennisController release];
	
	SportsViewController *womensTrackController = [[SportsViewController alloc] initWithNibName:@"sportsView" bundle:nil];
	[self.womensList addObject:[NSDictionary dictionaryWithObjectsAndKeys:NSLocalizedString(@"Track", @""), kTitleKey, NSLocalizedString(@"trackandfield.jpg", @""), kImageKey, womensTrackController, kViewControllerKey,nil]];
	[womensTrackController release];
	
	SportsViewController *volleyballController = [[SportsViewController alloc] initWithNibName:@"sportsView" bundle:nil];
	[self.womensList addObject:[NSDictionary dictionaryWithObjectsAndKeys:NSLocalizedString(@"Volleyball", @""), kTitleKey, NSLocalizedString(@"volleyball.jpg", @""), kImageKey, volleyballController, kViewControllerKey,nil]];
	[volleyballController release];
	
	SportsViewController *womensCrosseCountryController = [[SportsViewController alloc] initWithNibName:@"sportsView" bundle:nil];
	[self.womensList addObject:[NSDictionary dictionaryWithObjectsAndKeys:NSLocalizedString(@"Cross Country", @""), kTitleKey, NSLocalizedString(@"crosscountry.jpg", @""), kImageKey, womensCrosseCountryController, kViewControllerKey,nil]];
	[womensCrosseCountryController release];
	
	
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidUnload {
	// Release anything that can be recreated in viewDidLoad or on demand.
	// e.g. self.myOutlet = nil;
}

#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
	
	switch (section)
	{
			// Since sections 0, 1, and 2 all have the same return value - lets cut down on redundant return statements
		case 0:
			return @"Men's";
		case 1:
			return @"Women's";
	}
	
	return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return 61.0f;	
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	
	switch (section)
	{
			// Since sections 0, 1, and 2 all have the same return value - lets cut down on redundant return statements
		case 0:
			return [self.mensList count];
		case 1:
			return [self.womensList count];
	}
	
	return 0;
}


   //Old Working Code without custom cell
// Customize the appearance of table view cells.
/*- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
		 cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    }
    
	// Configure the cell.
	switch ( indexPath.section)
	{
	case 0:
		{
			NSDictionary *mDict = [self.mensList objectAtIndex:indexPath.row];
			cell.textLabel.text = [mDict objectForKey:kTitleKey];
			cell.detailTextLabel.text = [mDict objectForKey:kTitleKey];
			
			UIImage *theImage = [UIImage imageNamed:@"soccer.jpg"];
			cell.imageView.image = theImage;
		}break;
	case 1:
		{
			NSDictionary *wDict = [self.womensList objectAtIndex:indexPath.row];
			cell.textLabel.text = [wDict objectForKey:kTitleKey];
			cell.detailTextLabel.text = [wDict objectForKey:kTitleKey];
			UIImage *theImage = [UIImage imageNamed:@"soccer.jpg"];
			cell.imageView.image = theImage;
		}break;
		
	}
	return cell;
	

}*/


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    static NSString *MyIdentifier = @"CellOne";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
	
    if (cell == nil) {
        [[NSBundle mainBundle] loadNibNamed:@"customSportsCell" owner:self options:nil];
        cell = tvCell;
		  cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
        self.tvCell = nil;
    }
	
	switch ( indexPath.section)
	{
		case 0:
		{
			NSDictionary *mDict = [self.mensList objectAtIndex:indexPath.row];
			UILabel *label;
			UIImageView *picture;
			
			label = (UILabel *)[cell viewWithTag:1];
			label.text = [mDict objectForKey:kTitleKey];
			
			picture = (UIImageView *)[cell viewWithTag:2];
			NSString *imagePath = [mDict objectForKey:kImageKey];
			UIImage *theImage = [UIImage imageNamed:imagePath]; 
			picture.image = theImage;
		}break;
		case 1:
		{
			
			NSDictionary *mDict = [self.womensList objectAtIndex:indexPath.row];
			UILabel *label;
			UIImageView *picture;
			
			label = (UILabel *)[cell viewWithTag:1];
			label.text = [mDict objectForKey:kTitleKey];
			
			picture = (UIImageView *)[cell viewWithTag:2];
			NSString *imagePath = [mDict objectForKey:kImageKey];
			UIImage *theImage = [UIImage imageNamed:imagePath]; 
			picture.image = theImage;

		}break;
			
	}
	return cell;
	
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
	switch (indexPath.section)
	{
		case 0:
		{
		
			SportsViewController *targetViewController = [[self.mensList objectAtIndex: indexPath.row] objectForKey:kViewControllerKey];
			NSString *name = [[self.mensList objectAtIndex:indexPath.row] objectForKey:kTitleKey];
			targetViewController.sportsTypeMens = name;
			[[self navigationController] pushViewController:targetViewController animated:YES];
		
		}break;
		case 1:
		{
			
			SportsViewController *targetViewController = [[self.womensList objectAtIndex: indexPath.row] objectForKey:kViewControllerKey];
			NSString *name = [[self.womensList objectAtIndex:indexPath.row] objectForKey:kTitleKey];
			targetViewController.sportsTypeWomens = name;
			[[self navigationController] pushViewController:targetViewController animated:YES];
			
		}break;
			
	}
}

- (void)dealloc {
	[menuList release];	
	[super dealloc];
}


@end

