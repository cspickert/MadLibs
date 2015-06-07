//
//  FieldCell.m
//  MadLibs
//
//  Created by Cameron Spickert on 6/7/15.
//  Copyright (c) 2015 Cameron Spickert. All rights reserved.
//

#import "MadLibFieldCell.h"

@interface MadLibFieldCell () <UITextFieldDelegate>

@property (nonatomic, readonly) UITextField *textField;

@end

@implementation MadLibFieldCell

@synthesize textField = _textField;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if ((self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;

        for (UIView *view in @[ self.textField ]) {
            [self.contentView addSubview:view];
        }
        [self configureConstraints];

        [self.textField addTarget:self action:@selector(textFieldValueChanged:) forControlEvents:UIControlEventEditingChanged];
    }
    return self;
}

- (void)setField:(NSString *)field
{
    _field = field.copy;

    self.textField.placeholder = field;
}

- (UITextField *)textField
{
    if (_textField == nil) {
        _textField = [[UITextField alloc] init];
        _textField.translatesAutoresizingMaskIntoConstraints = NO;
        _textField.delegate = self;
    }
    return _textField;
}

- (void)prepareForReuse
{
    [super prepareForReuse];

    self.field = nil;
    self.valueChanged = nil;
}

- (void)configureConstraints
{
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.textField attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0]];

    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.textField attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];

    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.textField attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeWidth multiplier:0.8 constant:0]];
}

#pragma mark -
#pragma mark Text field methods

- (void)textFieldValueChanged:(UITextField *)textField
{
    if (self.valueChanged != nil) {
        self.valueChanged(textField.text);
    }
}

@end
