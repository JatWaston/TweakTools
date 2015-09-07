
// Logos by Dustin Howett
// See http://iphonedevwiki.net/index.php/Logos

#include <substrate.h>

#include <notify.h>
#import <CoreFoundation/CoreFoundation.h>

//hook notify_post
extern "C" uint32_t notify_post(const char *name);
MSHook(uint32_t, notify_post, const char *name)
{
    NSLog(@"JWNotifyWatcher:notify_post->%s",name);
    uint32_t result = _notify_post(name);
    return result;
}

//hook CFNotificationCenterPostNotification
extern "C" void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFStringRef name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately);

MSHook(void,CFNotificationCenterPostNotification,CFNotificationCenterRef center, CFStringRef name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
    NSLog(@"JWNotifyWatcher:CFNotificationCenterPostNotification->center=%@ name=%@ userInfo=%@ deliverImmediately=%d",center,name,(NSDictionary *)userInfo,deliverImmediately);
    _CFNotificationCenterPostNotification(center,name,object,userInfo,deliverImmediately);
}

//hook NSNotificationCenter
%hook NSNotificationCenter

- (void)postNotification:(NSNotification *)notification {
    NSLog(@"JWNotifyWatcher:NSNotificationCenter:->postNotification:%@",notification);
    %orig;
}

- (void)postNotificationName:(NSString *)aName object:(id)anObject {
    NSLog(@"JWNotifyWatcher:NSNotificationCenter:->postNotificationName:%@ object:%@",aName,anObject);
    %orig;
}

- (void)postNotificationName:(NSString *)aName object:(id)anObject userInfo:(NSDictionary *)aUserInfo {
    NSLog(@"JWNotifyWatcher:NSNotificationCenter:->postNotificationName:%@ object:%@ userInfo:%@",aName,anObject,aUserInfo);
    %orig;
}

%end

//hook CPDistributedMessagingCenter
%hook CPDistributedMessagingCenter

- (BOOL)_sendMessage:(id)arg1 userInfoData:(id)arg2 oolKey:(id)arg3 oolData:(id)arg4 makeServer:(BOOL)arg5 receiveReply:(id *)arg6 nonBlocking:(BOOL)arg7 error:(id *)arg8 {
    NSLog(@"JWNotifyWatcher:CPDistributedMessagingCenter:->_sendMessage:%@ userInfoData:%@ oolKey:%@",arg1,arg2,arg3);
    return %orig;
}

- (BOOL)_sendMessage:(id)arg1 userInfo:(id)arg2 receiveReply:(id *)arg3 error:(id *)arg4 toTarget:(id)arg5 selector:(SEL)arg6 context:(void *)arg7 nonBlocking:(BOOL)arg8 {
    NSLog(@"JWNotifyWatcher:CPDistributedMessagingCenter:->_sendMessage:%@ userInfoData:%@ receiveReply:na",arg1,arg2);
    return %orig;
}

- (BOOL)_sendMessage:(id)arg1 userInfo:(id)arg2 receiveReply:(id *)arg3 error:(id *)arg4 toTarget:(id)arg5 selector:(SEL)arg6 context:(void *)arg7 {
    NSLog(@"JWNotifyWatcher:CPDistributedMessagingCenter:->_sendMessage:%@ userInfoData:%@ receiveReply:na error:na",arg1,arg2);
    return %orig;
}

- (void)sendMessageAndReceiveReplyName:(id)arg1 userInfo:(id)arg2 toTarget:(id)arg3 selector:(SEL)arg4 context:(void *)arg5 {
    NSLog(@"JWNotifyWatcher:CPDistributedMessagingCenter:->sendMessageAndReceiveReplyName:%@ userInfo:%@",arg1,arg2);
    return %orig;
}

- (id)sendMessageAndReceiveReplyName:(id)arg1 userInfo:(id)arg2 error:(id *)arg3 {
    NSLog(@"JWNotifyWatcher:CPDistributedMessagingCenter:->sendMessageAndReceiveReplyName:%@ userInfo:%@ error:na",arg1,arg2);
    return %orig;
}

- (id)sendMessageAndReceiveReplyName:(id)arg1 userInfo:(id)arg2 {
    NSLog(@"JWNotifyWatcher:CPDistributedMessagingCenter:->sendMessageAndReceiveReplyName:%@ userInfo:%@",arg1,arg2);
    return %orig;
}

- (BOOL)sendNonBlockingMessageName:(id)arg1 userInfo:(id)arg2 {
    NSLog(@"JWNotifyWatcher:CPDistributedMessagingCenter:->sendNonBlockingMessageName:%@ userInfo:%@",arg1,arg2);
    return %orig;
}

- (BOOL)sendMessageName:(id)arg1 userInfo:(id)arg2 {
    NSLog(@"JWNotifyWatcher:CPDistributedMessagingCenter:->sendMessageName:%@ userInfo:%@",arg1,arg2);
    return %orig;
}

%end


%ctor {
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    %init();
    MSHookFunction(notify_post, MSHake(notify_post));
    MSHookFunction(CFNotificationCenterPostNotification, MSHake(CFNotificationCenterPostNotification));
    [pool drain];
}


