//
//  TableViewController.m
//  Lesson14
//
//  Created by Булат Замалутдинов on 09/01/16.
//  Copyright © 2016 Azat Almeev. All rights reserved.
//

#import "TableViewController.h"
#import "DatabaseWorker.h"
#import "peopleInfo.h"
#import "EditDataViewController.h"
#import "addDataController.h"

@interface TableViewController ()

@end

@implementation TableViewController
@synthesize data = _data;


- (void)viewDidLoad {
    [super viewDidLoad];
    self.data = [DatabaseWorker database].tableData;
    self.worker = [DatabaseWorker database];
    
}

-(void)viewWillAppear:(BOOL)animated{
    [self.tableView reloadData];
    self.data = [DatabaseWorker database].tableData;
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"mainCell" forIndexPath:indexPath];
    peopleInfo *info = [_data objectAtIndex:indexPath.row];
    cell.detailTextLabel.text = info.surname;
    cell.textLabel.text = info.name;
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {return YES;}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_data removeObjectAtIndex:indexPath.row];
        [self.worker deleteDataWithId:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSIndexPath *indexPath = [[self tableView] indexPathForSelectedRow];
    if([segue.identifier isEqualToString:@"Show"]){
        EditDataViewController *evc = [segue destinationViewController];
        evc.info = [_data objectAtIndex:indexPath.row];
    }
}

- (IBAction)getBack:(UIStoryboardSegue *)segue{
    
}

@end
