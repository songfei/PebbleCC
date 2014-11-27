/* This function resides in the executable /usr/sbin/BTLEServer */

@interface ANCService

//for iOS 7
- (void)alertAdded:(id)arg1 isSilent:(BOOL)arg2;

//for iOS 8
- (void)alertAdded:(id)arg1 isSilent:(BOOL)arg2 isPreExisting:(BOOL)arg3;

@end

@interface ANCBulletinAlert
-(id)date;
-(id)title;
-(id)message;
-(id)subtitle;
@end
