//
//  SampleClass.m
//  Lesson14
//
//  Created by Azat Almeev on 04.12.15.
//  Copyright © 2015 Azat Almeev. All rights reserved.
//

#import "SampleClass.h"

@implementation SampleClass
- (id)someMethodWithParam:(id)input onError:(NSError **)error {
    NSAssert(input != nil, @"Input should not be nil");
    if (!input) {
        if (error)
            *error = [NSError errorWithDomain:@"main" code:100 userInfo:@{ NSLocalizedDescriptionKey : @"Parameter is nil" }];
        return nil;
    }
    return @YES;
}
@end
