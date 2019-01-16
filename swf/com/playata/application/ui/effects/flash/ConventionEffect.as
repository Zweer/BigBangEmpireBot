package com.playata.application.ui.effects.flash
{
   import flash.display.BitmapData;
   
   public class ConventionEffect extends ExplosionEffect
   {
       
      
      private var _mode:String;
      
      public function ConventionEffect(param1:Object)
      {
         super();
         _numSprites = 50;
         _mode = param1["mode"];
         var _loc2_:BitmapData = _mode == "show"?new EffectBitmapDataMoney():new EffectBitmapDataXP();
         start(new <BitmapData>[_loc2_,new EffectBitmapStar1(),new EffectBitmapStar2(),new EffectBitmapStar3()]);
      }
   }
}
