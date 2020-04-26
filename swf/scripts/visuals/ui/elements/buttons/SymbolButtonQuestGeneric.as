package visuals.ui.elements.buttons
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   
   public class SymbolButtonQuestGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolButtonQuest = null;
      
      public var timeQuest:SymbolButtonQuestTimeGeneric = null;
      
      public var fightQuest:SymbolButtonQuestFightGeneric = null;
      
      public var statQuest:SymbolButtonQuestStatGeneric = null;
      
      public var userStoryQuest:SymbolButtonQuestUserStoryGeneric = null;
      
      public function SymbolButtonQuestGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolButtonQuest;
         }
         else
         {
            _nativeObject = new SymbolButtonQuest();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         timeQuest = new SymbolButtonQuestTimeGeneric(_nativeObject.timeQuest);
         fightQuest = new SymbolButtonQuestFightGeneric(_nativeObject.fightQuest);
         statQuest = new SymbolButtonQuestStatGeneric(_nativeObject.statQuest);
         userStoryQuest = new SymbolButtonQuestUserStoryGeneric(_nativeObject.userStoryQuest);
      }
      
      public function setNativeInstance(param1:SymbolButtonQuest) : void
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
         if(_nativeObject.userStoryQuest)
         {
            userStoryQuest.setNativeInstance(_nativeObject.userStoryQuest);
         }
      }
   }
}
