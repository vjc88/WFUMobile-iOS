//
//  SportsViewController.h
//  mainScreen
//
//  Created by VJ Cerniglia on 6/29/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface SportsViewController : UITableViewController {
	
	IBOutlet UITableView * newsTable;
    IBOutlet UIActivityIndicatorView *activityIndicator;
	//IBOutlet UIView *view;
	NSString *sportsTypeMens;
	NSString *sportsTypeWomens;
	//UIActivityIndicatorView * activityIndicator;
	CGSize cellSize;
	NSXMLParser * rssParser;
	NSMutableArray * stories;
	UITableViewCell *tvCell;

	// a temporary item; added to the "stories" array one at a time, and cleared for the next one
	NSMutableDictionary * item;
	
	// it parses through the document, from top to bottom...
	// we collect and cache each sub-element value, and then save each item to our array.
	// we use these to track each current item, until it's ready to be added to the "stories" array
	NSString * currentElement;
	NSMutableString * currentTitle, * currentDate, * currentSummary, * currentLink, * currentPicture;
	int pictureLength;
	NSMutableString *pictureType;
	
	//UIActivityIndicatorView *activityIndicator;
}

@property (nonatomic, assign) IBOutlet UITableViewCell *tvCell;

@property (nonatomic, retain) NSString *sportsTypeMens;
@property (nonatomic, retain) NSString *sportsTypeWomens;
@property (nonatomic, retain) UIActivityIndicatorView *loginIndicator;


@end
