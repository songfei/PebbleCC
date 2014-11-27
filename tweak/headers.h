/* This function resides in the executable /usr/sbin/BTLEServer */

@interface ANCService

- (void)alertAdded:(id)arg1 isSilent:(BOOL)arg2;
- (void)alertAdded:(id)arg1 isSilent:(BOOL)arg2 isPreExisting:(BOOL)arg3;

@end

@interface ANCBulletinAlert
-(id)date;
-(id)title;
-(id)message;
-(id)subtitle;
@end
