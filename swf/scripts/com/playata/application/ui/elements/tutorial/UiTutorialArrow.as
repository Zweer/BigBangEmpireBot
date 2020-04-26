package com.playata.application.ui.elements.tutorial
{
   import com.greensock.easing.Power1;
   import com.playata.application.AppEnvironment;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.effects.TransformEffect;
   import com.playata.framework.core.Runtime;
   import com.playata.framework.display.IDisplayObjectContainer;
   import com.playata.framework.display.layout.LayoutUtil;
   import com.playata.framework.display.ui.TextFieldAutoAdjustWidthHeight;
   import flash.geom.Rectangle;
   import visuals.ui.elements.tutorial.SymbolTutorialArrowGeneric;
   import visuals.ui.elements.tutorial.SymbolTutorialGeneric;
   import visuals.ui.elements.tutorial.SymbolTutorialLadyGeneric;
   import visuals.ui.elements.tutorial.SymbolTutorialMessageBoxGeneric;
   import visuals.ui.elements.tutorial.SymbolTutorialMessageBubbleGeneric;
   
   public class UiTutorialArrow
   {
      
      public static const NONE:String = "none";
      
      public static const ARROW_LEFT:String = "left";
      
      public static const ARROW_UP:String = "up";
      
      public static const ARROW_RIGHT:String = "right";
      
      public static const ARROW_DOWN:String = "down";
      
      public static const LADY_LEFT_SIDE:String = "left_side";
      
      public static const LADY_LEFT_FRONT:String = "left_front";
      
      public static const LADY_LEFT_BACK:String = "left_back";
      
      public static const LADY_RIGHT_SIDE:String = "right_side";
      
      public static const LADY_RIGHT_FRONT:String = "right_front";
      
      public static const LADY_RIGHT_BACK:String = "right_back";
      
      private static const BUBBLE_POSITIONS:Object = {
         "side":{
            "x":-63,
            "y":-511
         },
         "side_down":{
            "x":-4,
            "y":-151
         },
         "front":{
            "x":-4,
            "y":-491
         },
         "front_down":{
            "x":-24,
            "y":-171
         },
         "back":{
            "x":-46,
            "y":-543
         },
         "back_down":{
            "x":-56,
            "y":-203
         }
      };
      
      private static const MAX_WIDTH:int = 221;
      
      private static var _instance:UiTutorialArrow;
       
      
      private var _arrow:SymbolTutorialArrowGeneric = null;
      
      private var _ladyBaseX:Number;
      
      private var _lady:SymbolTutorialLadyGeneric = null;
      
      private var _ladyType:String;
      
      private var _arrowType:String;
      
      private var _tutorialVisible:Boolean;
      
      private var _setTutorialFlagOnHide:String;
      
      private var _bounceEffect:TransformEffect = null;
      
      private var _defaultContainer:IDisplayObjectContainer;
      
      private var _topContainer:IDisplayObjectContainer;
      
      private var _content:SymbolTutorialGeneric;
      
      public function UiTutorialArrow(param1:SymbolTutorialGeneric, param2:IDisplayObjectContainer, param3:IDisplayObjectContainer)
      {
         super();
         _defaultContainer = param2;
         _topContainer = param3;
         if(_instance != null)
         {
            throw new Error("UiTutorial can only have a single instance!");
         }
         _instance = this;
         _content = param1;
         _arrow = param1.hint;
         _lady = param1.lady;
         _lady.message.caption.autoAdjustWidthHeight = TextFieldAutoAdjustWidthHeight.VERTICAL;
         _ladyBaseX = _lady.x;
         _setTutorialFlagOnHide = "";
         _bounceEffect = new TransformEffect(_arrow.arrow.graphic,0.7,"y",-10,true,true,Power1.easeInOut);
      }
      
      public static function get instance() : UiTutorialArrow
      {
         return _instance;
      }
      
      public function show(param1:Number = 0, param2:Boolean = false) : void
      {
         if(param1 > 0)
         {
            Runtime.delayFunction(show,param1,[0,param2]);
            return;
         }
         if(param2)
         {
            if(_content.parent != _topContainer)
            {
               _topContainer.addChild(_content);
            }
         }
         else if(_content.parent != _defaultContainer)
         {
            _defaultContainer.addChild(_content);
         }
         clearTweens();
         if(_arrowType != "none")
         {
            _arrow.tweenTo(1.5,{
               "delay":param1,
               "autoAlpha":1
            });
         }
         if(_ladyType != "none")
         {
            _lady.tweenTo(0.8,{
               "delay":param1,
               "autoAlpha":1
            });
         }
         _bounceEffect.play();
      }
      
      public function hide(param1:Boolean = false) : void
      {
         instantHide = param1;
         if(User.current && User.current.character)
         {
            checkTutorialFlag();
         }
         _tutorialVisible = false;
         clearTweens();
         if(instantHide)
         {
            _bounceEffect.stop();
            _lady.visible = false;
            _arrow.visible = false;
            var _loc2_:int = 0;
            _arrow.alpha = _loc2_;
            _lady.alpha = _loc2_;
            return;
         }
         var endBounce:Function = function():void
         {
            _bounceEffect.stop();
         };
         _arrow.tweenTo(0.5,{
            "autoAlpha":0,
            "onComplete":endBounce
         });
         _lady.tweenTo(0.5,{"autoAlpha":0});
      }
      
      private function checkTutorialFlag() : void
      {
         var _loc1_:* = null;
         if(_setTutorialFlagOnHide != "")
         {
            _loc1_ = _setTutorialFlagOnHide;
            _setTutorialFlagOnHide = "";
            User.current.character.setTutorialFlag(_loc1_);
         }
      }
      
      public function dispose() : void
      {
         _bounceEffect.dispose();
         _arrow = null;
      }
      
      private function clearTweens() : void
      {
         _lady.killTweens();
         _arrow.killTweens();
         Runtime.killDelayedFunction(show);
         Runtime.killDelayedFunction(showTutorial);
      }
      
      public function showTutorial(param1:String, param2:String, param3:String, param4:Number = 0, param5:Number = 0, param6:Number = 1.5, param7:Number = 0, param8:Boolean = false, param9:String = "", param10:Boolean = false) : void
      {
         _tutorialVisible = true;
         if(param6 > 0)
         {
            Runtime.killDelayedFunction(showTutorial);
            Runtime.delayFunction(showTutorial,param6,[param1,param2,param3,param4,param5,0,param7,param8,param9,param10]);
            return;
         }
         if(param9 != _setTutorialFlagOnHide)
         {
            checkTutorialFlag();
         }
         _setTutorialFlagOnHide = param9;
         setLady(param2,param7,param8);
         setArrow(param3,param4,param5);
         setMessage(param1);
         show(param6,param10);
      }
      
      private function setArrow(param1:String, param2:Number, param3:Number) : void
      {
         _arrowType = param1;
         if(param1 == "none")
         {
            _arrow.visible = false;
            return;
         }
         _arrow.x = param2;
         _arrow.y = param3;
         _arrow.gotoAndStop(param1);
      }
      
      private function setLady(param1:String, param2:Number, param3:Boolean) : void
      {
         _ladyType = param1;
         if(param1 == "none")
         {
            _lady.visible = false;
            return;
         }
         var _loc5_:String = param1.substr(param1.indexOf("_") + 1);
         _lady.gotoAndStop(_loc5_);
         if(AppEnvironment.appPlatform.isHidePantiesAllowed)
         {
            _lady.ladyBack.gotoAndStop("usk18");
            _lady.ladyFront.gotoAndStop("usk18");
            _lady.ladySide.gotoAndStop("usk18");
         }
         else
         {
            _lady.ladyBack.gotoAndStop("normal");
            _lady.ladyFront.gotoAndStop("normal");
            _lady.ladySide.gotoAndStop("normal");
         }
         _lady.scaleX = param1.indexOf("right") == 0?-1:1;
         if(param1.indexOf("right") == 0)
         {
            param2 = param2 + LayoutUtil.deviceAdjustedWidthCorrection;
         }
         var _loc4_:* = _loc5_;
         if(param3)
         {
            _loc4_ = _loc4_ + "_down";
         }
         var _loc6_:Object = BUBBLE_POSITIONS[_loc4_];
         _lady.message.x = _loc6_.x;
         _lady.message.y = _loc6_.y;
         _lady.message.scaleX = _lady.scaleX;
         _lady.message.connector.scaleX = _lady.scaleX;
         _lady.message.connector.rotation = !!param3?_lady.scaleX * 70:0;
         _lady.x = _ladyBaseX + param2;
      }
      
      private function setMessage(param1:String) : void
      {
         var _loc2_:Boolean = false;
         _arrow.message.visible = _loc2_;
         _lady.message.visible = _loc2_;
         if(param1 == null || param1 == "")
         {
            return;
         }
         if(_ladyType != "none")
         {
            setMessageBubble(param1);
         }
         else
         {
            setMessageBox(param1);
         }
      }
      
      private function setMessageBubble(param1:String) : void
      {
         var _loc2_:SymbolTutorialMessageBubbleGeneric = _lady.message;
         _loc2_.caption.text = param1;
         _loc2_.caption.y = -_loc2_.caption.height * 0.5;
         _loc2_.background.width = _loc2_.caption.textWidth + 30;
         _loc2_.background.height = _loc2_.caption.textHeight + 40;
         _loc2_.visible = true;
      }
      
      private function setMessageBox(param1:String) : void
      {
         var _loc6_:SymbolTutorialMessageBoxGeneric = _arrow.message;
         _loc6_.caption.text = param1;
         var _loc3_:Rectangle = _loc6_.caption.getTextBounds(221);
         var _loc5_:int = 5;
         var _loc4_:int = 10;
         var _loc2_:int = 45;
         _loc6_.caption.width = _loc3_.width + _loc5_;
         _loc6_.caption.height = _loc3_.height + _loc4_;
         _loc6_.background.width = _loc3_.width + _loc2_;
         _loc6_.background.height = _loc3_.height + _loc2_;
         _loc6_.visible = true;
      }
      
      public function get tutorialVisible() : Boolean
      {
         return _tutorialVisible;
      }
   }
}
