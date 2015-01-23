

@interface BBChannelsMenu : BRMediaMenuController

@property (nonatomic, strong) NSMutableArray *channelsList;

- (float)heightForRow:(long)row;
- (long)itemCount;
- (id)itemForRow:(long)row;
- (BOOL)rowSelectable:(long)selectable;
- (id)titleForRow:(long)row;

@end
