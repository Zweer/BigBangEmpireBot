package visuals.ui.elements.citymap
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.elements.buttons.SymbolButtonQuestFightGeneric;
   import visuals.ui.elements.buttons.SymbolButtonQuestStatGeneric;
   import visuals.ui.elements.buttons.SymbolButtonQuestTimeGeneric;
   
   public class SymbolCitymapIconQuestGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolCitymapIconQuest = null;
      
      public var timeQuest:SymbolButtonQuestTimeGeneric = null;
      
      public var fightQuest:SymbolButtonQuestFightGeneric = null;
      
      public var statQuest:SymbolButtonQuestStatGeneric = null;
      
      public function SymbolCitymapIconQuestGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolCitymapIconQuest;
         }
         else
         {
            _nativeObject = new SymbolCitymapIconQuest();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         timeQuest = new SymbolButtonQuestTimeGeneric(_nativeObject.timeQuest);
         fightQuest = new SymbolButtonQuestFightGeneric(_nativeObject.fightQuest);
         statQuest = new SymbolButtonQuestStatGeneric(_nativeObject.statQuest);
      }
      
      public function setNativeInstance(param1:SymbolCitymapIconQuest) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.timeQuest)
         {
            timeQuest.setNativeInstance(_nativeObject.timeQuest);
         }
         if(_nativeObject.fightQuest)
         {
            fightQuest.setNativeInstance(_nativeObject.fightQuest);
         }
         if(_nativeObject.statQuest)
         {
            statQuest.setNativeInstance(_nativeObject.statQuest);
         }
      }
   }
}
