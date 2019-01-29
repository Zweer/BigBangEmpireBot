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
   
   public class SymbolDailyBonusHerobookGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDailyBonusHerobook = null;
      
      public var bg:SymbolDailyBonusProgressBarBackgroundGeneric = null;
      
      public var fill:SymbolDailyBonusProgressBarFillGeneric = null;
      
      public var frame:SymbolDailyBonusProgressBarFrameGeneric = null;
      
      public var reward:SymbolDailyBonusRewardButtonGeneric = null;
      
      public var counter:SymbolDailyBonusProgressBarCounterGeneric = null;
      
      public var txtCount:ILabel = null;
      
      public function SymbolDailyBonusHerobookGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDailyBonusHerobook;
         }
         else
         {
            _nativeObject = new SymbolDailyBonusHerobook();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         bg = new SymbolDailyBonusProgressBarBackgroundGeneric(_nativeObject.bg);
         fill = new SymbolDailyBonusProgressBarFillGeneric(_nativeObject.fill);
         frame = new SymbolDailyBonusProgressBarFrameGeneric(_nativeObject.frame);
         reward = new SymbolDailyBonusRewardButtonGeneric(_nativeObject.reward);
         counter = new SymbolDailyBonusProgressBarCounterGeneric(_nativeObject.counter);
         txtCount = FlashLabel.fromNative(_nativeObject.txtCount);
      }
      
      public function setNativeInstance(param1:SymbolDailyBonusHerobook) : void
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
         if(_nativeObject.reward)
         {
            reward.setNativeInstance(_nativeObject.reward);
         }
         if(_nativeObject.counter)
         {
            counter.setNativeInstance(_nativeObject.counter);
         }
         FlashLabel.setNativeInstance(txtCount,_nativeObject.txtCount);
      }
   }
}
