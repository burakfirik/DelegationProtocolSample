//
//  ViewController.m
//  Delegation
//
//  Created by Jesse Sahli on 3/8/17.
//  Copyright © 2017 turntotech. All rights reserved.
//

#import "ViewController.h"
#import "StockFetcher.h"

@interface ViewController ()

@property (strong, nonatomic) StockFetcher *stockFetcher;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.stockFetcher = [[StockFetcher alloc]init];
    self.stockFetcher.delegate = self;
}

- (IBAction)getPrice:(UIButton *)sender {
    NSString *tickerSymbol = self.tickerTextField.text;
    [self.stockFetcher fetchStockPriceForTicker:tickerSymbol];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.tickerTextField resignFirstResponder];
}


#pragma mark Required Delegate Methods

-(void)stockFetchSuccessWithPriceString:(NSString *)priceString {
    NSLog(@"Stock price received");
    NSString *dollarSignPrice = [NSString stringWithFormat:@"$%@", priceString];
    self.priceLabel.text = dollarSignPrice;
}


#pragma mark Optional Delegate Methods

-(void)stockFetchDidFailWithError:(NSError *)error {
    NSLog(@"Couldn't fetch stock price, this is a description of the error:%@", error.localizedDescription);
    //do some sort of error handling here
}

-(void)stockFetchDidStart {
    NSLog(@"Initiating stock fetch...");
    //could start an activity indicator here
}

@end
