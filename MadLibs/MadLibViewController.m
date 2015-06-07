//
//  ViewController.m
//  MadLibs
//
//  Created by Cameron Spickert on 6/7/15.
//  Copyright (c) 2015 Cameron Spickert. All rights reserved.
//

#import "MadLibViewController.h"
#import "MadLibFieldCell.h"
#import "MadLib.h"

static NSString *const FieldCellIdentifier = @"FieldCell";

@interface MadLibViewController ()

@property (nonatomic) MadLib *madLib;
@property (nonatomic, readonly) NSArray *fields;
@property (nonatomic) NSMutableArray *inputs;

@end

@implementation MadLibViewController

@dynamic fields;

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self.tableView registerClass:[MadLibFieldCell class] forCellReuseIdentifier:FieldCellIdentifier];
}

#pragma mark -
#pragma mark Properties

- (MadLib *)madLib
{
    if (_madLib == nil) {
        _madLib = [[MadLib alloc] init];
        _madLib.fields = @[ @"Adjective", @"Adjective", @"Noun", @"Verb (Past)", @"Preposition", @"Adjective", @"Noun" ];
        _madLib.story = @"The {} {} {} {} {} the {} {}.";
    }
    return _madLib;
}

- (NSArray *)fields
{
    return self.madLib.fields;
}

- (NSMutableArray *)inputs
{
    if (_inputs == nil) {
        _inputs = [NSMutableArray array];
        for (NSInteger i = 0; i < self.madLib.fields.count; i++) {
            [_inputs addObject:@""];
        }
    }
    return _inputs;
}

#pragma mark -
#pragma mark Table view methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.fields.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MadLibFieldCell *cell = [tableView dequeueReusableCellWithIdentifier:FieldCellIdentifier forIndexPath:indexPath];

    NSString *field = self.fields[indexPath.row];
    cell.field = field;
    cell.input = self.inputs[indexPath.row];

    MadLibViewController *__weak weakSelf = self;
    cell.valueChanged = ^(NSString *value) {
        weakSelf.inputs[indexPath.row] = value;
    };

    return cell;
}

#pragma mark -
#pragma mark Interface actions

- (IBAction)doneButtonPressed:(id)sender
{
    NSString *result = [self.madLib resultWithInputs:self.inputs];
    [[[UIAlertView alloc] initWithTitle:nil message:result delegate:nil cancelButtonTitle:@"Close" otherButtonTitles:nil] show];
}

@end
