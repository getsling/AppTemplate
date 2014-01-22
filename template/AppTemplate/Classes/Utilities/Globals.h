//
//  Globals.h
//  AppTemplate
//
//  Created by {PERSON} on {CREATED}.
//  Copyright (c) {COPYRIGHT}. All rights reserved.
//

typedef void (^CompletionBlock)();
typedef void (^CompletionBlockWithSuccess)(BOOL success);
typedef void (^CompletionBlockWithObject)(id result);
typedef void (^CompletionBlockWithArray)(NSArray *results);
typedef void (^CompletionBlockWithDictionary)(NSDictionary *result);
typedef void (^CompletionBlockWithError)(NSError *error);
