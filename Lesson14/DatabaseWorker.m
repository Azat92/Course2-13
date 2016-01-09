//
//  DatabaseWorker.m
//  Lesson14
//
//  Created by Булат Замалутдинов on 09/01/16.
//  Copyright © 2016 Azat Almeev. All rights reserved.
//
#import <sqlite3.h>
#import "DatabaseWorker.h"
#import "peopleInfo.h"

static DatabaseWorker *_database;
@implementation DatabaseWorker
    
+(DatabaseWorker *)database{
    if(_database == nil){
        _database = [[DatabaseWorker alloc]init];
    }
    return _database;
}

- (NSMutableArray *)tableData {
    
    NSMutableArray *retval = [[NSMutableArray alloc] init];
    NSString *query = @"SELECT * FROM peopleInfo";
    sqlite3_stmt *statement;
    if (sqlite3_prepare_v2(_database, [query UTF8String], -1, &statement, nil)
        == SQLITE_OK) {
        while (sqlite3_step(statement) == SQLITE_ROW) {
            int uniqueId = sqlite3_column_int(statement, 0);
            char *nameChars = (char *) sqlite3_column_text(statement, 1);
            char *surnameChars = (char *) sqlite3_column_text(statement, 2);
            int age =sqlite3_column_int(statement, 3);
            char *genderChars = (char *) sqlite3_column_text(statement, 4);
            NSString *name = [[NSString alloc] initWithUTF8String:nameChars];
            NSString *surname = [[NSString alloc] initWithUTF8String:surnameChars];
            NSString *gender = [[NSString alloc] initWithUTF8String:genderChars];
            peopleInfo *info = [[peopleInfo alloc]initWithUniqueID:uniqueId Name:name Surname:surname Age:age Gender:gender];
            [retval addObject:info];
        }
        sqlite3_finalize(statement);
    }
    return retval;
    
}


- (void)addDataWithName:(NSString *)name Surname:(NSString *)surname Age:(int)age Gender:(NSString *)gender {
    NSString *query = @"insert into peopleInfo(name, surname, age, gender) values (?, ?, ?, ?)";
    sqlite3_stmt *statement;
    if (sqlite3_prepare_v2(_database, [query UTF8String], -1, &statement, NULL) == SQLITE_OK) {
        sqlite3_bind_text(statement, 1, [name UTF8String], -1, NULL);
        sqlite3_bind_text(statement, 2, [surname UTF8String], -1, NULL);
        sqlite3_bind_int(statement, 3, age);
        sqlite3_bind_text(statement, 4, [gender UTF8String], -1, NULL);
        if(sqlite3_step(statement) == SQLITE_DONE)
            NSLog(@"done");
        else
            NSLog(@"ERROR");
        sqlite3_reset(statement);
    }
}


-(void)deleteDataWithId:(int)ID{
    NSString *query = @"delete from peopleInfo where id = ?";
    sqlite3_stmt *statement;
    if (sqlite3_prepare_v2(_database, [query UTF8String], -1, &statement, NULL) == SQLITE_OK) {
        sqlite3_bind_int(statement, 1, ID);
        if(sqlite3_step(statement) == SQLITE_DONE)
            NSLog(@"done");
        else
            NSLog(@"ERROR");
        sqlite3_reset(statement);
    }
}


- (void)updateDataWithName:(NSString *)name Surname:(NSString *)surname Age:(int)age Gender:(NSString *)gender ID:(int)ID {
    NSString *query = @"update peopleInfo set name = ?, surname = ?, age = ?, gender = ? where id = ?)";
    sqlite3_stmt *statement;
    if (sqlite3_prepare_v2(_database, [query UTF8String], -1, &statement, NULL) == SQLITE_OK) {
        sqlite3_bind_text(statement, 1, [name UTF8String], -1, NULL);
        sqlite3_bind_text(statement, 2, [surname UTF8String], -1, NULL);
        sqlite3_bind_int(statement, 3, age);
        sqlite3_bind_text(statement, 4, [gender UTF8String], -1, NULL);
        sqlite3_bind_int(statement, 5, ID);
        if(sqlite3_step(statement) == SQLITE_DONE)
            NSLog(@"done");
        else
            NSLog(@"ERROR");
        sqlite3_reset(statement);
    }
}




- (id)init {
    if ((self = [super init])) {
        NSString *sqLiteDb = [[NSBundle mainBundle] pathForResource:@"peopleInfo"
                                                             ofType:@"sqlite3"];
        
        if (sqlite3_open([sqLiteDb UTF8String], &_database) != SQLITE_OK) {
            NSLog(@"Failed to open database!");
        }
    }
    return self;
}
-(void)dealloc{
    sqlite3_close(_database);
}
@end
