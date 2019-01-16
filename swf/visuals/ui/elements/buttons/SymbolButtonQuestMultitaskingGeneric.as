package visuals.ui.elements.buttons
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.elements.herobook.SymbolHerobookTimerGeneric;
   import visuals.ui.elements.icons.SymbolIconCitymapGeneric;
   
   public class SymbolButtonQuestMultitaskingGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolButtonQuestMultitasking = null;
      
      public var timer:SymbolHerobookTimerGeneric = null;
      
      public var citymap:SymbolIconCitymapGeneric = null;
      
      public var statQuest:SymbolButtonQuestStatGeneric = null;
      
      public var fightQuest:SymbolButtonQuestFightGeneric = null;
      
      public var timeQuest:SymbolButtonQuestTimeGeneric = null;
      
      public function SymbolButtonQuestMultitaskingGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolButtonQuestMultitasking;
         }
         else
         {
            _nativeObject = new SymbolButtonQuestMultitasking();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         timer = new SymbolHerobookTimerGeneric(_nativeObject.timer);
         citymap = new SymbolIconCitymapGeneric(_nativeObject.citymap);
         statQuest = new SymbolButtonQuestStatGeneric(_nativeObject.statQuest);
         fightQuest = new SymbolButtonQuestFightGeneric(_nativeObject.fightQuest);
         timeQuest = new SymbolButtonQuestTimeGeneric(_nativeObject.timeQuest);
      }
      
      public function setNativeInstance(param1:SymbolButtonQuestMultitasking) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.timer)
         {
            timer.setNativeInstance(_nativeObject.timer);
         }
         if(_nativeObject.citymap)
         {
            citymap.setNativeInstance(_nativeObject.citymap);
         }
         if(_nativeObject.statQuest)
         {
            statQuest.setNativeInstance(_nativeObject.statQuest);
         }
         if(_nativeObject.fightQuest)
         {
            fightQuest.setNativeInstance(_nativeObject.fightQuest);
         }
         if(_nativeObject.timeQuest)
         {
            timeQuest.setNativeInstance(_nativeObject.timeQuest);
         }
      }
   }
}
