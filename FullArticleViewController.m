//
//  FullArticleViewController.m
//  mainScreen
//
//  Created by VJ Cerniglia on 7/1/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "FullArticleViewController.h"
#import "SportsViewController.h"
#import "ReadFullArticleViewController.h"


@implementation FullArticleViewController

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
	ReadFullArticleViewController *viewController = [[ReadFullArticleViewController alloc] initWithNibName:@"readFullArticle" bundle:nil];
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
