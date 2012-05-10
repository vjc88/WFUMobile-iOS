//
//  FullArticleViewController.h
//  mainScreen
//
//  Created by VJ Cerniglia on 7/1/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface FullArticleViewController : UIViewController {
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
