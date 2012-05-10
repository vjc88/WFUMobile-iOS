//
//  RootViewController.h
//  tableViewShell
//
//  Created by VJ Cerniglia on 6/29/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

@interface SportsRootViewController : UITableViewController {
	NSMutableArray *menuList;
	NSMutableArray *mensList;
	NSMutableArray *womensList;
	UITableViewCell *tvCell;
}



@property (nonatomic, retain) NSMutableArray *menuList;
@property (nonatomic, retain) NSMutableArray *mensList;
@property (nonatomic, retain) NSMutableArray *womensList;
@property (nonatomic, assign) IBOutlet UITableViewCell *tvCell;


@end
