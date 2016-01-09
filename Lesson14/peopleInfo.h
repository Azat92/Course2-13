//
//  peopleInfo.h
//  Lesson14
//
//  Created by Булат Замалутдинов on 09/01/16.
//  Copyright © 2016 Azat Almeev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface peopleInfo : NSObject {
    int _uniqueID;
    NSString *_name;
    NSString *_surname;
    int _age;
    NSString *_gender;
}

@property (nonatomic) int uniqueID;
@property (nonatomic) NSString *name;
@property (nonatomic) NSString *surname;
@property (nonatomic) int age;
@property (nonatomic) NSString *gender;

- (id)initWithUniqueID:(int)uniqueID Name:(NSString *)name Surname:(NSString *)surname Age:(int)age Gender:(NSString *)gender;

@end
