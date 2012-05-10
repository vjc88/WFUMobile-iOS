//
//  pitMenuViewController.h
//  mainScreen
//
//  Created by V.J. Cerniglia on 4/23/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface pitMenuViewController : UITableViewController {
	NSMutableArray *listOfItems;
	NSMutableArray *webAdress;
	//NSString *dinningHall;
	int *cellValue;
}

//@property NSString *dinningHall;
@property int *cellValue;

@end
