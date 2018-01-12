//
//  ViewController.h
//  Delegation
//
//  Created by Jesse Sahli on 3/8/17.
//  Copyright © 2017 turntotech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StockFetcherDelegate.h"

@interface ViewController : UIViewController <StockFetcherDelegate>

@property (strong, nonatomic) IBOutlet UILabel *priceLabel;
@property (strong, nonatomic) IBOutlet UITextField *tickerTextField;
- (IBAction)getPrice:(UIButton *)sender;

@end

