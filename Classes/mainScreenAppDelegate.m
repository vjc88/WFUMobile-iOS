//
//  mainScreenAppDelegate.m
//  mainScreen
//
//  Created by VJ Cerniglia on 6/24/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "mainScreenAppDelegate.h"
#import "mainScreenViewController.h"


@implementation mainScreenAppDelegate

@synthesize window;

- (void)applicationDidFinishLaunching:(UIApplication *)application {    

	
	navigationController = [[UINavigationController alloc] init];
	mainScreenViewController *viewController = [[mainScreenViewController alloc] initWithNibName:@"splashScreen" bundle:nil];

	//add navigation view
	[navigationController pushViewController:viewController	animated:NO];
	[viewController release];
	
	//add main view
	[window addSubview: navigationController.view];
	[window makeKeyAndVisible];
}


- (void)dealloc {
	 [navigationController release];
    [window release];
    [super dealloc];
}


@end
