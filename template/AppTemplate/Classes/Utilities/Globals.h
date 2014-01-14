//
//  Globals.h
//  AppTemplate
//
//  Created by Kevin Renskers on 14-01-14.
//  Copyright (c) 2014 Gangverk. All rights reserved.
//

typedef void (^CompletionBlock)();
typedef void (^CompletionBlockWithObject)(id result);
typedef void (^CompletionBlockWithArray)(NSArray *results);
typedef void (^CompletionBlockWithDictionary)(NSDictionary *result);
typedef void (^CompletionBlockWithError)(NSError *error);
