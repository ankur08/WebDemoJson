//
//  DetailViewController.h
//  WebDemoJson
//
//  Created by ankur on 26/06/16.
//  Copyright © 2016 ankur. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (weak,nonatomic)NSString *address1;
@property (weak,nonatomic)NSString *city1;
@property (weak,nonatomic)NSString *state1;
@property (weak,nonatomic)NSString *zip1;
@property (strong, nonatomic) IBOutlet UILabel *lbladdress;
@property (strong, nonatomic) IBOutlet UILabel *lblcity;

@property (strong, nonatomic) IBOutlet UILabel *lblstste;

@property (strong, nonatomic) IBOutlet UILabel *lblzip;





@end
