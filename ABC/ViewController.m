#import "ViewController.h"

@implementation ViewController

static NSMutableArray *fib; // this instance variable implements the property

- (void) viewDidLoad {
	[super viewDidLoad];
	
	fib = [NSMutableArray.alloc init];
	[fib addObject: [NSNumber numberWithUnsignedInt: 0]];
	[fib addObject: [NSNumber numberWithUnsignedInt: 1]];
	
	unsigned int twoAgo = 0, oneAgo = 1, current;
	
	do {
		current = oneAgo + twoAgo;
		[fib addObject: [NSNumber numberWithUnsignedInt: current]];
		twoAgo = oneAgo, oneAgo = current;
	} while (oneAgo <= UINT_MAX - twoAgo);
}

- (void) didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
}

- (NSString *) tableView: (UITableView *) tableView titleForHeaderInSection: (NSInteger) section {
	return [NSString stringWithFormat: @"Fibonacci numbers under %u", UINT_MAX];
}

- (NSInteger) tableView: (UITableView *) tableView numberOfRowsInSection: (NSInteger) section {
	return fib.count;
}

- (UITableViewCell *) tableView: (UITableView *) tableView cellForRowAtIndexPath: (NSIndexPath *) indexPath {
	UITableViewCell *cell = UITableViewCell.alloc;
	cell = [cell initWithStyle: UITableViewCellStyleSubtitle reuseIdentifier: @"SimpleTableCell"];
	cell.textLabel.text = [[fib objectAtIndex: indexPath.row] stringValue];
	
	NSString *ordinal = @"th";
	if (indexPath.row / 10 != 1 && indexPath.row % 10 <= 3 && indexPath.row > 0)
		ordinal = indexPath.row % 10 == 1 ? @"st" : indexPath.row % 10 == 2 ? @"nd" : @"rd";
	
	cell.detailTextLabel.text = [NSString stringWithFormat: @"%u%@", (unsigned) indexPath.row, ordinal];
	
	return cell;
}

@end
