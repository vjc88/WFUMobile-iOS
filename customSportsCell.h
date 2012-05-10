//
//  customSportsCell.h
//  mainScreen
//
//  Created by VJ Cerniglia on 7/2/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface customSportsCell : UITableViewCell {
	
	UILabel *primaryLabel;
	//UILabel *secondaryLabel;
	UIImageView *myImageView;
	
	NSString *title;
	NSString *image;

}

@property NSString *title;
@property NSString *image;
@property IBOutlet UILabel *primaryLabel;
//@property(nonatomic,retain)UILabel *secondaryLabel;
@property(nonatomic,retain) IBOutlet UIImageView *myImageView;


@end