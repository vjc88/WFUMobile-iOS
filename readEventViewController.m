    //
//  readEventViewController.m
//  WFUMobile
//
//  Created by V.J. Cerniglia on 3/28/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "readEventViewController.h"
#import "ReadFullArticleViewController.h"


@implementation readEventViewController

@synthesize articleTitle;
@synthesize articleDate;
@synthesize articleSummary;
@synthesize articleButton;
@synthesize pic;
@synthesize title;
@synthesize date;
@synthesize summary;
@synthesize url;
@synthesize pictureURL;

- (void)viewWillAppear:(BOOL)animated
{
	
	NSData *picData = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:pictureURL]];
	UIImage *thePic = [[UIImage alloc] initWithData:picData];
	
	articleTitle.text = title;
	articleDate.text = date;
	articleSummary.text = summary;
	pic.image = thePic;
	
}

- (IBAction)readArticleButton:(id)sender {
	ReadFullArticleViewController *viewController = [[ReadFullArticleViewController alloc] initWithNibName:@"readEvent" bundle:nil];
	viewController.articleURL = url;
	[self.navigationController pushViewController:viewController animated:YES];
	[viewController release];
}


- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
	title = nil;
	date = nil;
	summary = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
