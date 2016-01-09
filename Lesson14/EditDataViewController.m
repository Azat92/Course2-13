//
//  EditDataViewController.m
//  Lesson14
//
//  Created by Булат Замалутдинов on 09/01/16.
//  Copyright © 2016 Azat Almeev. All rights reserved.
//

#import "EditDataViewController.h"
#import "TableViewController.h"

@interface EditDataViewController ()

@end

@implementation EditDataViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.worker = [DatabaseWorker database];
}

- (void)viewWillAppear:(BOOL)animated{
    self.nameLabel.text = self.info.name;
    self.surnameLabel.text = self.info.surname;
    self.ageLabel.text = [NSString stringWithFormat:@"%d",self.info.age];
    self.genderLabel.text = self.info.gender;
}

- (void)viewWillDisappear:(BOOL)animated{
    if(![self.nameLabel.text isEqualToString:@""] && ([self.ageLabel.text integerValue] <100)){
        [self.worker updateDataWithName:self.nameLabel.text Surname:self.surnameLabel.text Age:[self.ageLabel.text integerValue] Gender:self.genderLabel.text ID:self.info.uniqueID];
        self.info = nil;
    }else NSLog(@"Error,invalid arguments");
}


@end
