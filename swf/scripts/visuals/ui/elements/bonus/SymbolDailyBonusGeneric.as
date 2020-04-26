package visuals.ui.elements.bonus
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import flash.display.MovieClip;
   import visuals.ui.elements.conventions.SymbolDailyBonusProgressBarCounterGeneric;
   import visuals.ui.elements.generic.SymbolDailyBonusProgressBarBackgroundGeneric;
   import visuals.ui.elements.generic.SymbolDailyBonusProgressBarFillGeneric;
   import visuals.ui.elements.generic.SymbolDailyBonusProgressBarFrameGeneric;
   
   public class SymbolDailyBonusGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDailyBonus = null;
      
      public var bg:SymbolDailyBonusProgressBarBackgroundGeneric = null;
      
      public var fill:SymbolDailyBonusProgressBarFillGeneric = null;
      
      public var frame:SymbolDailyBonusProgressBarFrameGeneric = null;
      
      public var reward1:SymbolDailyBonusRewardButtonGeneric = null;
      
      public var reward2:SymbolDailyBonusRewardButtonGeneric = null;
      
      public var reward3:SymbolDailyBonusRewardButtonGeneric = null;
      
      public var counter:SymbolDailyBonusProgressBarCounterGeneric = null;
      
      public var txtCount:ILabel = null;
      
      public function SymbolDailyBonusGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDailyBonus;
         }
         else
         {
            _nativeObject = new SymbolDailyBonus();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         bg = new SymbolDailyBonusProgressBarBackgroundGeneric(_nativeObject.bg);
         fill = new SymbolDailyBonusProgressBarFillGeneric(_nativeObject.fill);
         frame = new SymbolDailyBonusProgressBarFrameGeneric(_nativeObject.frame);
         reward1 = new SymbolDailyBonusRewardButtonGeneric(_nativeObject.reward1);
         reward2 = new SymbolDailyBonusRewardButtonGeneric(_nativeObject.reward2);
         reward3 = new SymbolDailyBonusRewardButtonGeneric(_nativeObject.reward3);
         counter = new SymbolDailyBonusProgressBarCounterGeneric(_nativeObject.counter);
         txtCount = FlashLabel.fromNative(_nativeObject.txtCount);
      }
      
      public function setNativeInstance(param1:SymbolDailyBonus) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.bg)
         {
            bg.setNativeInstance(_nativeObject.bg);
         }
         if(_nativeObject.fill)
         {
            fill.setNativeInstance(_nativeObject.fill);
         }
         if(_nativeObject.frame)
         {
            frame.setNativeInstance(_nativeObject.frame);
         }
         if(_nativeObject.reward1)
         {
            reward1.setNativeInstance(_nativeObject.reward1);
         }
         if(_nativeObject.reward2)
         {
            reward2.setNativeInstance(_nativeObject.reward2);
         }
         if(_nativeObject.reward3)
         {
            reward3.setNativeInstance(_nativeObject.reward3);
         }
         if(_nativeObject.counter)
         {
            counter.setNativeInstance(_nativeObject.counter);
         }
         FlashLabel.setNativeInstance(txtCount,_nativeObject.txtCount);
      }
   }
}
