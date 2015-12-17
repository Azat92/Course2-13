//
//  Item.h
//  Lesson14
//
//  Created by Мария Тимофеева on 17.12.15.
//  Copyright © 2015 Azat Almeev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Item : NSObject
@property int id;
@property (strong,nonatomic) NSString *name;
@property (strong,nonatomic) NSString *city;
@property (strong,nonatomic) NSString *state;
@property int zip;
@property (strong,nonatomic) NSString *close_date;
@property (strong,nonatomic) NSString *update_date;
@end
