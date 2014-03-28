#import <UIKit/UIKit.h>

@interface ViewController: UIViewController

@property (nonatomic) NSMutableArray *fib;  // no longer needs to be defined in implementation
- (void) viewDidLoad;
- (void) didReceiveMemoryWarning;
- (NSString *) tableView: (UITableView *) tableView titleForHeaderInSection: (NSInteger) section;
- (NSInteger) tableView: (UITableView *) tableView numberOfRowsInSection: (NSInteger) section;
- (UITableViewCell *) tableView: (UITableView *) tableView cellForRowAtIndexPath: (NSIndexPath *) indexPath;

@end
