//
//  DetailViewController.m
//  Lesson14
//
//  Created by Мария Тимофеева on 17.12.15.
//  Copyright © 2015 Azat Almeev. All rights reserved.
//

#import "DetailViewController.h"
#import "DatabaseWorker.h"

@interface DetailViewController ()

@end

@implementation DetailViewController
bool edit = false;
- (void)viewDidLoad {
    [super viewDidLoad];
    _fieldName.text = [NSString stringWithFormat:@"%@", _item.name];
    _fieldCity.text = [NSString stringWithFormat:@"%@",_item.city];
    _fieldState.text = [NSString stringWithFormat:@"%@",_item.state];
    _fieldZip.text = [NSString stringWithFormat:@"%d", _item.zip];
    _itemClose.text = [NSString stringWithFormat:@"Close date: %@",_item.close_date ];
    _itemUpdated.text = [NSString stringWithFormat:@"Updates date: %@",_item.update_date ];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)editButton:(id)sender {
    if (edit){

        _fieldName.backgroundColor = [UIColor whiteColor];
        _fieldCity.backgroundColor = [UIColor whiteColor];
        _fieldState.backgroundColor = [UIColor whiteColor];
        _fieldZip.backgroundColor = [UIColor whiteColor];
        [_fieldName setEditable:false];
        [_fieldCity setEditable:false];
        [_fieldState setEditable:false];
        [_fieldZip setEditable:false];
        _item.name = _fieldName.text;
        _item.city = _fieldCity.text;
        _item.state = _fieldState.text;
        _item.zip =  [_fieldZip.text intValue];
        _item.update_date =[NSString stringWithFormat:@"%@", [NSDate date]];
        edit = false;
       _itemUpdated.text = [NSString stringWithFormat:@"Updates date: %@",_item.update_date ];
       [[DatabaseWorker new] updateRowWithId:_item.id Name: _item.name City:_item.city State:_item.state Zip:_item.zip Date:_item.update_date];
    }
    else {
        _fieldName.backgroundColor = [UIColor grayColor];
        _fieldCity.backgroundColor = [UIColor grayColor];
        _fieldState.backgroundColor = [UIColor grayColor];
        _fieldZip.backgroundColor = [UIColor grayColor];

        [_fieldName setEditable:true];
        [_fieldCity setEditable:true];
        [_fieldState setEditable:true];
        [_fieldZip setEditable:true];
        edit = true;
    }
}
@end
