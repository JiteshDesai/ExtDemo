
#import "StringMapping.h"

static StringMapping* sharedStrilgLocalizer = nil;

@implementation StringMapping

- (id)init {
	
	if(![super init]) return nil;
	

//    NSString *stringsPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"StringMapping.plist"];
//    dictLocalization = [[NSDictionary alloc] initWithContentsOfFile:stringsPath];
//
//    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//    if([defaults objectForKey:LANGUAGE_KEY] == nil)
//    {
//        [defaults setValue:@"en" forKey:LANGUAGE_KEY];
//        [defaults setValue:@"1" forKey:LANGUAGE_TYPE];
//        [defaults setValue:@"msg" forKey:@"msgKey"];
//        [defaults synchronize];
//    }
//    dictStringMappings = [dictLocalization objectForKey:[defaults objectForKey:LANGUAGE_KEY]];
    
    return self;
}

+ (StringMapping *)sharedMapping {
	
    @synchronized(self) {
		if(!sharedStrilgLocalizer) {
            
            sharedStrilgLocalizer = [[StringMapping alloc] init];
		}
	}
	return sharedStrilgLocalizer;
}

- (void)setLanguage {
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//    dictStringMappings = [dictLocalization objectForKey:[defaults objectForKey:LANGUAGE_KEY]];
}

- (NSString *)stringForKey:(NSString *)strKey {
    
    NSString *strMapping = [dictStringMappings objectForKey:strKey];
    if(strMapping.length == 0)
    {
        return strKey;
    }
    return strMapping;
}

-(NSString *)alertMsgForKey:(NSString *)strKey {
    
    NSDictionary *dictAlertgMappings = [dictStringMappings objectForKey:@"AlertMessages"];
    NSString *strMapping = [dictAlertgMappings objectForKey:strKey];
    return strMapping;
}

@end
