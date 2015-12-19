//
//  AddViewController.h
//  Lesson14
//
//  Created by Мария Тимофеева on 17.12.15.
//  Copyright © 2015 Azat Almeev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextView *fieldName;
@property (weak, nonatomic) IBOutlet UITextView *fiealdCity;
@property (weak, nonatomic) IBOutlet UITextView *fieldState;
@property (weak, nonatomic) IBOutlet UITextView *fielsZip;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneButton;
- (IBAction)addItem:(id)sender;


@end
