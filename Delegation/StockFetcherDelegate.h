//
//  StockFetcherDelegate.h
//  Delegation
//
//  Created by Jesse Sahli on 3/8/17.
//  Copyright © 2017 turntotech. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol StockFetcherDelegate <NSObject>

-(void)stockFetchSuccessWithPriceString: (NSString*) priceString;

@optional
-(void)stockFetchDidFailWithError: (NSError*) error;
-(void)stockFetchDidStart;


@end
