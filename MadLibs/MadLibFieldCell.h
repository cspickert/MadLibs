//
//  FieldCell.h
//  MadLibs
//
//  Created by Cameron Spickert on 6/7/15.
//  Copyright (c) 2015 Cameron Spickert. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MadLibFieldCell : UITableViewCell

@property (nonatomic, copy) NSString *field;
@property (nonatomic, copy) NSString *input;
@property (nonatomic, copy) void (^valueChanged)(NSString *value);

@end
