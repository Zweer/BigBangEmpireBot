package com.playata.application.ui.elements.battle
{
   import com.greensock.easing.Expo;
   import com.playata.framework.core.Core;
   import com.playata.framework.core.util.NumberUtil;
   import com.playata.framework.display.IDisplayObject;
   import com.playata.framework.display.Sprite;
   import flash.filters.GlowFilter;
   import visuals.ui.elements.avatar.SymbolBattleAvatarEmotesGeneric;
   
   public class UiBattleAvatarEmotes extends Sprite
   {
      
      private static var INFO:Object;
      
      private static const BASE_X:Number = -50;
      
      private static const BASE_Y:Number = 50;
      
      private static const OUTLINE_FILTER:GlowFilter = new GlowFilter(0,1,5,5,10,1,true);
      
      public static const NORMAL:String = "normal";
      
      public static const CRIT:String = "crit";
      
      public static const DODGE:String = "dodge";
       
      
      private var _emotes:SymbolBattleAvatarEmotesGeneric;
      
      private var _mode:String;
      
      private var _isLeft:Boolean;
      
      private var _offsetX:Number;
      
      private var _lastAttackNumber:int;
      
      public function UiBattleAvatarEmotes()
      {
         super();
         _emotes = new SymbolBattleAvatarEmotesGeneric();
         if(!INFO)
         {
            INFO = {
               "pve":{
                  "attack":{
                     "normal":[],
                     "crit":[],
                     "dodge":[1]
                  },
                  "defend":{
                     "normal":[],
                     "crit":[1],
                     "dodge":[]
                  }
               },
               "pvp":{
                  "attack":{
                     "normal":[1,2],
                     "crit":[1,2],
                     "dodge":[1,2]
                  },
                  "defend":{
                     "normal":[1,2],
                     "crit":[1,2],
                     "dodge":[]
                  }
               }
            };
         }
         _emotes.x = -50;
         _emotes.y = 50;
         addChild(_emotes);
         var _loc1_:int = 0;
         _emotes.scaleY = _loc1_;
         _emotes.scaleX = _loc1_;
         _emotes.visible = false;
      }
      
      public function show(param1:Boolean, param2:String, param3:int = -1) : void
      {
         if(isPVP && param1 && param2 == "dodge")
         {
            param2 = "normal";
         }
         if(!hasEmote(param1,param2))
         {
            return;
         }
         updateEmote(param1,param2,param3);
         _emotes.visible = true;
         stopWobble();
         _emotes.killTweens();
         var _loc7_:int = 0;
         _emotes.scaleY = _loc7_;
         _emotes.scaleX = _loc7_;
         var _loc4_:Object = {
            "scaleX":1,
            "scaleY":1,
            "ease":Expo.easeIn
         };
         var _loc6_:Object = {
            "scaleX":0,
            "scaleY":0,
            "ease":Expo.easeOut,
            "onComplete":hideMe
         };
         var _loc5_:* = 0.8;
         if(isPVP)
         {
            if(param1)
            {
               _loc5_ = Number(_loc5_ + 0.5);
            }
            if(param2 == "crit")
            {
               _loc4_.onComplete = startWobble;
               _loc6_.onComplete = stopWobble;
            }
         }
         else if(param1 && param2 == "dodge")
         {
            _loc4_.onComplete = startWobble;
            _loc6_.onComplete = stopWobble;
            _loc4_.delay = 0.2;
            _loc5_ = Number(_loc5_ + 0.1);
         }
         else if(!param1 && param2 == "crit")
         {
            _loc4_.onComplete = startWobble;
            _loc6_.onComplete = stopWobble;
         }
         _loc6_.delay = _loc5_;
         _emotes.tweenTo(0.15,_loc4_);
         _emotes.tweenTo(0.15,_loc6_);
      }
      
      public function isLeft(param1:Boolean, param2:Boolean) : void
      {
         _isLeft = param1;
         _offsetX = !!_isLeft?-50:Number(--50 + (!!param2?286:Number(212)));
         _emotes.x = _offsetX;
         _emotes.hint.scaleX = !!_isLeft?1:-1;
      }
      
      public function set isPVP(param1:Boolean) : void
      {
         _mode = !!param1?"pvp":"pve";
      }
      
      public function get isPVP() : Boolean
      {
         return _mode == "pvp";
      }
      
      public function get lastAttackNumber() : int
      {
         return _lastAttackNumber;
      }
      
      private function stopWobble() : void
      {
         Core.current.heartbeat.add(wobble);
      }
      
      private function startWobble() : void
      {
         Core.current.heartbeat.remove(wobble);
      }
      
      private function wobble(param1:int) : void
      {
         _emotes.x = _offsetX + NumberUtil.randomNumber(-1,1);
         _emotes.y = 50 + NumberUtil.randomNumber(-1,1);
      }
      
      private function hideMe() : void
      {
         _emotes.visible = false;
      }
      
      private function hasEmote(param1:Boolean, param2:String) : Boolean
      {
         var _loc3_:String = !!param1?"attack":"defend";
         return INFO[_mode][_loc3_][param2].length > 0;
      }
      
      private function updateEmote(param1:Boolean, param2:String, param3:int) : void
      {
         var _loc4_:String = !!param1?"attack":"defend";
         _lastAttackNumber = param3 == -1?NumberUtil.randomInt(1,INFO[_mode][_loc4_][param2].length):int(param3);
         var _loc5_:String = _mode + "_" + _loc4_ + "_" + param2 + "_" + _lastAttackNumber;
         var _loc6_:* = _loc5_;
         switch(_loc6_)
         {
            case "pve_defend_crit_1":
               showIcon("bones",true,-68,15);
               showIcon("shit",true,-11,3);
               showIcon("cryBaby",true,-30,40);
               showIcon("skull",false);
               showIcon("swirl1",false);
               showIcon("swirl2",false);
               showIcon("question",false);
               showIcon("flash1",false);
               showIcon("flash2",false);
               showIcon("flash3",false);
               showIcon("bang",false);
               showIcon("cloud",false);
               showIcon("lasso",false);
               showIcon("knuckle",false);
               break;
            case "pve_attack_dodge_1":
               showIcon("bones",false);
               showIcon("shit",true,-4,23);
               showIcon("cryBaby",false);
               showIcon("skull",true,-50,42);
               showIcon("swirl1",false);
               showIcon("swirl2",true,-85,20);
               showIcon("question",true,-37,3);
               showIcon("flash1",false);
               showIcon("flash2",false);
               showIcon("flash3",false);
               showIcon("bang",false);
               showIcon("cloud",false);
               showIcon("lasso",false);
               showIcon("knuckle",false);
               break;
            case "pvp_defend_normal_1":
               showIcon("bones",false);
               showIcon("shit",false);
               showIcon("cryBaby",false);
               showIcon("skull",false);
               showIcon("swirl1",false);
               showIcon("swirl2",false);
               showIcon("question",false);
               showIcon("flash1",true,-1,31);
               showIcon("flash2",false);
               showIcon("flash3",false);
               showIcon("bang",false);
               showIcon("cloud",true,-56,33);
               showIcon("lasso",false);
               showIcon("knuckle",false);
               break;
            case "pvp_defend_normal_2":
               showIcon("bones",false);
               showIcon("shit",false);
               showIcon("cryBaby",false);
               showIcon("skull",false);
               showIcon("swirl1",false);
               showIcon("swirl2",false);
               showIcon("question",false);
               showIcon("flash1",false);
               showIcon("flash2",true,-39,34);
               showIcon("flash3",false);
               showIcon("bang",true,-4,33);
               showIcon("cloud",false);
               showIcon("lasso",false);
               showIcon("knuckle",false);
               break;
            case "pvp_defend_crit_1":
               showIcon("bones",false);
               showIcon("shit",false);
               showIcon("cryBaby",false);
               showIcon("skull",true,-25,40);
               showIcon("swirl1",false);
               showIcon("swirl2",true,-59,35);
               showIcon("question",false);
               showIcon("flash1",true,-18,14);
               showIcon("flash2",false);
               showIcon("flash3",false);
               showIcon("bang",false);
               showIcon("cloud",false);
               showIcon("lasso",false);
               showIcon("knuckle",false);
               break;
            case "pvp_defend_crit_2":
               showIcon("bones",false);
               showIcon("shit",false);
               showIcon("cryBaby",false);
               showIcon("skull",false);
               showIcon("swirl1",false);
               showIcon("swirl2",true,-24,16);
               showIcon("question",false);
               showIcon("flash1",false);
               showIcon("flash2",false);
               showIcon("flash3",true,-54,27);
               showIcon("bang",false);
               showIcon("cloud",false);
               showIcon("lasso",true,9,37);
               showIcon("knuckle",true,-39,54);
               break;
            default:
               showIcon("bones",false);
               showIcon("shit",false);
               showIcon("cryBaby",false);
               showIcon("skull",false);
               showIcon("swirl1",false);
               showIcon("swirl2",false);
               showIcon("question",false);
               showIcon("flash1",false);
               showIcon("flash2",false);
               showIcon("flash3",false);
               showIcon("bang",false);
               showIcon("cloud",false);
               showIcon("lasso",false);
               showIcon("knuckle",false);
         }
      }
      
      private function showIcon(param1:String, param2:Boolean, param3:int = 0, param4:int = 0) : void
      {
         var _loc5_:IDisplayObject = null;
         var _loc6_:* = param1;
         switch(_loc6_)
         {
            case "bones":
               _loc5_ = _emotes.bones;
               break;
            case "shit":
               _loc5_ = _emotes.shit;
               break;
            case "cryBaby":
               _loc5_ = _emotes.cryBaby;
               break;
            case "skull":
               _loc5_ = _emotes.skull;
               break;
            case "swirl1":
               _loc5_ = _emotes.swirl1;
               break;
            case "swirl2":
               _loc5_ = _emotes.swirl2;
               break;
            case "question":
               _loc5_ = _emotes.question;
               break;
            case "flash1":
               _loc5_ = _emotes.flash1;
               break;
            case "flash2":
               _loc5_ = _emotes.flash2;
               break;
            case "flash3":
               _loc5_ = _emotes.flash3;
               break;
            case "bang":
               _loc5_ = _emotes.bang;
               break;
            case "cloud":
               _loc5_ = _emotes.cloud;
               break;
            case "lasso":
               _loc5_ = _emotes.lasso;
               break;
            case "knuckle":
               _loc5_ = _emotes.knuckle;
         }
         _loc5_.visible = param2;
         _loc5_.x = param3;
         _loc5_.y = param4;
      }
   }
}
