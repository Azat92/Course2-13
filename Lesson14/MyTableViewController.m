//
//  MyTableViewController.m
//  Lesson14
//
//  Created by Мария Тимофеева on 16.12.15.
//  Copyright © 2015 Azat Almeev. All rights reserved.
//

#import "MyTableViewController.h"
#import "DatabaseWorker.h"
#import "Item.h"
#import "DetailViewController.h"

@interface MyTableViewController ()
@property (strong, nonatomic) NSMutableArray *array;
@end

@implementation MyTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   _array = [[NSMutableArray alloc] initWithArray:[[DatabaseWorker new] getAllItems]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [_array count] ;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellId" forIndexPath:indexPath];
    Item *item = [Item new];
    item = [_array objectAtIndex:indexPath.row];
    int k = (int)indexPath.row +1;
    cell.textLabel.text =[NSString stringWithFormat:@"%d.%@", k, item.name] ;
    
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        Item *item = [Item new];
        item = [_array objectAtIndex:indexPath.row];
        [[DatabaseWorker new] deleteRowWithId:item.id];
        [_array removeObjectAtIndex:indexPath.row];
    
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]withRowAnimation:UITableViewRowAnimationFade];
    }
    [self.tableView reloadData];
}


// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showDetail"]) {
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    Item  *item = [_array objectAtIndex:indexPath.row];
    DetailViewController *dvc = segue.destinationViewController;
        dvc.item = item;
    }
    
    
}


@end
