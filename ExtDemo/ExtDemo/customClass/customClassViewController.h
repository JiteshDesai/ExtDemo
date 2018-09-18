//
//  customClassViewController.h
//  NMT
//
//  Created by Bhavesh on 31/08/15.
//  Copyright (c) 2015 Haresh  Vavadiya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YBHud.h"
#import "constant.h"
#import <FMDB/FMDB.h>
@interface customClassViewController : UIViewController


-(void)alertMessage:(NSString *)message;
-(void)alertMessageWithTitle:(NSString *)message with :(NSString*)title;
-(BOOL)checkInternet;
-(BOOL)checkInternetWithNoMessage;
-(void)showSVHud:(NSString *)str;
-(void)hideSVHud;


-(void)moveLeftViewIn:(BOOL) animate view:(UIView *)view1;
-(void)moveLeftViewOut:(BOOL) animate view:(UIView *)view1;

-(void)moveRightViewIn:(BOOL) animate view:(UIView *)view1;
-(void)moveRightViewOut:(BOOL) animate view:(UIView *)view1;


-(void)moveBottomViewIn:(BOOL) animate view:(UIView *)view1;
-(void)moveBottomViewOut:(BOOL) animate view:(UIView *)view1;

-(void)moveTopViewIn:(BOOL) animate view:(UIView *)view1;
-(void)moveTopViewOut:(BOOL) animate view:(UIView *)view1;

-(void)bounceViewIn:(BOOL) animate view:(UIView *)view1;
-(void)bounceViewOut:(BOOL) animate view:(UIView *)view1;

- (NSMutableDictionary *)dictionaryByReplacingNullsWithStrings:(NSMutableDictionary *)jobList;
- (NSMutableDictionary *)replaceNullInNested:(NSMutableDictionary *)targetDict;

-(BOOL)validateABN : (NSString*) abn;


-(NSString *)encodeURLWithUTF8:(NSString *)str;

-(void)callAuthentication;
-(NSString *) randomStringWithLength: (int) len;
-(NSString*)authenticationMethod:(NSString*)nonce;
- (CGFloat)heightForAttributedText:(NSAttributedString*)text font:(UIFont*)font withinWidth:(CGFloat)width;

-(NSString *)convertDictToJSON:(NSMutableDictionary *)dict;
-(NSString *)convertArrayToJSON:(NSMutableArray *)array;

-(NSMutableArray*)getDataFromDatabase:(NSString *) tblName;
-(NSMutableDictionary*)getProductData:(NSInteger) Id;
-(NSMutableArray*)getDataFromProductTable:(NSString *) cateName withStatus:(NSString *)status;
-(BOOL)insertDataIntoTable:(NSMutableArray *)arrSyncData intoTable:(NSString*)tblName;
-(BOOL)insertSingleDataIntoProductTable:(NSMutableDictionary *)dict;
-(BOOL)updateSingleDataIntoProductTable:(NSMutableDictionary *)dict;
-(BOOL)deleteSingleDataIntoProductTable:(NSInteger)Id;
-(BOOL)updateDataIntoTable:(NSMutableDictionary *)dict;
-(BOOL)setDeleteFlageIntoTable:(NSInteger) Id;

-(BOOL)deletePasswordFromDatabase:(NSMutableDictionary *)dict;
-(NSInteger)getLastIDFromDatabase;
-(void)copyAndPasteDB;
@end
