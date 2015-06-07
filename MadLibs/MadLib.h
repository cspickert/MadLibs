//
//  MadLib.h
//  MadLibs
//
//  Created by Cameron Spickert on 6/7/15.
//  Copyright (c) 2015 Cameron Spickert. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MadLib : NSObject

@property (nonatomic, copy) NSArray *fields;
@property (nonatomic, copy) NSString *story;

- (NSString *)resultWithInputs:(NSArray *)inputs;

@end
