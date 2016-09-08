//
//  ViewController.m
//  WebDemoJson
//
//  Created by ankur on 26/06/16.
//  Copyright © 2016 ankur. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSMutableArray *Array ;
}

@end

@implementation ViewController
{
        NSMutableArray *final;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    final = [[NSMutableArray alloc]init];
    
    NSURL *url = [NSURL URLWithString:@"https://data.colorado.gov/resource/4ykn-tg5h.json"];
    
    NSURLRequest *request=[NSURLRequest requestWithURL:url];
    
    NSError *error ;
    
    NSData *data =[NSURLConnection sendSynchronousRequest:request returningResponse:nil error:&error];
    
    Array = [NSJSONSerialization JSONObjectWithData:data options:nil error:&error];
    
    for (int i=0; i< Array.count; i++) {
     
        NSDictionary *first = [Array objectAtIndex:i];
        
        NSDictionary *locationdic=   [first objectForKey:@"location"];
  
        NSString *humanADD=[locationdic objectForKey:@"human_address"];
     
        if (humanADD != NULL) {
    
            NSData *strdata = [humanADD dataUsingEncoding:NSUTF8StringEncoding];
            
            NSDictionary *allDetail = [NSJSONSerialization JSONObjectWithData:strdata options:nil error:&error];
     
            [final addObject:allDetail];
            
        }
 
    }
       }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section

{
    return [Array count];
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath

{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (cell == nil)
    {
                        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    NSDictionary *homeDic = [final objectAtIndex:indexPath.row];
    cell.textLabel.text =  @"detail";//[homeDic objectForKey:@"address"];
    return cell;
  
}



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSDictionary *homeDic = [final objectAtIndex:indexPath.row];
    DetailViewController *Detail = [self.storyboard instantiateViewControllerWithIdentifier:@"detail"];
    
    Detail.address1 = homeDic[@"address"];
    
    Detail.city1 = homeDic[@"city"];
    
    Detail.state1 = homeDic[@"state"];
    
    Detail.zip1 = homeDic[@"zip"];
    
    [self.navigationController pushViewController:Detail animated:YES];

}



@end
