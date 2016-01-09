//
//  addDataController.m
//  Lesson14
//
//  Created by Булат Замалутдинов on 09/01/16.
//  Copyright © 2016 Azat Almeev. All rights reserved.
//

#import "addDataController.h"
#import "peopleInfo.h"
#import "DatabaseWorker.h"
#import "TableViewController.h"

@interface addDataController ()

@end

@implementation addDataController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.worker = [DatabaseWorker database];
}
- (IBAction)addData:(id)sender {
    if(![self.nameLabel.text isEqualToString:@""] && ([self.ageLabel.text integerValue] <100)){
        [self.worker addDataWithName:self.nameLabel.text Surname:self.surnameLabel.text Age:[self.nameLabel.text integerValue] Gender:self.genderLabel.text];
    }
}





@end
