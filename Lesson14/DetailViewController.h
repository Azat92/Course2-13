//
//  DetailViewController.h
//  Lesson14
//
//  Created by Мария Тимофеева on 17.12.15.
//  Copyright © 2015 Azat Almeev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Item.h"
@interface DetailViewController : UIViewController
@property (strong, nonatomic) Item *item;

@property (weak, nonatomic) IBOutlet UITextView *fieldName;
@property (weak, nonatomic) IBOutlet UITextView *fieldCity;
@property (weak, nonatomic) IBOutlet UITextView *fieldState;
@property (weak, nonatomic) IBOutlet UITextView *fieldZip;

@property (weak, nonatomic) IBOutlet UILabel *itemClose;
@property (weak, nonatomic) IBOutlet UILabel *itemUpdated;

- (IBAction)editButton:(id)sender;

@end
