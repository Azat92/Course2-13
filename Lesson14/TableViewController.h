//
//  TableViewController.h
//  Lesson14
//
//  Created by Булат Замалутдинов on 09/01/16.
//  Copyright © 2016 Azat Almeev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DatabaseWorker.h"

@interface TableViewController : UITableViewController<UITableViewDataSource,UITableViewDelegate>{
    NSMutableArray *_data;
}

@property (nonatomic) NSMutableArray *data;
@property (nonatomic) DatabaseWorker *worker;
@end
