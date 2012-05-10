//
//  mainScreenAppDelegate.h
//  mainScreen
//
//  Created by VJ Cerniglia on 6/24/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CampusMapViewController;

@interface mainScreenAppDelegate : NSObject <UIApplicationDelegate> {
	UIWindow *window;
	UINavigationController *navigationController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end

