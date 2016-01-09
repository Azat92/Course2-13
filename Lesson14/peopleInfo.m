//
//  peopleInfo.m
//  Lesson14
//
//  Created by Булат Замалутдинов on 09/01/16.
//  Copyright © 2016 Azat Almeev. All rights reserved.
//

#import "peopleInfo.h"

@implementation peopleInfo
@synthesize uniqueID = _uniqueID;
@synthesize name = _name;
@synthesize surname = _surname;
@synthesize age = _age;
@synthesize gender = _gender;



- (id)initWithUniqueID:(int)uniqueID Name:(NSString *)name Surname:(NSString *)surname Age:(int)age Gender:(NSString *)gender{
    if(self = [super init]){
        self.uniqueID = uniqueID;
        self.name = name;
        self.surname = surname;
        self.age = age;
        self.gender = gender;
    }
    return self;
}


@end
