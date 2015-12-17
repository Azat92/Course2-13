//
//  DatabaseWorker.h
//  Lesson14
//
//  Created by Azat Almeev on 04.12.15.
//  Copyright © 2015 Azat Almeev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DatabaseWorker : NSObject
- (void)createDatabase;
-(NSMutableArray* )getAllItems;
- (void)deleteRowWithId:(int )id;
- (void)updateRowWithId:(int )id Name:(NSString *)name City:(NSString *)city State:(NSString *)state Zip:(int)zip Date:(NSString *)date;
- (void)addRowWithName:(NSString *)name City:(NSString *)city State:(NSString *)state Zip:(int)zip Date:(NSString *)date;
@end
