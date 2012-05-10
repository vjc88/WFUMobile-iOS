//
//  readEventViewController.h
//  WFUMobile
//
//  Created by V.J. Cerniglia on 3/28/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface readEventViewController : UIViewController {
	
	UILabel *articleTitle;
	UILabel *articleDate;
	UILabel *articleSummary;
	UIButton *articleButton;
	UIImageView *pic;
	
	// I-Vars
	NSString *title;
	NSString *date;
	NSString *summary;
	NSString *url;
	NSString *pictureURL;
}

@property (retain) IBOutlet UILabel *articleTitle;
@property (retain) IBOutlet UILabel *articleDate;
@property (retain) IBOutlet UILabel *articleSummary;
@property (retain) IBOutlet UIButton *articleButton;
@property (retain) IBOutlet UIImageView *pic;
@property NSString *title;
@property NSString *date;
@property NSString *summary;
@property NSString *url;
@property NSString *pictureURL;

- (IBAction)readArticleButton:(id)sender;


@end