//
//  PhoneViewController.m
//  BluesBuddies
//
//  Created by David Kousemaker on 20-07-1229.
//  Copyright (c) 2012 iosSatellite. All rights reserved.
//

#import "PhoneViewController.h"

@interface PhoneViewController ()

@end

@implementation PhoneViewController
@synthesize phoneTableViewController;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	//UIImageView *image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Default" ]];

	//[self.tableView setBackgroundView:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"gradient" ]]];
	//self.tableView.alpha = 0.1f;
	
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 3;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section;
{
    if (section == 0) {
        return @"Help";
    }
    else if (section == 1)
    {
        return @"Helplines";
    }
    else
    {
        return @"Friends";

    }
    return @"";
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = (UITableViewCell *) [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    }   
    // Configure the cell...
    
    if (indexPath.section == 0)
    {
        switch (indexPath.row) {
            case 0:
                cell.textLabel.text = @"Safety";
                break;
            case 1:
                cell.textLabel.text = @"Guidelines";
                break;
            case 2:
                cell.textLabel.text = @"About";
                break;
                
            default:
                break;
        }
        
    }
    else if (indexPath.section == 1)
    {
        cell.detailTextLabel.text = @"0800 123456";
        switch (indexPath.row) {
            case 0:
                cell.textLabel.text = @"Samaritans";
                break;
            case 1:
                cell.textLabel.text = @"Hotline";
                break;
            case 2:
                cell.textLabel.text = @"Depression alliance";
                break;
                
            default:
                break;
        }
        
    }
    else
    {
        cell.detailTextLabel.text = @"0800 123456";
        switch (indexPath.row) {
            case 0:
                cell.textLabel.text = @"John";
                break;
            case 1:
                cell.textLabel.text = @"Jim";
                break;
            default:
                cell.textLabel.text = @"Sally";
                break;
                
        }
    }
//    cell.textLabel.text = @"Detail";

        
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

- (void)viewDidUnload {
    [self setPhoneTableViewController:nil];
    [super viewDidUnload];
}
@end
