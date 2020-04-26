package com.playata.framework.tween.lib.greensock
{
   import com.greensock.TimelineLite;
   import com.greensock.TimelineMax;
   import com.greensock.TweenLite;
   import com.greensock.TweenMax;
   import com.greensock.data.TweenMaxVars;
   import com.greensock.easing.Back;
   import com.greensock.easing.Bounce;
   import com.greensock.easing.Circ;
   import com.greensock.easing.Elastic;
   import com.greensock.easing.Expo;
   import com.greensock.easing.Linear;
   import com.greensock.easing.Quart;
   import com.greensock.easing.Sine;
   import com.playata.framework.core.Runtime;
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.tween.ITween;
   import com.playata.framework.tween.ITweenHandler;
   import com.playata.framework.tween.TweenEaseType;
   import com.playata.framework.tween.TweenVars;
   
   public class GreenSockTweenHandler implements ITweenHandler
   {
       
      
      public function GreenSockTweenHandler()
      {
         super();
      }
      
      public function to(param1:Object, param2:Number, param3:Object) : ITween
      {
         if(param1 == null)
         {
            return null;
         }
         if(param3 is TweenVars)
         {
            param3 = convertTweenVars(param1,TweenVars(param3));
         }
         else if(param3 is TypedObject)
         {
            param3 = TypedObject(param3).rawData;
         }
         return new GreenSockTween(TweenMax.to(param1,param2,param3));
      }
      
      public function from(param1:Object, param2:Number, param3:Object) : ITween
      {
         if(param1 == null)
         {
            return null;
         }
         if(param3 is TweenVars)
         {
            param3 = convertTweenVars(param1,TweenVars(param3));
         }
         else if(param3 is TypedObject)
         {
            param3 = TypedObject(param3).rawData;
         }
         return new GreenSockTween(TweenMax.from(param1,param2,param3));
      }
      
      public function fromTo(param1:Object, param2:Number, param3:Object, param4:Object) : ITween
      {
         if(param1 == null)
         {
            return null;
         }
         if(param3 is TweenVars)
         {
            param3 = convertTweenVars(param1,TweenVars(param3));
         }
         else if(param3 is TypedObject)
         {
            param3 = TypedObject(param3).rawData;
         }
         if(param4 is TweenVars)
         {
            param4 = convertTweenVars(param1,TweenVars(param4));
         }
         else if(param4 is TypedObject)
         {
            param4 = TypedObject(param4).rawData;
         }
         return new GreenSockTween(TweenMax.fromTo(param1,param2,param3,param4));
      }
      
      public function killTweensOf(param1:Object, param2:Boolean = false, param3:Object = null) : void
      {
         if(param1 == null)
         {
            return;
         }
         if(param3 is TypedObject)
         {
            param3 = TypedObject(param3).rawData;
         }
         return TweenMax.killTweensOf(param1,param2,param3);
      }
      
      public function isTweening(param1:Object) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         return TweenMax.isTweening(param1);
      }
      
      public function pauseAll() : void
      {
         TweenMax.pauseAll();
      }
      
      public function resumeAll() : void
      {
         TweenMax.resumeAll();
      }
      
      public function printActiveTweens(param1:Boolean = true, param2:Array = null) : void
      {
         var _loc7_:Boolean = false;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc8_:* = null;
         var _loc3_:* = null;
         if(param2 == null)
         {
            param2 = TweenMax.getAllTweens(true);
         }
         var _loc10_:int = 0;
         var _loc9_:* = param2;
         for each(var _loc4_ in param2)
         {
            if(_loc4_ is TimelineMax)
            {
               _loc5_ = _loc4_ as TimelineMax;
               _loc7_ = _loc5_.isActive();
               if(!param1 || _loc7_)
               {
                  trace("TimelineMax: " + _loc7_);
                  printActiveTweens(param1,_loc5_.getActive(true,true,true));
               }
            }
            else if(_loc4_ is TimelineLite)
            {
               _loc6_ = _loc4_ as TimelineLite;
               _loc7_ = _loc6_.isActive();
               if(!param1 || _loc7_)
               {
                  trace("TimelineLite: " + _loc7_);
               }
            }
            else if(_loc4_ is TweenMax)
            {
               _loc8_ = _loc4_ as TweenMax;
               _loc7_ = _loc8_.isActive();
               if(!param1 || _loc7_)
               {
                  trace("TweenMax: " + Runtime.getClassName(_loc8_.target) + " - " + _loc7_);
                  if(_loc8_.target.hasOwnProperty("name"))
                  {
                     trace(" - " + _loc8_.target.name);
                  }
               }
            }
            else if(_loc4_ is TweenLite)
            {
               _loc3_ = _loc4_ as TweenLite;
               _loc7_ = _loc3_.isActive();
               if(!param1 || _loc7_)
               {
                  trace("TweenLite: " + Runtime.getClassName(_loc3_.target) + " - " + _loc7_);
                  if(_loc3_.target.hasOwnProperty("name"))
                  {
                     trace(" - " + _loc3_.target.name);
                  }
               }
            }
            else
            {
               trace(Object);
            }
         }
      }
      
      private function convertTweenVars(param1:Object, param2:TweenVars) : TweenMaxVars
      {
         target = param1;
         vars = param2;
         var tweenMaxVars:TweenMaxVars = new TweenMaxVars(vars.vars.rawData);
         tweenMaxVars.yoyo(vars.yoyo);
         tweenMaxVars.delay(vars.delay);
         tweenMaxVars.repeat(vars.repeat);
         tweenMaxVars.repeatDelay(vars.repeatDelay);
         if(vars.hasComplete)
         {
            tweenMaxVars.onComplete(function():void
            {
               vars.onComplete.dispatch(target);
            });
         }
         if(vars.hasRepeat)
         {
            tweenMaxVars.onRepeat(function():void
            {
               vars.onRepeat.dispatch(target);
            });
         }
         var _loc4_:* = vars.easeType;
         switch(_loc4_)
         {
            case TweenEaseType.Linear:
               tweenMaxVars.ease(Linear.ease);
               break;
            case TweenEaseType.ExpoIn:
               tweenMaxVars.ease(Expo.easeIn);
               break;
            case TweenEaseType.ExpoOut:
               tweenMaxVars.ease(Expo.easeOut);
               break;
            case TweenEaseType.ExpoInOut:
               tweenMaxVars.ease(Expo.easeInOut);
               break;
            case TweenEaseType.SineIn:
               tweenMaxVars.ease(Sine.easeIn);
               break;
            case TweenEaseType.SineOut:
               tweenMaxVars.ease(Sine.easeOut);
               break;
            case TweenEaseType.SineInOut:
               tweenMaxVars.ease(Sine.easeInOut);
               break;
            case TweenEaseType.BounceIn:
               tweenMaxVars.ease(Bounce.easeIn);
               break;
            case TweenEaseType.BounceOut:
               tweenMaxVars.ease(Bounce.easeOut);
               break;
            case TweenEaseType.BounceInOut:
               tweenMaxVars.ease(Bounce.easeInOut);
               break;
            case TweenEaseType.CircIn:
               tweenMaxVars.ease(Circ.easeIn);
               break;
            case TweenEaseType.CircOut:
               tweenMaxVars.ease(Circ.easeOut);
               break;
            case TweenEaseType.CircInOut:
               tweenMaxVars.ease(Circ.easeInOut);
               break;
            case TweenEaseType.BackIn:
               tweenMaxVars.ease(Back.easeIn);
               break;
            case TweenEaseType.BackOut:
               tweenMaxVars.ease(Back.easeOut);
               break;
            case TweenEaseType.BackInOut:
               tweenMaxVars.ease(Back.easeInOut);
               break;
            case TweenEaseType.ElasticIn:
               tweenMaxVars.ease(Elastic.easeIn);
               break;
            case TweenEaseType.ElasticOut:
               tweenMaxVars.ease(Elastic.easeOut);
               break;
            case TweenEaseType.ElasticInOut:
               tweenMaxVars.ease(Elastic.easeInOut);
               break;
            case TweenEaseType.QuartIn:
               tweenMaxVars.ease(Quart.easeIn);
               break;
            case TweenEaseType.QuartOut:
               tweenMaxVars.ease(Quart.easeOut);
               break;
            case TweenEaseType.QuartInOut:
               tweenMaxVars.ease(Quart.easeInOut);
         }
         return tweenMaxVars;
      }
   }
}
