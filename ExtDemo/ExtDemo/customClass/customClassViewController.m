//
//  customClassViewController.m
//  NMT
//
//  Created by Bhavesh on 31/08/15.
//  Copyright (c) 2015 Haresh  Vavadiya. All rights reserved.
//

#import "customClassViewController.h"
#import "Chimbu-Bridge-Header.h"
#import "NSString+Extensions.h"
@interface customClassViewController ()
{
    NSDictionary *dictToReturn;
    UIView *bounceView;
    
    NSURLConnection *ReqCon;
    NSMutableData *ReqData;
    
    NSString *strNotificationName;
    UIView *hudView;
}

@end

@implementation customClassViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


-(void)alertMessage:(NSString *)message
{
    if([message isEqualToString:@"Error on server side"])
    {
        //message = ERROR_MESSAGE;
    }
    else if([message isEqualToString:@"Successfull Transaction"])
    {
        message = @"Done! 👍";
    }
    else if([message isEqualToString:@"Invalid User Token"])
    {
        message = @"Your session is expired! Please login again";
    }
    UIAlertView *av = [[UIAlertView alloc]initWithTitle:ALERT_TITLE message:message delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
    [av show];
//    UIAlertController * alert = [UIAlertController
//                                 alertControllerWithTitle:ALERT_TITLE
//                                 message:message
//                                 preferredStyle:UIAlertControllerStyleAlert];
//    UIAlertAction* okButton = [UIAlertAction
//                                actionWithTitle:@"Okay"
//                                style:UIAlertActionStyleDefault
//                                handler:^(UIAlertAction * action) {
//                                    //Handle your yes please button action here
//                                }];
//    [alert addAction:okButton];
//    
//    [self presentViewController:alert animated:YES completion:nil];
    
}
-(void)alertMessageWithTitle:(NSString *)message with :(NSString*)title
{
    UIAlertView *av = [[UIAlertView alloc]initWithTitle:title message:message delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
    [av show];
    
//    UIAlertController * alert = [UIAlertController
//                                 alertControllerWithTitle:title
//                                 message:message
//                                 preferredStyle:UIAlertControllerStyleAlert];
//    UIAlertAction* okButton = [UIAlertAction
//                               actionWithTitle:@"Okay"
//                               style:UIAlertActionStyleDefault
//                               handler:^(UIAlertAction * action) {
//                                   //Handle your yes please button action here
//                               }];
//    [alert addAction:okButton];
//    [self presentViewController:alert animated:YES completion:nil];
}


#pragma -mark LeftView In Out
-(void)moveLeftViewIn:(BOOL) animate view:(UIView *)view1
{
    CGRect pickerFrame = view1.frame;
    pickerFrame.origin.x = self.view.frame.size.width - pickerFrame.size.width;
    float animDuration = 0;
    if (animate)
    {
        if(view1.tag == 5555)
        {
            animDuration = 3;
        }
        else
        {
            animDuration = 0.3;
        }
    }
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:animDuration];
    
    view1.frame = pickerFrame;
    
    [UIView commitAnimations];
}

-(void)moveLeftViewOut:(BOOL) animate view:(UIView *)view1
{
    CGRect pickerFrame = view1.frame;
    pickerFrame.origin.x = self.view.frame.size.width+500;
    
    float animDuration = 0;
    
    if (animate)
    {
        animDuration = 0.3;
    }
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:animDuration];
    
    view1.frame = pickerFrame;
    
    [UIView commitAnimations];
}

#pragma -mark RightView In Out
-(void)moveRightViewIn:(BOOL) animate view:(UIView *)view1
{
    CGRect pickerFrame = view1.frame;
    pickerFrame.origin.x = 0;
    float animDuration = 0;
    if (animate)
    {
        if(view1.tag == 5556)
        {
             animDuration = 3;
        }
        else
        {
             animDuration = 0.3;
        }
       
    }
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:animDuration];
    
    view1.frame = pickerFrame;
    
    [UIView commitAnimations];
}

-(void)moveRightViewOut:(BOOL) animate view:(UIView *)view1
{
    
    CGRect pickerFrame = view1.frame;
    pickerFrame.origin.x =  0 - self.view.frame.size.width;
    
    float animDuration = 0;
    
    if (animate) {
        animDuration = 0.3;
    }
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:animDuration];
    
    view1.frame = pickerFrame;
    
    [UIView commitAnimations];
}

#pragma -mark Bottom Up Down
-(void)moveBottomViewIn:(BOOL) animate view:(UIView *)view1
{
    CGRect pickerFrame = view1.frame;
    pickerFrame.origin.y = self.view.frame.size.height - pickerFrame.size.height;
    float animDuration = 0;
    if (animate) {
        animDuration = 0.3;
    }
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:animDuration];
    
    view1.frame = pickerFrame;
    
    [UIView commitAnimations];
}
-(void)moveBottomViewOut:(BOOL) animate view:(UIView *)view1
{
    CGRect pickerFrame = view1.frame;
    pickerFrame.origin.y = self.view.frame.size.height;
    
    float animDuration = 0;
    
    if (animate) {
        animDuration = 0.3;
    }
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:animDuration];
    
    view1.frame = pickerFrame;
    
    [UIView commitAnimations];
}

#pragma -mark Top Up Down
-(void)moveTopViewIn:(BOOL) animate view:(UIView *)view1
{
    CGRect pickerFrame = view1.frame;
    pickerFrame.origin.y = 64;
    float animDuration = 0;
    if (animate) {
        animDuration = 0.3;
    }
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:animDuration];
    
    view1.frame = pickerFrame;
    
    [UIView commitAnimations];
}
-(void)moveTopViewOut:(BOOL) animate view:(UIView *)view1
{
    CGRect pickerFrame = view1.frame;
    pickerFrame.origin.y = 0 - pickerFrame.size.height;
    
    float animDuration = 0;
    
    if (animate) {
        animDuration = 0.3;
    }
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:animDuration];
    
    view1.frame = pickerFrame;
    
    [UIView commitAnimations];
}

#pragma -HUD
-(void)showSVHud:(NSString *)str
{
    [SVProgressHUD showWithMaskType:SVProgressHUDMaskTypeBlack];
}
-(void)hideSVHud
{
    [SVProgressHUD dismiss];
}

#pragma -mark Bounce Animation
-(void)bounceViewIn:(BOOL) animate view:(UIView *)view1
{
    CGRect screenSizeRef = [[UIScreen mainScreen] bounds];
    bounceView = view1;
    CGRect pickerFrame = screenSizeRef;
    pickerFrame.origin.x = screenSizeRef.size.width - pickerFrame.size.width;
    view1.frame = pickerFrame;
     [self openOverlayViewCreateAccount];
}
-(void)bounceViewOut:(BOOL) animate view:(UIView *)view1;
{
    CGRect screenSizeRef = [[UIScreen mainScreen] bounds];
    bounceView = view1;
    CGRect pickerFrame = screenSizeRef;
    pickerFrame.origin.x = screenSizeRef.size.width+5000;
    view1.frame = pickerFrame;
    
}

-(void)openOverlayViewCreateAccount
{
    bounceView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.001, 0.001);
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.3/1];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(bounce1AnimationStopped)];
    bounceView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.1, 1.1);
    [UIView commitAnimations];
    
}

- (void)bounce1AnimationStopped
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.3/1.5];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(bounce2AnimationStopped)];
    bounceView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.9, 0.9);
    [UIView commitAnimations];
}

- (void)bounce2AnimationStopped
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.3/2];
    bounceView.transform = CGAffineTransformIdentity;
    [UIView commitAnimations];
}
#pragma -mark Check Internet Connectivity
-(BOOL)checkInternet
{
    Reachability *networkRachable = [Reachability reachabilityForInternetConnection];
    NetworkStatus networkStatus = [networkRachable currentReachabilityStatus];
    if (networkStatus == NotReachable)
    {
        UIAlertView *av = [[UIAlertView alloc]initWithTitle:@"No Internet connection" message:@"Your request cannot be completed because you are not connected to Internet. Verify your data connection and try again." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        [av show];
        
//        UIAlertController * alert = [UIAlertController
//                                     alertControllerWithTitle:@"No Internet connection"
//                                     message:@"Your request cannot be completed because you are not connected to Internet. Verify your data connection and try again."
//                                     preferredStyle:UIAlertControllerStyleAlert];
//        UIAlertAction* okButton = [UIAlertAction
//                                   actionWithTitle:@"Okay"
//                                   style:UIAlertActionStyleDefault
//                                   handler:^(UIAlertAction * action) {
//                                       //Handle your yes please button action here
//                                   }];
//        [alert addAction:okButton];
//        [self presentViewController:alert animated:YES completion:nil];
        
        
        return NO;
    }
    return YES;
}
-(BOOL)checkInternetWithNoMessage
{
    Reachability *networkRachable = [Reachability reachabilityForInternetConnection];
    NetworkStatus networkStatus = [networkRachable currentReachabilityStatus];
    if (networkStatus == NotReachable)
    {
        return NO;
    }
    return YES;
}
#pragma -mark Replace Null with String
- (NSMutableDictionary *)dictionaryByReplacingNullsWithStrings:(NSMutableDictionary *)jobList
{
    NSMutableDictionary *replaced = [NSMutableDictionary dictionaryWithDictionary:jobList];
    const id nul = [NSNull null];
    const NSString *blank = @"";
    
    for (NSString *key in [replaced allKeys])
    {
        id object = [replaced objectForKey:key];
        if (object == nul)
        {
            [replaced setObject:blank
                         forKey:key];
        }
        else
            if ([object isKindOfClass:[NSDictionary class]])
            {
                [replaced setObject:[self replaceNullInNested:object]
                             forKey:key];
            }
            else
                if ([object isKindOfClass:[NSArray class]])
                {
                    NSMutableArray *dc = [[NSMutableArray alloc] init];
                    for (NSDictionary *tempDict in object)
                    {
                        [dc addObject:[self dictionaryByReplacingNullsWithStrings:tempDict]];
                    }
                    [replaced setObject:dc
                                 forKey:key];
                }
    }
    return replaced;
}

- (NSMutableDictionary *)replaceNullInNested:(NSMutableDictionary *)targetDict
{
    // make it to be NSMutableDictionary in case that it is nsdictionary
    NSMutableDictionary *m = [targetDict mutableCopy];
    NSMutableDictionary *replaced = [NSMutableDictionary dictionaryWithDictionary:m];
    const id nul = [NSNull null];
    const NSString *blank = @"";
    
    for (NSString *key in [replaced allKeys])
    {
        const id object = [replaced objectForKey:key];
        if (object == nul)
        {
            [replaced setObject:blank
                         forKey:key];
        }
        else
            if ([object isKindOfClass:[NSArray class]])
            {
                //            NSLog(@"found null inside and key is %@", key);
                // make it to be able to set value by create a new one
                NSMutableArray *a = [object mutableCopy];
                for (int i = 0; i < [a count]; i++)
                {
                    for (NSString *subKey in [[a objectAtIndex:i] allKeys])
                    {
                        if ([[object objectAtIndex:i] valueForKey:subKey] == nul)
                        {
                            [[object objectAtIndex:i] setValue:blank
                                                        forKey:subKey];
                        }
                    }
                }
                // replace the updated one with old one
                [replaced setObject:a
                             forKey:key];
            }
    }
    return replaced;
}
-(BOOL)validateABN : (NSString*) abn
{
    if(abn.length==11)
    {
        NSMutableArray *array = [NSMutableArray array];
        for (int i = 0; i < [abn length]; i++)
        {
            [array addObject:[NSString stringWithFormat:@"%c", [abn characterAtIndex:i]]];
            if(i==0)
            {
                [array replaceObjectAtIndex:0 withObject:[NSString stringWithFormat:@"%d",[[array objectAtIndex:0] intValue]-1]];
                [array replaceObjectAtIndex:0 withObject:[NSString stringWithFormat:@"%d",[[array objectAtIndex:0] intValue]*10]];
            }
            else if(i==1)
            {
                [array replaceObjectAtIndex:i withObject:[NSString stringWithFormat:@"%d",[[array objectAtIndex:i] intValue]*1]];
            }
            else if(i==2)
            {
                [array replaceObjectAtIndex:i withObject:[NSString stringWithFormat:@"%d",[[array objectAtIndex:i] intValue]*3]];
            }
            else if(i==3)
            {
                [array replaceObjectAtIndex:i withObject:[NSString stringWithFormat:@"%d",[[array objectAtIndex:i] intValue]*5]];
            }
            else if(i==4)
            {
                [array replaceObjectAtIndex:i withObject:[NSString stringWithFormat:@"%d",[[array objectAtIndex:i] intValue]*7]];
            }
            else if(i==5)
            {
                [array replaceObjectAtIndex:i withObject:[NSString stringWithFormat:@"%d",[[array objectAtIndex:i] intValue]*9]];
            }
            else if(i==6)
            {
                [array replaceObjectAtIndex:i withObject:[NSString stringWithFormat:@"%d",[[array objectAtIndex:i] intValue]*11]];
            }
            else if(i==7)
            {
                [array replaceObjectAtIndex:i withObject:[NSString stringWithFormat:@"%d",[[array objectAtIndex:i] intValue]*13]];
            }
            else if(i==8)
            {
                [array replaceObjectAtIndex:i withObject:[NSString stringWithFormat:@"%d",[[array objectAtIndex:i] intValue]*15]];
            }
            else if(i==9)
            {
                [array replaceObjectAtIndex:i withObject:[NSString stringWithFormat:@"%d",[[array objectAtIndex:i] intValue]*17]];
            }
            else if(i==10)
            {
                [array replaceObjectAtIndex:i withObject:[NSString stringWithFormat:@"%d",[[array objectAtIndex:i] intValue]*19]];
            }
            
        }
        int sum=0;
        for (int i = 0; i < array.count; i++)
        {
            
            sum = sum+[[array objectAtIndex:i] intValue];
        }
        if(sum%89==0)
        {
            return 1;
        }
        else
        {
            return 0;
        }
        
    }
    return 0;
}


-(NSString*)authenticationMethod:(NSString*)url
{
    NSString *secret = API_consumer_secret;
    
    NSString *encodedStr = [self hmacsha1:url secret:secret]; //see definition below
    NSLog(@"encodedStr: %@",encodedStr);
    
    NSString *encodedString = [self urlEncodeValue:encodedStr]; //see definition below
    NSLog(@"encodedString: %@",encodedString);
    return  encodedString;
}
- (NSString *)hmacsha1:(NSString *)data secret:(NSString *)key
{
    const char *cKey  = [key cStringUsingEncoding:NSASCIIStringEncoding];
    const char *cData = [data cStringUsingEncoding:NSASCIIStringEncoding];
    
    unsigned char cHMAC[CC_SHA1_DIGEST_LENGTH];
    
    CCHmac(kCCHmacAlgSHA1, cKey, strlen(cKey), cData, strlen(cData), cHMAC);
    
    NSData *HMAC = [[NSData alloc] initWithBytes:cHMAC length:sizeof(cHMAC)];
    
    NSString *hash = [HMAC base64Encoding];//[QSStrings encodeBase64WithData:HMAC];
    
    NSLog(@"Hash: %@", hash);
    
    return hash;
}



-(NSString *) genRandString {
    //fixing length of 4 chars
    NSString *letters = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    NSMutableString *randomString = [NSMutableString stringWithCapacity: 4];
    
    for (int i=0; i<4; i++) {
        [randomString appendFormat: @"%C", [letters characterAtIndex: arc4random() % [letters length]]];
    }
    
    return randomString;
}

- (NSString *)urlEncodeValue:(NSString *)str
{
    NSMutableString * output = [NSMutableString string];
    const unsigned char * source = (const unsigned char *)[str UTF8String];
    int sourceLen = strlen((const char *)source);
    for (int i = 0; i < sourceLen; ++i) {
        const unsigned char thisChar = source[i];
        if (thisChar == ' '){
            [output appendString:@"+"];
        } else if (thisChar == '.' || thisChar == '-' || thisChar == '_' || thisChar == '~' ||
                   (thisChar >= 'a' && thisChar <= 'z') ||
                   (thisChar >= 'A' && thisChar <= 'Z') ||
                   (thisChar >= '0' && thisChar <= '9')) {
            [output appendFormat:@"%c", thisChar];
        } else {
            [output appendFormat:@"%%%02X", thisChar];
        }
    }
    return output;   
    
}
-(NSString *)encodeURLWithUTF8:(NSString *)str
{
    //   NSString *strNew = [str stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSString *url = [NSString stringWithFormat:@"%@", [str stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    
    return url;
}




-(NSString *) randomStringWithLength: (int) len
{
    NSString *letters = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";

    NSMutableString *randomString = [NSMutableString stringWithCapacity: len];
    
    for (int i=0; i<len; i++) {
        [randomString appendFormat: @"%C", [letters characterAtIndex: arc4random_uniform([letters length])]];
    }
    
    return randomString;
}
- (CGFloat)heightForAttributedText:(NSAttributedString*)text font:(UIFont*)font withinWidth:(CGFloat)width
{
    font = [UIFont systemFontOfSize:17];
    
    CGRect rect = [text boundingRectWithSize:CGSizeMake(width, 10000) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading context:nil];
    return rect.size.height;
}
-(NSString *)convertDictToJSON:(NSMutableDictionary *)dict
{
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict // Here you can pass array or dictionary
                                                       options:NSJSONWritingPrettyPrinted // Pass 0 if you don't care about the readability of the generated string
                                                         error:&error];
    NSString *jsonString;
    if (jsonData) {
        jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        //This is your JSON String
        //NSUTF8StringEncoding encodes special characters using an escaping scheme
    } else {
        NSLog(@"Got an error: %@", error);
        jsonString = @"";
    }
    NSLog(@"Your JSON String is %@", jsonString);
    
    return jsonString;
}
-(NSString *)convertArrayToJSON:(NSMutableArray *)array
{
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:array // Here you can pass array or dictionary
                                                       options:NSJSONWritingPrettyPrinted // Pass 0 if you don't care about the readability of the generated string
                                                         error:&error];
    NSString *jsonString;
    if (jsonData) {
        jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        //This is your JSON String
        //NSUTF8StringEncoding encodes special characters using an escaping scheme
    } else {
        NSLog(@"Got an error: %@", error);
        jsonString = @"";
    }
    NSLog(@"Your JSON String is %@", jsonString);
    
    return jsonString;
}
-(NSMutableArray*)getDataFromDatabase:(NSString *) tblName
{
    NSString *strQuery = [NSString stringWithFormat:@"SELECT * FROM %@",tblName];
    NSMutableArray *arrOfData = [[NSMutableArray alloc] init];
    
    FMDatabase *database = [FMDatabase databaseWithPath:[@"chambuDatabse.db" pathInDocumentDirectory]];
    [database open];
    
    FMResultSet *rs = [database executeQuery:strQuery];
    while ([rs next])
    {
        [arrOfData addObject:[rs resultDictionary]];
    }
    return arrOfData;
}
-(NSMutableArray*)getDataFromProductTable:(NSString *) cateName withStatus:(NSString *)status
{
    NSString *strQuery;
    if([cateName.lowercaseString isEqualToString:@"Any".lowercaseString])
    {
        if([status isEqualToString:@"green"])
        {
            NSDateComponents *dateComponent = [[NSDateComponents alloc] init];
            dateComponent.month = 1;
            dateComponent.day = -1;
            NSCalendar *theCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
            NSDate* comparisionDate = [theCalendar dateByAddingComponents:dateComponent toDate:[NSDate date] options:0];
            NSDateFormatter * dateFormat = [[NSDateFormatter alloc] init];
           [dateFormat setDateFormat:@"yyyyMMdd"];
           NSString * date = [dateFormat stringFromDate:comparisionDate];
            strQuery = [NSString stringWithFormat:@"select *  from products where substr(expiry_date,7)||substr(expiry_date,4,2)||substr(expiry_date,1,2) > '%@' AND login_id = '%@'",date,[[NSUserDefaults standardUserDefaults]objectForKey:@"loginUserId"]];

        }
        else if([status isEqualToString:@"orange"])
        {
            NSDateFormatter * dateFormat = [[NSDateFormatter alloc] init];
            [dateFormat setDateFormat:@"yyyyMMdd"];
            NSDateComponents *dateComponent = [[NSDateComponents alloc] init];
            dateComponent.month = 1;
            dateComponent.day = -1;
            NSCalendar *theCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
            NSDate* comparisionDate = [theCalendar dateByAddingComponents:dateComponent toDate:[NSDate date] options:0];
            NSString * date = [dateFormat stringFromDate:comparisionDate];
            NSString * Todaydate = [dateFormat stringFromDate:[NSDate date]];
            strQuery = [NSString stringWithFormat:@"select *  from products where  substr(expiry_date,7)||substr(expiry_date,4,2)||substr(expiry_date,1,2) between '%@' AND '%@' AND login_id = '%@'",Todaydate,date,[[NSUserDefaults standardUserDefaults]objectForKey:@"loginUserId"]];
            
        }
        else if([status isEqualToString:@"red"])
        {
            NSDateFormatter * dateFormat = [[NSDateFormatter alloc] init];
            [dateFormat setDateFormat:@"yyyyMMdd"];
            NSString * date = [dateFormat stringFromDate:[NSDate date]];
            NSLog(@"%@",date);
            strQuery = [NSString stringWithFormat:@"select *  from products where  substr(expiry_date,7)||substr(expiry_date,4,2)||substr(expiry_date,1,2) < '%@' AND login_id = '%@'",date,[[NSUserDefaults standardUserDefaults]objectForKey:@"loginUserId"]];
        }
        else
        {
            strQuery = [NSString stringWithFormat:@"SELECT * FROM products WHERE login_id = '%@'",[[NSUserDefaults standardUserDefaults]objectForKey:@"loginUserId"]];
        }
    }
    else if([cateName.lowercaseString isEqualToString:@"isadded".lowercaseString])
    {
        if([status.lowercaseString isEqualToString:@"productid".lowercaseString])
        {
            strQuery = [NSString stringWithFormat:@"select prod_id from products where is_added= '%@' AND is_local= '%@' AND login_id = '%@'",@"yes",@"yes",[[NSUserDefaults standardUserDefaults]objectForKey:@"loginUserId"]];
        }
    }
    else if([cateName.lowercaseString isEqualToString:@"isedited".lowercaseString])
    {
        if([status.lowercaseString isEqualToString:@"productid".lowercaseString])
        {
            strQuery = [NSString stringWithFormat:@"select prod_id from products where is_edited= '%@' AND is_local= '%@' AND login_id = '%@'",@"yes",@"yes",[[NSUserDefaults standardUserDefaults]objectForKey:@"loginUserId"]];
        }
    }
    else if([cateName.lowercaseString isEqualToString:@"prodcount".lowercaseString])
    {
            strQuery = [NSString stringWithFormat:@"select * from products where category_name= '%@' AND login_id = '%@'",status,[[NSUserDefaults standardUserDefaults]objectForKey:@"loginUserId"]];
    }
    else
    {
        if([status isEqualToString:@"green"])
        {
            NSDateComponents *dateComponent = [[NSDateComponents alloc] init];
            dateComponent.month = 1;
            dateComponent.day = -1;
            NSCalendar *theCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
            NSDate* comparisionDate = [theCalendar dateByAddingComponents:dateComponent toDate:[NSDate date] options:0];
            NSDateFormatter * dateFormat = [[NSDateFormatter alloc] init];
            [dateFormat setDateFormat:@"yyyyMMdd"];
            NSString * date = [dateFormat stringFromDate:comparisionDate];
            strQuery = [NSString stringWithFormat:@"select *  from products where  substr(expiry_date,7)||substr(expiry_date,4,2)||substr(expiry_date,1,2) > '%@' AND category_name = '%@' AND login_id = '%@'",date,cateName,[[NSUserDefaults standardUserDefaults]objectForKey:@"loginUserId"]];
        }
        else if([status isEqualToString:@"orange"])
        {
            NSDateFormatter * dateFormat = [[NSDateFormatter alloc] init];
            [dateFormat setDateFormat:@"yyyyMMdd"];
            NSDateComponents *dateComponent = [[NSDateComponents alloc] init];
            dateComponent.month = 1;
            dateComponent.day = -1;
            NSCalendar *theCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
            NSDate* comparisionDate = [theCalendar dateByAddingComponents:dateComponent toDate:[NSDate date] options:0];
            NSString * date = [dateFormat stringFromDate:comparisionDate];
            NSString * Todaydate = [dateFormat stringFromDate:[NSDate date]];
            strQuery = [NSString stringWithFormat:@"select *  from products where  substr(expiry_date,7)||substr(expiry_date,4,2)||substr(expiry_date,1,2) between '%@' AND '%@' AND category_name = '%@' AND login_id = '%@'",Todaydate,date,cateName,[[NSUserDefaults standardUserDefaults]objectForKey:@"loginUserId"]];
        }
        else if([status isEqualToString:@"red"])
        {
            NSDateFormatter * dateFormat = [[NSDateFormatter alloc] init];
            [dateFormat setDateFormat:@"yyyyMMdd"];
            NSString * date = [dateFormat stringFromDate:[NSDate date]];
            strQuery = [NSString stringWithFormat:@"select *  from products where substr(expiry_date,7)||substr(expiry_date,4,2)||substr(expiry_date,1,2) <= '%@' AND category_name = '%@' AND login_id = '%@'",date,cateName,[[NSUserDefaults standardUserDefaults]objectForKey:@"loginUserId"]];
        }
        else
        {
            strQuery = [NSString stringWithFormat:@"SELECT * FROM products WHERE category_name = '%@' AND login_id = '%@'",cateName,[[NSUserDefaults standardUserDefaults]objectForKey:@"loginUserId"]];
        }
    }
    //CONTAINS[cd]
    NSMutableArray *arrOfData = [[NSMutableArray alloc] init];
    
    FMDatabase *database = [FMDatabase databaseWithPath:[@"chambuDatabse.db" pathInDocumentDirectory]];
    [database open];
    
    FMResultSet *rs = [database executeQuery:strQuery];
    while ([rs next])
    {
        [arrOfData addObject:[rs resultDictionary]];
    }
    NSLog(@"%@",arrOfData);
    return arrOfData;
}
-(NSMutableDictionary*)getProductData:(NSInteger) Id
{
    FMDatabase *database = [FMDatabase databaseWithPath:[@"chambuDatabse.db" pathInDocumentDirectory]];
    [database open];
    
    
    NSString *strQuery = [NSString stringWithFormat:@"SELECT * FROM products WHERE prod_id = '%ld'  AND login_id = '%@'",(long)Id,[[NSUserDefaults standardUserDefaults]objectForKey:@"loginUserId"]];
    FMResultSet *rs = [database executeQuery:strQuery];
    NSMutableArray *prod = [[NSMutableArray alloc]init];
    while ([rs next])
    {
        [prod addObject:[rs resultDictionary]];
    }
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    dict = [prod objectAtIndex:0];
    
    strQuery = [NSString stringWithFormat:@"SELECT * FROM documents WHERE doc_prod_id = '%ld' AND login_id = '%@' ",(long)Id,[[NSUserDefaults standardUserDefaults]objectForKey:@"loginUserId"]];
    NSMutableArray *prodDoc = [[NSMutableArray alloc]init];
    rs = [database executeQuery:strQuery];
    while ([rs next])
    {
        [prodDoc addObject:[rs resultDictionary]];
    }
    [dict setValue:prodDoc forKey:@"Documents"];
    NSLog(@"%@",dict);
    return  dict;
}
-(NSInteger)getLastIDFromDatabase
{
    NSString *strQuery = [NSString stringWithFormat:@"SELECT * FROM products ORDER BY prod_id DESC LIMIT 1;"];
    
    NSMutableArray *arrOfData = [[NSMutableArray alloc] init];
    
    FMDatabase *database = [FMDatabase databaseWithPath:[@"chambuDatabse.db" pathInDocumentDirectory]];
    [database open];
    
    FMResultSet *rs = [database executeQuery:strQuery];
    
    int nextID = 0;
    
    while ([rs next])
    {
        [arrOfData addObject:[rs resultDictionary]];
    }
    if(arrOfData.count != 0)
    {
        nextID = [[[arrOfData objectAtIndex:0] objectForKey:@"prod_id"] intValue];
    }
    return nextID + 1;
}

-(NSInteger)getLastIDFromDocument:(NSInteger) Id
{
    NSString *strQuery = [NSString stringWithFormat:@"SELECT * FROM documents ORDER BY doc_id DESC LIMIT 1;"];
    
    NSMutableArray *arrOfData = [[NSMutableArray alloc] init];
    
    FMDatabase *database = [FMDatabase databaseWithPath:[@"chambuDatabse.db" pathInDocumentDirectory]];
    [database open];
    
    FMResultSet *rs = [database executeQuery:strQuery];
    
    int nextID = 0;
    
    while ([rs next])
    {
        [arrOfData addObject:[rs resultDictionary]];
    }
    if(arrOfData.count != 0)
    {
        nextID = [[[arrOfData objectAtIndex:0] objectForKey:@"doc_id"] intValue];
    }
    return nextID + 1;
}

-(BOOL)insertDataIntoTable:(NSMutableArray *)arrSyncData intoTable:(NSString*)tblName
{
    //NSString *nextID = [self getLastIDFromDatabase];
    BOOL isCompleted;
    FMDatabase *database = [FMDatabase databaseWithPath:[@"chambuDatabse.db" pathInDocumentDirectory]];
    [database open];
    
    if ( ! [database open] ) {
        return NO;
    }
    
    [database beginTransaction];
    if([tblName isEqualToString:@"products"])
    {
        for (int i = 0;i<arrSyncData.count;i++)
        {
            NSMutableDictionary *dict = [[NSMutableDictionary alloc]initWithDictionary:[arrSyncData objectAtIndex:i]];
            if([[@"true" lowercaseString] isEqualToString:[[dict objectForKey:@"IsDeleted"] lowercaseString]])
            {
                NSString *str = [NSString stringWithFormat:@"DELETE FROM products where prod_id = '%d'",[[dict objectForKey:@"Id"] intValue]];
                
                isCompleted = [database executeUpdate:str];
                str = [NSString stringWithFormat:@"DELETE FROM documents where doc_prod_id = '%d'",[[dict objectForKey:@"Id"] intValue]];
                isCompleted = [database executeUpdate:str];
            }
            else
            {
                NSString *strQuery = [NSString stringWithFormat:@"INSERT OR REPLACE INTO products (prod_id,product_name,category_name,brand_name,purchased_from,purchase_date,expiry_date,service_type,duration,warranty_month,created,updated,is_deleted,prod_id_server,login_id,is_local,is_edited,is_added) VALUES ('%d', '%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%d','%@','%@','%@','%@');",[[dict objectForKey:@"Id"] intValue],[dict objectForKey:@"ProductName"],[dict objectForKey:@"CategoryName"],[dict objectForKey:@"BrandName"],[dict objectForKey:@"PurchaseFrom"],[dict objectForKey:@"PurchaseDate"],[dict objectForKey:@"WarrantyExpiryDate"],[dict objectForKey:@"ServiceType"],[dict objectForKey:@"Duration"],[dict objectForKey:@"WarrantyMonth"],[dict objectForKey:@"Created"],[dict objectForKey:@"Updated"],[dict objectForKey:@"IsDeleted"],123,[[NSUserDefaults standardUserDefaults]objectForKey:@"loginUserId"],@"no",@"no",@"no"];
                 isCompleted = [database executeUpdate:strQuery];
                if(isCompleted == true)
                {
                    NSMutableArray *docArray = [[NSMutableArray alloc]initWithArray:[dict objectForKey:@"Documents"]];
                    for (int j = 0;j<docArray.count;j++)
                    {
                        NSMutableDictionary *dictDoc = [[NSMutableDictionary alloc]initWithDictionary:[docArray objectAtIndex:j]];
                        
                        NSString *strQuery = [NSString stringWithFormat:@"INSERT OR REPLACE INTO documents (doc_id,file_name,document_type,doc_updated,doc_created,doc_prod_id,doc_id_server,login_id) VALUES ('%d', '%@','%@','%@','%@','%d','%d','%@');",[[dictDoc objectForKey:@"Id"] intValue],[dictDoc objectForKey:@"FilePath"],[dictDoc objectForKey:@"Type"],[dictDoc objectForKey:@"Updated"],[dictDoc objectForKey:@"Created"],[[dict objectForKey:@"Id"] intValue],123,[[NSUserDefaults standardUserDefaults]objectForKey:@"loginUserId"]];
                         isCompleted = [database executeUpdate:strQuery];
                    }
                }
            }
        }
    }
    else if ([tblName isEqualToString:@"categories"])
    {
        for (int i = 0;i<arrSyncData.count;i++)
        {
            //NSMutableDictionary *dict = [[NSMutableDictionary alloc]initWithDictionary:[arrSyncData objectAtIndex:i]];
            
            NSString *strQuery = [NSString stringWithFormat:@"INSERT OR REPLACE INTO categories (cat_id,cate_name) VALUES ('%d', '%@');",i + 1,[arrSyncData objectAtIndex:i]];
             isCompleted = [database executeUpdate:strQuery];
        }
    }
    else if ([tblName isEqualToString:@"brands"])
    {
        for (int i = 0;i<arrSyncData.count;i++)
        {
            //NSMutableDictionary *dict = [[NSMutableDictionary alloc]initWithDictionary:[arrSyncData objectAtIndex:i]];
            
            NSString *strQuery = [NSString stringWithFormat:@"INSERT OR REPLACE INTO brands (brand_id,brand_name) VALUES ('%d', '%@');",i + 1,[arrSyncData objectAtIndex:i]];
             isCompleted = [database executeUpdate:strQuery];
        }
    }
    else if ([tblName isEqualToString:@"retailers"])
    {
        for (int i = 0;i<arrSyncData.count;i++)
        {
            //NSMutableDictionary *dict = [[NSMutableDictionary alloc]initWithDictionary:[arrSyncData objectAtIndex:i]];
            
            NSString *strQuery = [NSString stringWithFormat:@"INSERT OR REPLACE INTO retailers (rt_id,rt_name) VALUES ('%d', '%@');",i + 1,[arrSyncData objectAtIndex:i]];
             isCompleted = [database executeUpdate:strQuery];
        }
    }
    else if ([tblName isEqualToString:@"documents"])
    {
        for (int i = 0;i<arrSyncData.count;i++)
        {
            NSMutableDictionary *dict = [[NSMutableDictionary alloc]initWithDictionary:[arrSyncData objectAtIndex:i]];
            
              NSString *strQuery = [NSString stringWithFormat:@"UPDATE documents SET doc_file_path = '%@' WHERE doc_prod_id = '%d' AND doc_id = '%d' AND login_id = '%@';", [dict objectForKey:@"FilePath"],[[dict objectForKey:@"ProductId"] intValue],[[dict objectForKey:@"Id"] intValue],[[NSUserDefaults standardUserDefaults]objectForKey:@"loginUserId"]];
             isCompleted = [database executeUpdate:strQuery];
        }

    }
    
    [database setShouldCacheStatements:NO];
    [database commit];
    [database close];
    
    return isCompleted;
}
-(BOOL)insertSingleDataIntoProductTable:(NSMutableDictionary *)dict
{
    //NSString *nextID = [self getLastIDFromDatabase];
    BOOL isCompleted;
    FMDatabase *database = [FMDatabase databaseWithPath:[@"chambuDatabse.db" pathInDocumentDirectory]];
    [database open];
    
    if ( ! [database open] ) {
        return NO;
    }
    
    [database beginTransaction];
    NSString *strQuery = [NSString stringWithFormat:@"INSERT OR REPLACE INTO products (prod_id,product_name,category_name,brand_name,purchased_from,purchase_date,expiry_date,service_type,duration,warranty_month,created,updated,is_deleted,prod_id_server,login_id,is_local,is_added) VALUES ('%d', '%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%d','%@','%@','%@');",[[dict objectForKey:@"Id"] intValue],[dict objectForKey:@"ProductName"],[dict objectForKey:@"CategoryName"],[dict objectForKey:@"BrandName"],[dict objectForKey:@"PurchaseFrom"],[dict objectForKey:@"PurchaseDate"],[dict objectForKey:@"WarrantyExpiryDate"],[dict objectForKey:@"ServiceType"],[dict objectForKey:@"Duration"],[dict objectForKey:@"WarrantyMonth"],[dict objectForKey:@"Created"],[dict objectForKey:@"Updated"],[dict objectForKey:@"IsDeleted"],123,[[NSUserDefaults standardUserDefaults]objectForKey:@"loginUserId"],@"yes",@"yes"];
     isCompleted = [database executeUpdate:strQuery];
    if(isCompleted == true)
    {
        NSMutableArray *docArray = [[NSMutableArray alloc]initWithArray:[dict objectForKey:@"Documents"]];
        for (int j = 0;j<docArray.count;j++)
        {
            NSMutableDictionary *dictDoc = [[NSMutableDictionary alloc]initWithDictionary:[docArray objectAtIndex:j]];
            
            NSString *strQuery = [NSString stringWithFormat:@"INSERT INTO documents (doc_id,file_name,document_type,doc_updated,doc_created,doc_prod_id,doc_id_server,doc_image_data,login_id) VALUES ('%d', '%@','%@','%@','%@','%d','%d','%@','%@');",[[dictDoc objectForKey:@"Id"] intValue],[dictDoc objectForKey:@"FilePath"],[dictDoc objectForKey:@"Type"],[dictDoc objectForKey:@"Updated"],[dictDoc objectForKey:@"Created"],[[dict objectForKey:@"Id"] intValue],123,[dictDoc objectForKey:@"ImageData"],[[NSUserDefaults standardUserDefaults]objectForKey:@"loginUserId"]];
             isCompleted = [database executeUpdate:strQuery];
        }
    }
    
    [database setShouldCacheStatements:NO];
    [database commit];
    [database close];
    
    return isCompleted;
}
-(BOOL)updateSingleDataIntoProductTable:(NSMutableDictionary *)dict
{
    //NSString *nextID = [self getLastIDFromDatabase];
    FMDatabase *database = [FMDatabase databaseWithPath:[@"chambuDatabse.db" pathInDocumentDirectory]];
    [database open];
    if ( ! [database open] ) {
        return NO;
    }
    [database beginTransaction];
    // delete document
    NSString *str = [NSString stringWithFormat:@"DELETE FROM documents where doc_prod_id = '%d'",[[dict objectForKey:@"Id"] intValue]];
    BOOL isDeleted = [database executeUpdate:str];
  
    NSString *strQuery = [NSString stringWithFormat:@"UPDATE products SET prod_id = '%d', product_name = '%@', category_name = '%@', brand_name = '%@', purchased_from = '%@', purchase_date = '%@', expiry_date = '%@', service_type = '%@', duration = '%@', warranty_month = '%@', created = '%@', updated = '%@', is_deleted= '%@', prod_id_server= '%d', login_id= '%@', is_local = '%@',is_edited = '%@' WHERE prod_id = '%d' AND login_id = '%@';",[[dict objectForKey:@"Id"] intValue],[dict objectForKey:@"ProductName"],[dict objectForKey:@"CategoryName"],[dict objectForKey:@"BrandName"],[dict objectForKey:@"PurchaseFrom"],[dict objectForKey:@"PurchaseDate"],[dict objectForKey:@"WarrantyExpiryDate"],[dict objectForKey:@"ServiceType"],[dict objectForKey:@"Duration"],[dict objectForKey:@"WarrantyMonth"],[dict objectForKey:@"Created"],[dict objectForKey:@"Updated"],[dict objectForKey:@"IsDeleted"],123,[[NSUserDefaults standardUserDefaults]objectForKey:@"loginUserId"],@"yes",@"yes",[[dict objectForKey:@"Id"] intValue],[[NSUserDefaults standardUserDefaults]objectForKey:@"loginUserId"]];
       BOOL isCompleted = [database executeUpdate:strQuery];
    
    if(isCompleted == true)
    {
        NSMutableArray *docArray = [[NSMutableArray alloc]initWithArray:[dict objectForKey:@"Documents"]];
        for (int j = 0;j<docArray.count;j++)
        {
            NSMutableDictionary *dictDoc = [[NSMutableDictionary alloc]initWithDictionary:[docArray objectAtIndex:j]];
            
            NSString *strQuery = [NSString stringWithFormat:@"INSERT INTO documents (doc_id,file_name,document_type,doc_updated,doc_created,doc_prod_id,doc_id_server,doc_image_data,login_id) VALUES ('%d', '%@','%@','%@','%@','%d','%d','%@','%@');",[[dictDoc objectForKey:@"Id"] intValue],[dictDoc objectForKey:@"FilePath"],[dictDoc objectForKey:@"Type"],[dictDoc objectForKey:@"Updated"],[dictDoc objectForKey:@"Created"],[[dict objectForKey:@"Id"] intValue],123,[dictDoc objectForKey:@"ImageData"],[[NSUserDefaults standardUserDefaults]objectForKey:@"loginUserId"]];
            BOOL isCompletedDoc = [database executeUpdate:strQuery];
        }
    }
    
    [database setShouldCacheStatements:NO];
    [database commit];
    [database close];
    
    return isCompleted;
}


-(BOOL)deleteSingleDataIntoProductTable:(NSInteger)Id
{
    FMDatabase *database = [FMDatabase databaseWithPath:[@"chambuDatabse.db" pathInDocumentDirectory]];
    [database open];
    BOOL isCompleted;
    if ( ! [database open] )
    {
        return NO;
    }
    
    [database beginTransaction];
    
    //NSString *str = [NSString stringWithFormat:@"DELETE FROM products where prod_id = '%d' AND login_id = '%@'",[[dict objectForKey:@"Id"] intValue],[[NSUserDefaults standardUserDefaults]objectForKey:@"loginUserId"]];
    
     NSString *strQuery = [NSString stringWithFormat:@"DELETE FROM products where prod_id = '%ld' AND login_id= '%@'",(long)Id,[[NSUserDefaults standardUserDefaults]objectForKey:@"loginUserId"]];
      isCompleted = [database executeUpdate:strQuery];
        if (isCompleted)
        {
            NSString *strQuery = [NSString stringWithFormat:@"DELETE FROM documents where doc_prod_id = '%ld' AND login_id= '%@'",(long)Id,[[NSUserDefaults standardUserDefaults]objectForKey:@"loginUserId"]];
             isCompleted = [database executeUpdate:strQuery];
        }
    [database setShouldCacheStatements:NO];
    [database commit];
    [database close];
    
    return isCompleted;
}

-(BOOL)setDeleteFlageIntoTable:(NSInteger) Id;
{
    FMDatabase *database = [FMDatabase databaseWithPath:[@"chambuDatabse.db" pathInDocumentDirectory]];
    [database open];
    
    if ( ! [database open] ) {
        return NO;
    }
    
    [database beginTransaction];
    
    
    NSString *strQuery = [NSString stringWithFormat:@"UPDATE products SET is_deleted = '%@' WHERE prod_id = '%ld' AND login_id = '%@';",@"true",(long)Id, [[NSUserDefaults standardUserDefaults]objectForKey:@"loginUserId"]];
    BOOL isCompleted = [database executeUpdate:strQuery];
    
    [database setShouldCacheStatements:NO];
    [database commit];
    [database close];
    
    return isCompleted;

}
-(BOOL)updateDataIntoTable:(NSMutableDictionary *)dict
{
    FMDatabase *database = [FMDatabase databaseWithPath:[@"passcode_db.sqlite" pathInDocumentDirectory]];
    [database open];
    
    if ( ! [database open] ) {
        return NO;
    }
    
    [database beginTransaction];
    
    //    NSString *strEncodedUsername = [[dict objectForKey:@"username"] base64EncodedString];
    //    NSString *strEncodedPassword = [[dict objectForKey:@"password"] base64EncodedString];
    NSString *strEncodedUsername = [dict objectForKey:@"username"];
    NSString *strEncodedPassword = [dict objectForKey:@"password"];
    
    NSString *strQuery = [NSString stringWithFormat:@"UPDATE tbl_passcode SET remark = '%@', username = '%@', password = '%@' WHERE id = '%@';", [dict objectForKey:@"remark"],strEncodedUsername,strEncodedPassword, [dict objectForKey:@"id"]];
    BOOL isCompleted = [database executeUpdate:strQuery];
    
    [database setShouldCacheStatements:NO];
    [database commit];
    [database close];
    
    return isCompleted;
}


-(BOOL)deletePasswordFromDatabase:(NSMutableDictionary *)dict
{
    FMDatabase *database = [FMDatabase databaseWithPath:[@"passcode_db.sqlite" pathInDocumentDirectory]];
    [database open];
    
    if ( ! [database open] ) {
        return NO;
    }
    
    [database beginTransaction];
    
    NSString *str = [NSString stringWithFormat:@"DELETE FROM tbl_passcode where id = '%@'",[dict objectForKey:@"id"]];
    BOOL isCompleted = [database executeUpdate:str];
    
    [database setShouldCacheStatements:NO];
    [database commit];
    [database close];
    
    return isCompleted;
}

-(void)copyAndPasteDB
{
    NSString *storedDB = [@"chambuDatabse.db" pathInDocumentDirectory];
    
    NSFileManager *manager = [NSFileManager defaultManager];
    if ([manager fileExistsAtPath:storedDB])
    return;
    
    NSString *dbPath = [[NSBundle mainBundle] pathForResource:@"chambuDatabse" ofType:@"db"];
    
    NSLog(@"%@",dbPath);
    
    NSError *copyingError;
    BOOL copyingSuccessfull = [manager copyItemAtPath:dbPath toPath:storedDB error:&copyingError];
    
    
    if (!copyingSuccessfull) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:ALERT_TITLE
                                                        message:@"Application behavior will be unknow. Please restart the application."
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
        
    }
}
@end
