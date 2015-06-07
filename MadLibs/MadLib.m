//
//  MadLib.m
//  MadLibs
//
//  Created by Cameron Spickert on 6/7/15.
//  Copyright (c) 2015 Cameron Spickert. All rights reserved.
//

#import "MadLib.h"

@implementation MadLib

- (NSString *)resultWithInputs:(NSArray *)inputs
{
    if (inputs.count != self.fields.count) {
        return nil;
    }
    NSMutableString *result = [self.story mutableCopy];

    for (NSString *input in inputs) {
        NSRange range = [result rangeOfString:@"{}"];
        if (range.location == NSNotFound) {
            break;
        }
        [result replaceCharactersInRange:range withString:input];
    }
    return result;
}

@end
