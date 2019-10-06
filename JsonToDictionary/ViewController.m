//
//  ViewController.m
//  JsonToDictionary
//
//  Created by ryota on 2019/10/06.
//  Copyright © 2019 ryota. All rights reserved.
//

#import "ViewController.h"
#import "JsonObject.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *jsonString = @"[{\"title\":\"タイトル１\", \"content\":\"コンテンツ１\"}, {\"title\":\"タイトル２\", \"content\":\"コンテンツ２\"}]";

    // JSON文字列をNSDataに変換
    NSData *jsonData = [jsonString dataUsingEncoding:NSUnicodeStringEncoding];

    // JSONをNSArrayに変換
    NSError *error;
    NSArray *array = [NSJSONSerialization JSONObjectWithData:jsonData
                                                     options:NSJSONReadingAllowFragments
                                                       error:&error];

    // JSONのオブジェクトはNSDictionaryに変換
    NSMutableArray *results = [[NSMutableArray alloc] init];
    for (NSDictionary *obj in array)
    {
        JsonObject *jObject = [[JsonObject alloc] init];
        jObject.title = [obj objectForKey:@"title"];
        jObject.content = [obj objectForKey:@"content"];
        [results addObject:jObject];
    }
    NSLog(@"%@", results);
}


@end
