//
//  AddViewController.m
//  Lesson14
//
//  Created by Мария Тимофеева on 17.12.15.
//  Copyright © 2015 Azat Almeev. All rights reserved.
//

#import "AddViewController.h"
#import "DatabaseWorker.h"

@interface AddViewController ()

@end

@implementation AddViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}



- (IBAction)addItem:(id)sender {
    if([_fieldName.text isEqual:@""]|[_fiealdCity isEqual:@""]|[_fielsZip.text isEqual:@""]|[_fieldState.text isEqual:@""]){
    UIAlertController *alert =   [UIAlertController alertControllerWithTitle:@"Error" message:@"Please, fell all fields" preferredStyle:UIAlertControllerStyleActionSheet];
        [alert addAction:[UIAlertAction actionWithTitle:@"Ok!" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        }]];
    [self presentViewController:alert animated:YES completion:nil];
    
    }
    else{
        [[DatabaseWorker new] addRowWithName:_fieldName.text City:_fiealdCity.text State:_fieldState.text Zip:[_fielsZip.text intValue] Date:[NSString stringWithFormat:@"%@",[NSDate date]]];
        [self.navigationController popViewControllerAnimated:YES];
    }
}
@end
