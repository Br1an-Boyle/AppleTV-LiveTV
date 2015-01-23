/**
 * This header is generated by class-dump-z 0.2a.
 * class-dump-z is Copyright (C) 2009 by KennyTM~, licensed under GPLv3.
 *
 * Source: /System/Library/PrivateFrameworks/BackRow.framework/BackRow
 */

#import "BackRow-Structs.h"
#import "BRControl.h"

@class NSArray;

@interface BRWaitSpinnerControl : BRControl {
@private
	NSArray *_spinnerImages;	// 40 = 0x28
	BOOL _spins;	// 44 = 0x2c
}
@property(assign) BOOL spins;	// G=0x31606645; S=0x315a57e5; converted property
- (id)init;	// 0x315a54e9
- (id)_generateSpinnerImages;	// 0x315a5545
- (void)controlWasActivated;	// 0x31606699
- (void)controlWasDeactivated;	// 0x31606655
- (void)dealloc;	// 0x315a6485
- (CGSize)preferredSize;	// 0x315a57a1
// converted property setter: - (void)setSpins:(BOOL)spins;	// 0x315a57e5
// converted property getter: - (BOOL)spins;	// 0x31606645
@end

