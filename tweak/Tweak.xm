#import "headers.h"

%hook ANCService

- (void)alertAdded:(id)arg1 isSilent:(BOOL)arg2 isPreExisting:(BOOL)arg3
{
	%orig;
	//NSLog(@"\n===========================\n%@\n%@\n%@\n===========================",[arg1 title], [arg1 date], [arg1 message]);


	if(arg1)
	{
		NSString* sf_title = [NSString stringWithFormat:@"%@", [arg1 title]];
		NSString* sf_message = [NSString stringWithFormat:@"%@", [arg1 message]];
		NSString* sf_date = @"";

		NSDate* sf_temp_date = [arg1 date];
		if([sf_temp_date isKindOfClass:[NSDate class]])
		{
			sf_date = [NSString stringWithFormat:@"%lf",[sf_temp_date timeIntervalSince1970]];
		}
		
		if(sf_title && sf_title.length>0 && sf_message && sf_message.length>0)
		{
			dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{

			NSString* sf_urlstr = [[NSString stringWithFormat:@"http://127.0.0.1:8816/pebble_message?title=%@&message=%@&date=%@", sf_title,sf_message,sf_date] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];

			NSURL* sf_url = [NSURL URLWithString:sf_urlstr];

			//NSLog(@"%@",sf_url);

			if(sf_url)
			{
				NSString* sf_success = [NSString stringWithContentsOfURL:sf_url encoding:NSUTF8StringEncoding error:nil];

				if(![sf_success isEqualToString:@"OK"])
				{
					NSLog(@"[ChineseMessages4Pebble] Send Message Error!");
				}
			}
			
		});
		}
	}

}
%end
