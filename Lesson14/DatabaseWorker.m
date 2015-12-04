//
//  DatabaseWorker.m
//  Lesson14
//
//  Created by Azat Almeev on 04.12.15.
//  Copyright © 2015 Azat Almeev. All rights reserved.
//

#import "DatabaseWorker.h"
#import <sqlite3.h>

@interface DatabaseWorker () {
    sqlite3 *_database;
}

@end

@implementation DatabaseWorker

- (void)createDatabase {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *basePath = paths.firstObject;
    NSString *dbPath = [basePath stringByAppendingPathComponent:@"banklist.sqlite3"];
    if (![[NSFileManager defaultManager] fileExistsAtPath:dbPath]) {
        NSString *resource = [[NSBundle mainBundle] pathForResource:@"banklist" ofType:@"sqlite3"];
        [[NSFileManager defaultManager] copyItemAtPath:resource toPath:dbPath error:nil];
    }
    if (sqlite3_open([dbPath UTF8String], &_database) != SQLITE_OK) {
        NSLog(@"Failed to open database!");
    }
    else {
//        [self executeSelect];
        [self findMyName];
//        [self addRowWithName:@"MY_INSERT_NAME" city:@"Kazan" andState:@"Tatarstan"];
    }
}

- (void)findMyName {
    NSString *query = @"SELECT id, name, city, state FROM failed_banks where name = ?";
    sqlite3_stmt *statement;
    if (sqlite3_prepare_v2(_database, [query UTF8String], -1, &statement, nil)
        == SQLITE_OK) {
        sqlite3_bind_text(statement, 1, [@"MY_INSERT_NAME" UTF8String], -1, NULL);
        while (sqlite3_step(statement) == SQLITE_ROW) {
            int uniqueId = sqlite3_column_int(statement, 0);
            char *nameChars = (char *) sqlite3_column_text(statement, 1);
            char *cityChars = (char *) sqlite3_column_text(statement, 2);
            char *stateChars = (char *) sqlite3_column_text(statement, 3);
            printf("%d\t%s\t%s\%s\n", uniqueId, nameChars, cityChars, stateChars);
        }
        sqlite3_finalize(statement);
    }
}

- (void)executeSelect {
    NSString *query = @"SELECT id, name, city, state FROM failed_banks ORDER BY close_date DESC";
    sqlite3_stmt *statement;
    if (sqlite3_prepare_v2(_database, [query UTF8String], -1, &statement, nil)
        == SQLITE_OK) {
        while (sqlite3_step(statement) == SQLITE_ROW) {
            int uniqueId = sqlite3_column_int(statement, 0);
            char *nameChars = (char *) sqlite3_column_text(statement, 1);
            char *cityChars = (char *) sqlite3_column_text(statement, 2);
            char *stateChars = (char *) sqlite3_column_text(statement, 3);
//            NSString *name = [[NSString alloc] initWithUTF8String:nameChars];
//            NSString *city = [[NSString alloc] initWithUTF8String:cityChars];
//            NSString *state = [[NSString alloc] initWithUTF8String:stateChars];
            printf("%d\t%s\t%s\%s\n", uniqueId, nameChars, cityChars, stateChars);
        }
        sqlite3_finalize(statement);
    }
}

- (void)addRowWithName:(NSString *)name city:(NSString *)city andState:(NSString *)state {
    NSString *query = @"insert into failed_banks(name, city, state) values (?, ?, ?)";
    sqlite3_stmt *statement;
    if (sqlite3_prepare_v2(_database, [query UTF8String], -1, &statement, NULL) == SQLITE_OK) {
        sqlite3_bind_text(statement, 1, [name UTF8String], -1, NULL);
        sqlite3_bind_text(statement, 2, [city UTF8String], -1, NULL);
        sqlite3_bind_text(statement, 3, [state UTF8String], -1, NULL);
        if(sqlite3_step(statement) == SQLITE_DONE)
            NSLog(@"done");
        else
            NSLog(@"ERROR");
        sqlite3_reset(statement);
    }
}


@end
