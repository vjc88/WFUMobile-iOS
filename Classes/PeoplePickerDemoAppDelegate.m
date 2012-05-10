//
//  PeoplePickerDemoAppDelegate.m
//  PeoplePickerDemo
//
//  Copyright Apple, Inc. 2008. All rights reserved.
//

#import "PeoplePickerDemoAppDelegate.h"
#import "RootViewController.h"


@implementation PeoplePickerDemoAppDelegate

@synthesize window;
@synthesize navigationController;
@synthesize tabBarController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {
	
	[window addSubview:tabBarController.view];
	//[window addSubview:[navigationController view]];
	[window makeKeyAndVisible];
}


- (void)applicationWillTerminate:(UIApplication *)application {
}


- (void)dealloc {
	 [tabBarController release];
	//[navigationController release];
	[window release];
	[super dealloc];
}

@end
