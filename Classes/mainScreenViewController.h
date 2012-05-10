//
//  mainScreenViewController.h
//  mainScreen
//
//  Created by VJ Cerniglia on 6/24/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <AddressBookUI/AddressBookUI.h>

@interface mainScreenViewController : UIViewController  {
	UIWindow *window;
	UIScrollView *scrollView;
	UIView *containerView;
	UINavigationController *navigationController;	
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

- (IBAction)pushCampusMap:(id)sender;
- (IBAction)pushCalendar:(id)sender;
- (IBAction)pushDirectory:(id)sender;
- (IBAction)pushSports:(id)sender;
- (IBAction)pushNews:(id)sender;
- (IBAction)pushFood:(id)sender;
- (IBAction)pushWin:(id)sender;
- (IBAction)pushAbout:(id)sender;
- (IBAction)pushAlumni:(id)sender;

@end
