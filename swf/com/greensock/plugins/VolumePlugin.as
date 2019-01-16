package com.greensock.plugins
{
   import com.greensock.TweenLite;
   import flash.media.SoundTransform;
   
   public class VolumePlugin extends TweenPlugin
   {
      
      public static const API:Number = 2;
       
      
      protected var _target:Object;
      
      protected var _st:SoundTransform;
      
      public function VolumePlugin()
      {
         super("volume");
      }
      
      override public function _onInitTween(param1:Object, param2:*, param3:TweenLite) : Boolean
      {
         if(isNaN(param2) || param1.hasOwnProperty("volume") || !param1.hasOwnProperty("soundTransform"))
         {
            return false;
         }
         this._target = param1;
         this._st = this._target.soundTransform;
         _addTween(this._st,"volume",this._st.volume,param2,"volume");
         return true;
      }
      
      override public function setRatio(param1:Number) : void
      {
         super.setRatio(param1);
         this._target.soundTransform = this._st;
      }
   }
}
