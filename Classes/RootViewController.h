#import <UIKit/UIKit.h>

#import <AddressBookUI/AddressBookUI.h>

@interface RootViewController : UIViewController <ABPeoplePickerNavigationControllerDelegate> {
}

- (IBAction)sendEmail:(id)sender;

@end
