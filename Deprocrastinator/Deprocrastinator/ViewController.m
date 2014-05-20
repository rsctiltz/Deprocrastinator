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
@property (strong, nonatomic) IBOutlet UIButton *onEditButtonPressed;


@end

@implementation ViewController

- (void)viewDidLoad


{
    [super viewDidLoad];

    self.textInputArray = [NSMutableArray arrayWithObjects: @"Pick up Groceries", @"Pick up Kids", @"Walk the Dogs", @"Pay the Bills",nil];

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

    //if([cell.textLabel.textColor isEqual:@""])

    //{ cell.textLabel.textColor = [UIColor blackColor]; }

    return cell;
    
}

- (IBAction)onEditButtonPressed:(UIButton *)sender
{
    if([_onEditButtonPressed.currentTitle isEqualToString:@"Edit"])
    {
        [_onEditButtonPressed setTitle:@"Done" forState:UIControlStateNormal];
      
    }
    else
        [_onEditButtonPressed setTitle:@"Edit" forState:UIControlStateNormal];

}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.textLabel.textColor = [UIColor greenColor];

    if([self.onEditButtonPressed.currentTitle isEqualToString:@"Done"])
    {
        [self.textInputArray removeObject:cell.textLabel.text];
        [self.myTableView reloadData];
    }


}

@end
