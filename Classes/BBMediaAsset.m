//
//  BBMediaAsset.m
//  HelloWorld
//
//  Created by Brian Boyle on 05/01/2015.
//
//

#import "BBMediaAsset.h"

@implementation BBMediaAsset

// TODO how do we provide the other streams so the player can be adaptive?
- (void)withMediaURL:(dispatch_block_t)success;
{
    if (self.mediaURL) {
        success();
        return;
    }
    
    //Low stream
    self.mediaURL =@"http://198.179.30.109/live/14.low.stream/playlist.m3u8?id=0ad5aac39bb13fbea14028a945c12123cbacf48365b1919dba7237b1631e7ac4c17a6798a7760b2c09854120006ec20db05d50582919c6ec7dba57cd18cd37945ebf91d12cebbbfddc944d84829471cdae9522a7bb7b34d7624e8fc1b9cb37f600a76e07028fc1fbafdde03bf2057df422e9be84fe6d6d8c2a52fde522befe4fa818aec91ae32a04fd2438f9c1513a63517c30351983f16fdaf9a1b6af48e189bf6b200036e53d25";
    
    

    /*self.mediaURL = @"http://198.179.30.109/live/25.low.stream/playlist.m3u8?id=0ad5aac39bb13fbe0b187b850736ebb78b4280c8333b0be8895a888b05be1c89c49377d5d79bd30640f2172df069ca80d617ccf56dc3b7f23b4ea7fab901d8c72650fca16a7a5635965fc9638fb096253a18ef68b8237751fa8c7c8c083518d0273274d5e1c79cc7028c6a5daf22a239cc69a20a388a0ce9e245759b088b6eae6df426aec0de86773add817e841c06d54b897fa9e8cfe55f09e89a7aa8e2294b88e11e304a6fc83b";*/
    success();
}

#pragma mark - Actually implemented

// TODO Check if this is really required for an episode to be accepted by the
// playback manager, because this breaks our custom metadata preview control.
//
// This controls the way in which BRMetadataControl displays the metadata.
- (id)mediaType;
{
    return [BRMediaType streamingPodcast];
}

// TODO how do we provide the other streams so the player can be adaptive?
//- (id)mediaURL;
//{
//NSURL *highQuality = self.streamURLs[0];
//return [highQuality absoluteString];
//}

- (BOOL)hasBeenPlayed;
{
    return NO;//[[UZGPlistStore sharedStore] playedEpisodeForPath:self.path];
}

- (void)setHasBeenPlayed:(BOOL)played;
{
    //[[UZGPlistStore sharedStore] setPlayed:played forEpisodePath:self.path];
    //[self.delegate episodeMediaAsset:self hasBeenPlayed:played];
}

- (NSUInteger)duration;
{
    return 20;//[[UZGPlistStore sharedStore] durationOfEpisodeForPath:self.path];
}

- (void)setDuration:(NSUInteger)duration;
{
    //[[UZGPlistStore sharedStore] setDuration:duration forEpisodePath:self.path];
}

// Called when paused and when the user stops playback by navigating back.
- (void)setBookmarkTimeInSeconds:(unsigned int)seconds;
{
    //[[UZGPlistStore sharedStore] setBookmarkTime:seconds forEpisodePath:self.path];
    //[self.delegate episodeMediaAssetDidStopPlayback:self];
}

- (unsigned int)bookmarkTimeInSeconds;
{
    return 0;//[//[UZGPlistStore sharedStore] bookmarkTimeForEpisodePath:self.path];
}

#pragma mark BRMediaPreviewFactoryDelegate

- (BOOL)mediaPreviewShouldShowMetadata{
    return YES;
}
- (BOOL)mediaPreviewShouldShowMetadataImmediately{
    return YES;
}

#pragma mark BRMediaAsset
- (id)provider {
    return nil;
}

- (id)assetID {
    return @"1234";
};

- (id)titleForSorting {
    return @"360iDev Sample Video";
};

//-(id)title {
//  return @"360iDev Sample Video";
//}

- (id)artist {
    return @"Sony Pictures";
};

- (id)artistForSorting {
    return @"Sony Pictures";
};

- (id)AlbumName {
    return @"Album Name";
};

- (id)AlbumID {
    return @"1234";
}

- (id)TrackNum {
    return @"1";
};

- (id)composer {
    return nil;
};

- (id)composerForSorting {
    return nil;
};

//- (id)copyright {
//return nil;
//};

- (void)setUserStarRating:(float)fp8 {
    
};

- (float)starRating {
    return 4;
};

- (BOOL)isHD {
    return NO;
};

- (BOOL)isWidescreen {
    return YES;
};

- (BOOL)closedCaptioned {
    return NO;
};

- (BOOL)dolbyDigital {
    return NO;
};

- (long)performanceCount {
    return 1;
};

- (void)incrementPerformanceCount {
    
};

- (void)incrementPerformanceOrSkipCount:(unsigned int)fp8 {
    
};

//- (id)previewURL {
//// NSLog(@"%s (%d)", __PRETTY_FUNCTION__, __LINE__);
//// [super previewURL];
////NSString* moviePosterPath = [[NSBundle bundleForClass:[SampleVideoAsset class]] pathForResource:@"spiderman-poster" ofType:@"png"];
////return [NSURL fileURLWithPath:moviePosterPath];
//return nil;
//};
- (id)trickPlayURL {
    // NSLog(@"%s (%d)", __PRETTY_FUNCTION__, __LINE__);
    return nil;
};
//- (id)imageProxy {
//// NSLog(@"%s (%d)", __PRETTY_FUNCTION__, __LINE__);
//return nil;
////NSString* moviePosterPath = [[NSBundle bundleForClass:[SampleVideoAsset class]] pathForResource:@"spiderman-poster" ofType:@"png"];
////return [BRURLImageProxy proxyWithURL:[[NSURL fileURLWithPath:moviePosterPath] absoluteString]];
//};

- (id)imageProxyWithBookMarkTimeInMS:(unsigned int)fp8 {
    // NSLog(@"%s (%d)", __PRETTY_FUNCTION__, __LINE__);
    return nil;
    //NSString* moviePosterPath = [[NSBundle bundleForClass:[SampleVideoAsset class]] pathForResource:@"spiderman-poster" ofType:@"png"];
    //return [BRURLImageProxy proxyWithURL:[[NSURL fileURLWithPath:moviePosterPath] absoluteString]];
};
- (BOOL)hasCoverArt {
    return YES;
};
- (BOOL)isProtectedContent {
    return NO;
};
- (id)playbackRightsOwner {
    return nil;
};
- (BOOL)isDisabled {
    return NO;
};
- (id)collections {
    return nil;
};
- (id)primaryCollection {
    return nil;
};
- (id)artistCollection {
    return nil;
};
- (id)primaryCollectionTitle {
    return @"The Amazing Spider-Man";
};
- (id)primaryCollectionTitleForSorting {
    return nil;
};
- (int)primaryCollectionOrder {
    return 0;
};
- (int)physicalMediaID {
    return 0;
};
- (id)seriesName {
    return @"seriesName";
};
- (id)seriesNameForSorting {
    return nil;
};
- (id)broadcaster {
    return nil;
};

- (id)genres {
    return nil;
};
- (id)dateAcquired {
    return nil;
};
- (id)dateAcquiredString {
    return nil;
};
- (id)dateCreated {
    return nil;
};
- (id)dateCreatedString {
    return nil;
};
- (id)datePublishedString {
    return nil;
};
- (void)setBookmarkTimeInMS:(unsigned int)fp8 {
    NSLog(@"%s - %d", __PRETTY_FUNCTION__, fp8);
};
- (unsigned int)bookmarkTimeInMS {
    return 1;
};
- (unsigned int)startTimeInMS {
    return 1;
};
- (unsigned int)startTimeInSeconds {
    return 1;
};
- (unsigned int)stopTimeInMS {
    return 1;
};
- (unsigned int)stopTimeInSeconds {
    return 1;
};
- (id)lastPlayed {
    return nil;
};
- (void)setLastPlayed:(id)fp8 {
    
};
- (id)resolution {
    return nil;
};
- (BOOL)canBePlayedInShuffle {
    return YES;
};
- (BOOL)isLocal {
    return NO;
};
- (BOOL)isAvailable {
    return YES;
};
- (void)skip {
    
};
- (id)authorName {
    return nil;
};
- (id)keywords {
    return nil;
};
- (id)viewCount {
    return nil;
};
- (id)category {
    return nil;
};
- (BOOL)isInappropriate; {
    return NO;
}
- (int)grFormat {
    return 1;
};
- (void)willBeDeleted {
    // NSLog(@"%s (%d)", __PRETTY_FUNCTION__, __LINE__);
};
- (void)preparePlaybackContext{
    // NSLog(@"%s (%d)", __PRETTY_FUNCTION__, __LINE__);
};

- (void)cleanUpPlaybackContext {
    // NSLog(@"%s (%d)", __PRETTY_FUNCTION__, __LINE__);
};

- (long)parentalControlRatingSystemID {
    return 1;
};
- (long)parentalControlRatingRank {
    return 1;
};
- (BOOL)isExplicit {
    return NO;
};
- (BOOL)playable {
    return YES;
};
- (id)playbackMetadata {
    return nil;
};
/*
 - (void *)createMovieWithProperties:(void *)fp8 count:(long)fp12 {
 NSLog(@"createMovieWithProperties");
 };
 */
- (BOOL)isCheckedOut {
    return YES;
};
- (id)sourceID {
    return nil;
};
- (BOOL)isPlaying {
    return NO;
};
- (BOOL)isPlayingOrPaused {
    return NO;
};
- (id)publisher {
    return nil;
};
- (id)rating {
    return nil;
};
- (id)mediaDescription {
    return nil;
};
//- (id)mediaSummary {
//return nil;
//};
- (id)primaryGenre {
    return nil;
};
- (id)datePublished {
    return nil;
};
- (float)userStarRating {
    return 2;
};
- (id)cast {
    return nil;
};
- (id)directors {
    return nil;
};
- (id)producers {
    return nil;
};
- (BOOL)hasVideoContent {
    return YES;
};

#pragma mark BRImageProvider

- (NSString*) imageID {
    return nil;
}

// BRImageLoader *loader
- (void)registerAsPendingImageProvider:(id)loader {
    // NSLog(@"%s (%d)", __PRETTY_FUNCTION__, __LINE__);
}

- (void)loadImage:(id)loader{
    // NSLog(@"%s (%d)", __PRETTY_FUNCTION__, __LINE__);
}

@end
