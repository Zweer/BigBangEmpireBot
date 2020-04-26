package visuals.ui.elements.buttons
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.elements.quest.SymbolQuestFightGraphicGeneric;
   
   public class SymbolButtonQuestFightGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolButtonQuestFight = null;
      
      public var graphic:SymbolQuestFightGraphicGeneric = null;
      
      public function SymbolButtonQuestFightGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolButtonQuestFight;
         }
         else
         {
            _nativeObject = new SymbolButtonQuestFight();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         graphic = new SymbolQuestFightGraphicGeneric(_nativeObject.graphic);
      }
      
      public function setNativeInstance(param1:SymbolButtonQuestFight) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.graphic)
         {
            graphic.setNativeInstance(_nativeObject.graphic);
         }
      }
   }
}
