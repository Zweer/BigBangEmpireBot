package com.playata.application.ui.effects
{
   import com.greensock.easing.Ease;
   import com.greensock.easing.Linear;
   import com.playata.framework.core.IDisposable;
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.display.IDisplayObject;
   
   public class HighlightEffect implements IDisposable
   {
       
      
      private var _highlightDisplayObject:IDisplayObject = null;
      
      private var _tweenInDuration:Number = 1;
      
      private var _tweenOutDuration:Number = 1;
      
      private var _repeat:int = -1;
      
      private var _loop:Boolean = false;
      
      private var _ease:Ease;
      
      public function HighlightEffect(param1:IDisplayObject, param2:Number, param3:Number, param4:Boolean, param5:int = -1)
      {
         _ease = Linear.easeInOut;
         super();
         _highlightDisplayObject = param1;
         _tweenInDuration = param2;
         _tweenOutDuration = param3;
         _loop = param4;
         _repeat = param5;
         _highlightDisplayObject.visible = false;
         _highlightDisplayObject.alpha = 0;
      }
      
      public function dispose() : void
      {
         _highlightDisplayObject.killTweens();
      }
      
      public function set duration(param1:Number) : void
      {
         _tweenInDuration = param1;
      }
      
      public function set loop(param1:Boolean) : void
      {
         _loop = param1;
      }
      
      public function get highlightDisplayObject() : IDisplayObject
      {
         return _highlightDisplayObject;
      }
      
      public function highlight(param1:Boolean = false) : void
      {
         _highlightDisplayObject.killTweens();
         if(param1)
         {
            _highlightDisplayObject.visible = true;
            _highlightDisplayObject.alpha = 1;
            return;
         }
         var _loc2_:TypedObject = new TypedObject({
            "autoAlpha":1,
            "ease":_ease
         });
         if(_loop)
         {
            _loc2_.setBoolean("yoyo",true);
            _loc2_.setInt("repeat",_repeat);
            _highlightDisplayObject.alpha = 0;
         }
         _highlightDisplayObject.tweenTo(_tweenInDuration,_loc2_);
      }
      
      public function unhighlight(param1:Boolean = false) : void
      {
         _highlightDisplayObject.killTweens();
         if(!_highlightDisplayObject.visible)
         {
            _highlightDisplayObject.alpha = 0;
            return;
         }
         if(param1)
         {
            _highlightDisplayObject.visible = false;
            _highlightDisplayObject.alpha = 0;
            return;
         }
         _highlightDisplayObject.tweenTo(_tweenInDuration,{
            "autoAlpha":0,
            "ease":_ease
         });
      }
   }
}
