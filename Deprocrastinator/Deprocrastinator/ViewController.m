//
//  ViewController.m
//  Deprocrastinator
//
//  Created by Ryan Tiltz on 5/19/14.
//  Copyright (c) 2014 Ryan Tiltz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UITextField *myTextField;
@property NSString *addRowString;
@property NSMutableArray *textInputArray;
@property (strong, nonatomic) IBOutlet UITableView *myTableView;

@end

@implementation ViewController

- (void)viewDidLoad


{
    [super viewDidLoad];

    self.textInputArray = [NSMutableArray arrayWithObjects:@"Mow the lawn", @"Get Milk", @"Walk the Dog", @"Finish Stretches", nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

}



- (IBAction)onAddButtonPressed:(UIButton *)sender

{
    self.addRowString = self.myTextField.text;
    [self.textInputArray addObject:self.addRowString];
    [self.myTableView reloadData];
    [self.myTextField resignFirstResponder];
    self.myTextField.text = @"";

}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.textInputArray.count;

}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellID"];

    cell.textLabel.text = [self.textInputArray objectAtIndex:indexPath.row];

    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.textLabel.textColor = [UIColor greenColor];

}

@end
