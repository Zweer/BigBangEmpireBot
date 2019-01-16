package visuals.ui.elements.quest
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   
   public class SymbolQuestIconClockAnimationGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolQuestIconClockAnimation = null;
      
      public var hours:SymbolQuestItemClockHoursGeneric = null;
      
      public var minutes:SymbolQuestIconClockMinutesGeneric = null;
      
      public function SymbolQuestIconClockAnimationGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolQuestIconClockAnimation;
         }
         else
         {
            _nativeObject = new SymbolQuestIconClockAnimation();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         hours = new SymbolQuestItemClockHoursGeneric(_nativeObject.hours);
         minutes = new SymbolQuestIconClockMinutesGeneric(_nativeObject.minutes);
      }
      
      public function setNativeInstance(param1:SymbolQuestIconClockAnimation) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.hours)
         {
            hours.setNativeInstance(_nativeObject.hours);
         }
         if(_nativeObject.minutes)
         {
            minutes.setNativeInstance(_nativeObject.minutes);
         }
      }
   }
}
