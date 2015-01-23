
/*
 
 ### EDITING HWBasicMenu.m 
 
	This class is pretty cut and dry, we have an init function, there are 9 functions and only 5 of them ever need to be tweaked for a new controller: init, previewControlForItem, itemForRow, itemSelected and itemForRow (and of course dealloc if you alloc any global variables that don't release themselves.)
 
 
 */

#import "BBChannelsMenu.h"
#import "BBMediaAsset.h"
@implementation BBChannelsMenu


- (id) init {
	if((self = [super init]) != nil) {
		NSLog(@"Initialising BBChannelsMenu");
		[self setListTitle:@"TV Shows"];
		
		//NSString *settingsPng = [[NSBundle bundleForClass:[HWBasicMenu class]] pathForResource:@"picture" ofType:@"png"];
		//BRImage *sp = [BRImage imageWithPath:settingsPng];
		BRImage *listImage = [[BRThemeInfo sharedTheme] gearImage];
        [self setListIcon:listImage horizontalOffset:0.0 kerningFactor:0.80];
		
		self.channelsList = [[NSMutableArray alloc] init];
		[self.channelsList addObject:@"First Object"];
		[self.channelsList addObject:@"Second Object"];
		
		[[self list] setDatasource:self];
		NSLog(@"Set datasource");
		return self;
		
	}
	return self;
}	


/* 
 
 these are the previews that are displayed on your left when a menu item has been selected, we use a basic case statement and return different images according to index
 
 */


- (id)previewControlForItem:(long)item

{
	BRImage *theImage = nil;
	switch (item) {
			
		case 0: //item one
		
			theImage = [[BRThemeInfo sharedTheme] largeGeniusIconWithReflection];
			break;
		
		case 1: //item two
			
			theImage = [[BRThemeInfo sharedTheme] largeWirelessImage];
			break;
		
	}
	
	/*
	 
	 there are more complex suppliers available for previewControllers, this one is just a basic one that returns and image with a reflection, we will delve into more complex examples in future tutorials.
	 
	 */
	
	BRImageAndSyncingPreviewController *obj = [[BRImageAndSyncingPreviewController alloc] init];
	
	[obj setImage:theImage];
    
    BRMetadataPreviewControl *previewControll = [[BRMetadataPreviewControl alloc] init];
    
    [previewControll setImageProxy:[BRURLImageProxy proxyWithURL:[NSURL URLWithString:@"http://static.filmon.com/tvguide/image%2F34769%2F2%2F1186171500000-34769-Klute-1185362992046/poster-277x350.jpg"]]];
	previewControll.showsMetadataImmediately = YES;
    BRMetadataControl *metadataControl = previewControll.metadataControl;
    [metadataControl setTitle:@"Yo yo yo"];
    [metadataControl setSummary:@"Summary!"];
    [metadataControl setAlignment:2];
    
    
	//return ([obj autorelease]);
	return previewControll;
}

/*
 
 here we handle selecting an object from the list, right now we just log out to the syslog which item was selected, you can obviously be more complex than that :) 
 */


- (void)itemSelected:(long)selected; {
	
	NSDictionary *currentObject = [self.channelsList objectAtIndex:selected];
	NSLog(@"item selected: %@", currentObject);
    BBMediaAsset *mediaAsset = [[BBMediaAsset alloc] init];
    [mediaAsset withMediaURL:^{
        NSError *error = nil;
        NSLog(@"Playing media item");
        BRMediaPlayer *mediaPlayer = [[BRMediaPlayerManager singleton] playerForMediaAsset:mediaAsset error:&error];
        if (error) {
            NSLog(@"Error : %@", error);
        }else {
            NSLog(@"Should play media");
            [[BRMediaPlayerManager singleton] presentPlayer:mediaPlayer options:nil];
        }
    }];
    
}
/*
 
 Here we handle what kind of items are displayed in our list, we set the title from our _names variable and add different accessories (think of UITableView item accessories, same kind of idea)
 
 */

- (id)itemForRow:(long)row {
	if(row > [self.channelsList count])
		return nil;

	BRMenuItem * result = [[BRMenuItem alloc] init];
	NSString *theTitle = [self.channelsList objectAtIndex:row];
	[result setText:theTitle withAttributes:[[BRThemeInfo sharedTheme] menuItemTextAttributes]];
    [result setDetailedText:@"blah blah blah" withAttributes:nil];
    [result setDefaultImage:[BRImage imageWithURL:[NSURL URLWithString:@"http://static.filmon.com/couch/channels/14/logo.png?v2"]]];
	switch (row) {
				
		case 0:
			
			[result addAccessoryOfType:0];
			
			break;
	
		case 1: 
			
			[result addAccessoryOfType:1]; //add a > to the menuItem on the far right.
			break;
			
		default:
			
			[result addAccessoryOfType:0];
			break;
	}
	
	return [result autorelease];
}

- (BOOL)rowSelectable:(long)selectable {
	return TRUE;
}

- (float)heightForRow:(long)row {
	return 88.0f;
}

- (long)itemCount {
	return [self.channelsList count];
}

- (id)titleForRow:(long)row {
	return [self.channelsList objectAtIndex:row];
}



@end
