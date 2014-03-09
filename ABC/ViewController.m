//
//  ViewController.m
//  ABC
//
//  Created by Jeremy Hidajat on 3/9/2014.
//  Copyright (c) 2014 Jerry. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
    NSArray *fibTerms;
}

-(void)fibSe{
    NSMutableArray *fib = [[NSMutableArray alloc] init];
    [fib addObject: [NSString stringWithFormat:@"1"]];
    unsigned int oneAgo = 1, twoAgo = 0, current;
    do {
        current = oneAgo + twoAgo;
        [fib addObject:[NSString stringWithFormat:@"%d", current]];
        twoAgo = oneAgo, oneAgo = current;
        
    } while (oneAgo <= UINT_MAX - twoAgo);
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    NSMutableArray *fib = [[NSMutableArray alloc] init];
    [fib addObject: [NSString stringWithFormat:@"1"]];
    unsigned int oneAgo = 1, twoAgo = 0, current;
    do {
        current = oneAgo + twoAgo;
        [fib addObject:[NSString stringWithFormat:@"%d", current]];
        twoAgo = oneAgo, oneAgo = current;
    } while (twoAgo <= UINT_MAX - current - oneAgo);
    
    fibTerms = [NSArray arrayWithArray: fib];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [fibTerms count];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    cell.textLabel.text = [fibTerms objectAtIndex:indexPath.row];
    return cell;
}

@end
