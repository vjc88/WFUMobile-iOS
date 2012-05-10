#import "RootViewController.h"
#import "PeoplePickerDemoAppDelegate.h"
#import "SportsRootViewController.h"

#import <AddressBook/AddressBook.h>

@implementation RootViewController

- (void)dealloc {
    [super dealloc];
}

- (void)doSendEmail:(NSString*)email
{
    NSString *emailToOpen = [NSString stringWithFormat:@"mailto:%@", email];
    NSURL *url = [NSURL URLWithString:emailToOpen];
    [[UIApplication sharedApplication] openURL:url];
}

- (IBAction)sendEmail:(id)sender
{
    ABPeoplePickerNavigationController *ppnc = [[ABPeoplePickerNavigationController alloc] init];
    ppnc.peoplePickerDelegate = self;
    ppnc.displayedProperties = [NSArray arrayWithObject:[NSNumber numberWithInt:kABPersonEmailProperty]];
    [self presentModalViewController:ppnc animated:YES];
    [ppnc release];
}

- (void)peoplePickerNavigationControllerDidCancel:(ABPeoplePickerNavigationController *)peoplePicker
{
    [self dismissModalViewControllerAnimated:YES];
}

- (BOOL)peoplePickerNavigationController:(ABPeoplePickerNavigationController *)peoplePicker shouldContinueAfterSelectingPerson:(ABRecordRef)person
{
    BOOL done = NO;
    
    if (person) {
        ABMultiValueRef emails = ABRecordCopyValue(person, kABPersonEmailProperty);
        if (emails && ABMultiValueGetCount(emails) == 1) {
            done = YES;
            NSString *email = (NSString*)ABMultiValueCopyValueAtIndex(emails, 0);
            [self doSendEmail:email];
            [email release];
        }
        
        if (emails) {
            CFRelease(emails);
        }
    }
    
    if (done) {
        [self dismissModalViewControllerAnimated:YES];
    }
	
    return !done;
}

- (BOOL)peoplePickerNavigationController:(ABPeoplePickerNavigationController *)peoplePicker shouldContinueAfterSelectingPerson:(ABRecordRef)person property:(ABPropertyID)property identifier:(ABMultiValueIdentifier)identifier
{
    [self dismissModalViewControllerAnimated:YES];
    
    if (person) {
        ABMultiValueRef emails = ABRecordCopyValue(person, kABPersonEmailProperty);
        if (emails) {
            CFIndex index = ABMultiValueGetIndexForIdentifier(emails, identifier);
            NSString *email = (NSString*)ABMultiValueCopyValueAtIndex(emails, index);
            [self doSendEmail:email];
            [email release];
            
            CFRelease(emails);
        }
    }
    return NO;
}

@end

