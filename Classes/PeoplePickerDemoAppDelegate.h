//
//  PeoplePickerDemoAppDelegate.h
//  PeoplePickerDemo
//
//  Copyright Apple, Inc. 2008. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PeoplePickerDemoAppDelegate : NSObject <UIApplicationDelegate, UITabBarControllerDelegate> {
    
    UIWindow *window;
    UINavigationController *navigationController;
	UITabBarController *tabBarController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;
@property (nonatomic, retain) IBOutlet UITabBarController *tabBarController;

@end

