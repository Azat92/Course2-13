//
//  ViewController.m
//  Lesson14
//
//  Created by Azat Almeev on 04.12.15.
//  Copyright © 2015 Azat Almeev. All rights reserved.
//

#import "ViewController.h"
#import "SampleClass.h"
#import "DatabaseWorker.h"

@interface MyProxy : NSProxy

@end

@implementation MyProxy
+ (instancetype)someProxy {
    return nil;
}

@end

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    DatabaseWorker *dbWorker = [DatabaseWorker new];
    [dbWorker createDatabase];
    NSLog(@"fvff");
    return;
    id stringRef = @"sdfsdf";
    NSObject *stringObj = stringRef;
    NSString *string = stringRef;
    SampleClass *sample = [SampleClass new];
    NSError *demoError;
    [sample someMethodWithParam:nil onError:nil];
    if (demoError)
        NSLog(@"%@", demoError);
    NSString *path = [[NSBundle mainBundle] pathForResource:@"JSON" ofType:@""];
    NSString *dataString = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    NSData *data = [dataString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error = nil;
    NSMutableDictionary *JSON = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers | NSJSONReadingMutableLeaves error:&error];
    if (error)
        NSLog(@"%@", error.localizedDescription);
    else
        NSLog(@"%@", [JSON valueForKeyPath:@"key2"]);
    
    JSON[@"key3"] = @{ @"kk1" : @"vv1", @"kk2" : @[@123, @234] };
    NSData *output = [NSJSONSerialization dataWithJSONObject:JSON options:0 error:nil];
    NSString *outputString = [[NSString alloc] initWithData:output encoding:NSUTF8StringEncoding];
    NSLog(@"%@", outputString);
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
