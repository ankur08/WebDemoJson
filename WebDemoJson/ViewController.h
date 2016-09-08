//
//  ViewController.h
//  WebDemoJson
//
//  Created by ankur on 26/06/16.
//  Copyright © 2016 ankur. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailViewController.h"
@interface ViewController : UIViewController <UITableViewDataSource ,UITableViewDelegate>

@property (weak,nonatomic)NSString *address;
@property (weak,nonatomic)NSString *city;
@property (weak,nonatomic)NSString *state;
@property (weak,nonatomic)NSString *zip;

@end

