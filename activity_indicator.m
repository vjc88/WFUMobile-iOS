    //
//  activity_indicator.m
//  WakeMobile
//
//  Created by V.J. Cerniglia on 9/5/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "activity_indicator.h"


@implementation activity_indicator


- (void)viewDidLoad {
	[myActivityIndicator startAnimating];
}

- (void)viewWillDisappear: (BOOL)animated
{
	[myActivityIndicator stopAnimating];
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)dealloc {
    [super dealloc];
}


@end
