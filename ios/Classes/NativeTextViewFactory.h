//
//  NativeTextViewFactory.h
//  flutter_native_text_view
//
//  Created by Henry Leung on 30/11/2021.
//

#import <Foundation/Foundation.h>
#import <Flutter/Flutter.h>

NS_ASSUME_NONNULL_BEGIN

@interface NativeTextViewFactory : NSObject <FlutterPlatformViewFactory>
- (instancetype)initWithMessenger:(NSObject<FlutterBinaryMessenger> *)messanger;
@end

NS_ASSUME_NONNULL_END
