//
//  newsViewController.h
//  mainScreen
//
//  Created by VJ Cerniglia on 12/24/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "mainNewsViewController.h"


@interface newsViewController : UITableViewController {

	IBOutlet UITableView * newsTable;
    IBOutlet UIActivityIndicatorView *activityIndicator;
	
	NSString *sportsTypeMens;
	NSString *sportsTypeWomens;
	
	//UIActivityIndicatorView * activityIndicator;
	
	CGSize cellSize;
	
	NSXMLParser * rssParser;
	
	NSMutableArray * stories;
	
	
	UITableViewCell *tvCell;
	
	NSString *path;
	
	
	// a temporary item; added to the "stories" array one at a time, and cleared for the next one
	NSMutableDictionary * item;
	
	// it parses through the document, from top to bottom...
	// we collect and cache each sub-element value, and then save each item to our array.
	// we use these to track each current item, until it's ready to be added to the "stories" array
	NSString * currentElement;
	NSMutableString * currentTitle, * currentDate, * currentSummary, * currentLink, * currentPicture;
	
		NSMutableString *pictureType;
}

@property (nonatomic, assign) IBOutlet UITableViewCell *tvCell;
@property (nonatomic, retain) UIActivityIndicatorView *loginIndicator;

@property NSString *sportsTypeMens;
@property NSString *sportsTypeWomens;
@property NSString *path;


@end
