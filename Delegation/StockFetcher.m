//
//  StockFetcher.m
//  Delegation
//
//  Created by Jesse Sahli on 3/8/17.
//  Copyright © 2017 turntotech. All rights reserved.
//

#import "StockFetcher.h"

@implementation StockFetcher


//calling delegate methods during the fetching process so that the delegate can respond accordingly

-(void)fetchStockPriceForTicker: (NSString*) ticker {
    
    //responds to selector is necessary for optional methods in our delegate protocol "StockFetcherDelegate", if our delegate does not implement them and we try to call them.. the app will crash
    
    if ([self.delegate respondsToSelector:@selector(stockFetchDidStart)]) {
        [self.delegate stockFetchDidStart];
    }
    
    NSString *urlString = [NSString stringWithFormat:@"http://finance.yahoo.com/d/quotes.csv?s=%@&f=a", ticker];
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
            if ([self.delegate respondsToSelector:@selector(stockFetchDidFailWithError:) ]) {
                
                //we are not on the main queue at this point so it is important to dispatch blocks
                dispatch_async(dispatch_get_main_queue(), ^{
                    
                    //communicate with the delegate that we have failed and give it the error object for further handling
                    [self.delegate stockFetchDidFailWithError:error];
                });
            }
        } else {
            NSString *priceString = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
            dispatch_async(dispatch_get_main_queue(), ^{
                
                //communicate with the delegate that we have succeeded in fetching a stock price and giving the delegate the stockprice for further processing
                [self.delegate stockFetchSuccessWithPriceString:priceString];
            });
        }
    }];
    [task resume];
}

@end
