//
//  EnumType.h
//  SheChiPin
//
//  Created by 周磊 on 2018/8/24.
//  Copyright © 2018年 FanWang. All rights reserved.
//

#ifndef EnumType_h
#define EnumType_h

typedef enum : NSUInteger {
    MobileEnumBinding, // 绑定手机号
    MobileEnumChange,  // 更改手机号
} MobileEnum;

// 专区类型
typedef enum : NSUInteger {
    AreaTypePromotion, // 优惠特卖专区
    AreaTypeMoneyGift, // 满赠专区
    AreaTypeMoneyOff,  // 满减专区
} AreaType;

// 商品类型
typedef enum : NSUInteger {
    GoodsTypeCommon    = 1001, // 普通商品
    GoodsTypeSeckiling = 1002, // 秒杀抢购商品
    GoodsTypeSpell     = 1003, // 拼团商品
    GoodsTypeIntegral  = 1004, // 积分商品(暂定)
} GoodsType;

// 普通商品状态类型
typedef enum : NSUInteger {
    CommonGoodsTypePutAway, // 上架状态
    CommonGoodsTypeSoldOut, // 下架状态
} CommonGoodsType;

// 秒杀抢购状态类型
typedef enum : NSUInteger {
    SeckilingTypeWaiting,  // 秒杀未开抢
    SeckilingTypeBegining, // 秒杀已开抢
    SeckilingTypeOut,      // 秒杀已抢光
    SeckilingTypeEnd,      // 秒杀已结束
} SeckilingType;

// 拼团状态类型
typedef enum : NSUInteger {
    SpellTypeWaiting,  // 拼团预告
    SpellTypeBegining, // 正在拼团
    SpellTypeEnd,      // 拼团已结束
} SpellType;

// 商品详情--商品状态
typedef enum : NSUInteger {
    FWGoodsDetailStateNotBegin,  // 未开始状态 (秒杀未开始/拼团预告)
    FWGoodsDetailStateOn,        // 上架状态  (普通商品上架/秒杀开抢/拼团开抢)
    FWGoodsDetailStateOut,       // 抢光状态  (秒杀已抢光)
    FWGoodsDetailStateOff,       // 下架状态  (普通商品下架)
    FWGoodsDetailStateEnd,       // 结束状态  (秒杀已结束/拼团已结束)
} FWGoodsDetailState;

// 确认订单类型
typedef enum : NSUInteger {
    MakeSureOrderTypeCommon,     // 普通/抢购/单买的付款
    MakeSureOrderTypeStartSpell, // 发起拼团的付款
    MakeSureOrderTypeJoinSpell,  // 参与拼团的付款
    MakeSureOrderTypeNotSuccess, // 参团付款未成功
} MakeSureOrderType;

typedef enum : NSUInteger {
    MyOrderTypeWaitPay,     // 待付款 0
    MyOrderTypeWaitGroup,   // 待成团 1
    MyOrderTypeWaitSend,    // 待发货 2
    MyOrderTypeWaitReceive, // 待收货 3
    MyOrderTypeFinished,    // 交易完成 4
    MyOrderTypeRefund,      // 退款/售后 5
    MyOrderTypeClose,       // 已关闭 6
    MyOrderTypeAbolish,     // 废除 7
    MyOrderTypeSpellFailed  // 拼团失败
} MyOrderType;

// 分享类型
typedef enum : NSUInteger {
    ShareTypesaveInAlbum,    // 保存本地相册
    ShareTypeWechatSession,  // 微信好友
    ShareTypeWechatTimeLine, // 微信朋友圈
    ShareTypeQQ,             // QQ好友
} ShareType;

// 我的钱包
typedef enum : NSUInteger {
    MyWalletVCTypeWithdrawRecord, // 提现记录页面
    MyWalletVCTypeDetail,         // 明细页面
} MyWalletVCType;

// 我的地址
typedef enum : NSUInteger {
    MyAddressUpdateStateDefault, // 设置默认
    MyAddressUpdateStateEdit,    // 编辑
    MyAddressUpdateStateDelete,  // 删除
} MyAddressUpdateState;

#endif /* EnumType_h */
