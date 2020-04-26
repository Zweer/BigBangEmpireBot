package visuals.ui.elements.buttons
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.elements.quest.SymbolQuestStatGraphicGeneric;
   
   public class SymbolButtonQuestStatGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolButtonQuestStat = null;
      
      public var graphic:SymbolQuestStatGraphicGeneric = null;
      
      public function SymbolButtonQuestStatGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolButtonQuestStat;
         }
         else
         {
            _nativeObject = new SymbolButtonQuestStat();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         graphic = new SymbolQuestStatGraphicGeneric(_nativeObject.graphic);
      }
      
      public function setNativeInstance(param1:SymbolButtonQuestStat) : void
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
