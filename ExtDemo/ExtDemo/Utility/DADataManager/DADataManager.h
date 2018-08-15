
#import <Foundation/Foundation.h>

@interface DADataManager : NSObject

- (NSString *)documentsPathForFileName:(NSString *)name;
- (NSString *)imagesPathForFileName:(NSString *)name;

- (BOOL)saveData:(NSData *)data toDocumentsFile:(NSString *)name;
- (BOOL)saveObject:(id)object toDocumentsFile:(NSString *)name;
- (BOOL)fileExistsInDocuments:(NSString *)name;
- (id)fetchJSONFromDocumentsFileName:(NSString *)name;

+ (DADataManager *)sharedManager;

@end
