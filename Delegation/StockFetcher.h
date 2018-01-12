//
//  StockFetcher.h
//  Delegation
//
//  Created by Jesse Sahli on 3/8/17.
//  Copyright © 2017 turntotech. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StockFetcherDelegate.h"

@interface StockFetcher : NSObject

-(void)fetchStockPriceForTicker: (NSString*) ticker;

@property (weak, nonatomic) id<StockFetcherDelegate> delegate;

@end
