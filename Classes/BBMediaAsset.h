//
//  BBMediaAsset.h
//  HelloWorld
//
//  Created by Brian Boyle on 05/01/2015.
//
//

#import <Foundation/Foundation.h>

@interface BBMediaAsset : BRBaseMediaAsset

@property (strong) NSString *mediaURL;

- (void)withMediaURL:(dispatch_block_t)success;

@end