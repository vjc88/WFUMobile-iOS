//
//  mainScreenViewController.m
//  mainScreen
//
//  Created by VJ Cerniglia on 6/24/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "mainScreenAppDelegate.h"
//#import "CampusMapViewController.h"
//#import "SportsViewController.h"
//#import "sportsTabBarViewController.h"
//#import "RootViewController.h"
//#import "PeoplePickerDemoAppDelegate.h"
//#import "FirstViewController.h"
//#import "newsViewController.h"

//Other View Controllers
#import "mainScreenViewController.h"

//Icon View Controllers
#import "rootCalendarView.h"
#import "SportsRootViewController.h"
#import "rootCampusMapViewController.h"
#import "DirectoryTableView.h"
#import "mainNewsViewController.h"
#import "pitScheduleViewController.h"
#import "winViewController.h"
#import "aboutWake.h"
#import "donateMoney.h"

#import "activity_indicator.h"
#import "ActivityAlertView.h"

@implementation mainScreenViewController

@synthesize window;

- (IBAction)pushCalendar:(id)sender
{
	rootCalendarView *myController = [[rootCalendarView alloc] init];
	[self.navigationController pushViewController:myController animated:YES];
	[myController release];
	[rootCalendarView release];
}

- (IBAction)pushAbout:(id)sender
{
	aboutWake *myController = [[aboutWake alloc] initWithNibName:@"aboutWake" bundle:nil ];
	[self.navigationController pushViewController:myController animated:YES];
	[myController release];
	[aboutWake release];
}

- (IBAction)pushAlumni:(id)sender
{
	donateMoney *myController = [[donateMoney alloc] initWithNibName:@"donateMoney" bundle:nil ];
	[self.navigationController pushViewController:myController animated:YES];
	[myController release];
	[donateMoney release];
}

- (IBAction)pushWin:(id)sender
{
	winViewController *myController = [[winViewController alloc] initWithNibName:@"winView" bundle:nil ];
	[self.navigationController pushViewController:myController animated:YES];
	[myController release];
	[winViewController release];
}

- (IBAction)pushSports:(id)sender
{
	//test ai
	//[self.navigationController pushViewController:activity_indicator];
	//[NSThread sleepForTimeInterval:5.0];
	
	// Show the alert
	//activityAlert = [[[ActivityAlertView alloc] initWithTitle:@"Doing Something" message:@"Please wait..." delegate:self cancelButtonTitle:nil otherButtonTitles:nil] autorelease];
	
	//[activityAlert show];
	
	//Remove the alert
	//[activityAlert close];
	
	/*[self.view setBackgroundColor:[UIColor blackColor]];
	UIActivityIndicatorView *myActivityView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
	CGRect activityFrame = CGRectMake(130, 100, 50, 50);
	[myActivityView setFrame:activityFrame];
	[myActivityView startAnimating];
	[self.view addSubview:myActivityView];
	[NSThread sleepForTimeInterval:5.0];
	[myActivityView stopAnimating];*/
	
	SportsRootViewController *myController = [[SportsRootViewController alloc] initWithNibName:@"sportsMain" bundle:nil ];
	[self.navigationController pushViewController:myController animated:YES];
	[myController release];
	[SportsRootViewController release];
}

- (IBAction)pushCampusMap:(id)sender
{
	rootCampusMapViewController *myController = [[rootCampusMapViewController alloc] initWithNibName:@"campusMapTable2" bundle:nil ];
	[self.navigationController pushViewController:myController animated:YES];
	[myController release];
	[rootCampusMapViewController release];
}

- (IBAction)pushDirectory:(id)sender
{
	DirectoryTableView *myController = [[DirectoryTableView alloc] init];
	[self.navigationController pushViewController:myController animated:YES];
	[myController release];
	[DirectoryTableView release];
}

- (IBAction)pushNews:(id)sender
{
	mainNewsViewController *myController = [[mainNewsViewController alloc] init];
	[self.navigationController pushViewController:myController animated:YES];
	[myController release];
	[mainNewsViewController release];
}

- (IBAction)pushFood:(id)sender
{
	pitScheduleViewController *myController = [[pitScheduleViewController alloc] init];
	[self.navigationController pushViewController:myController animated:YES];
	[myController release];
	[pitScheduleViewController release];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
