package visuals.ui.elements.emoticos
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   
   public class SymbolGuildChatEmoticonPickerSeparatorGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolGuildChatEmoticonPickerSeparator = null;
      
      public function SymbolGuildChatEmoticonPickerSeparatorGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolGuildChatEmoticonPickerSeparator;
         }
         else
         {
            _nativeObject = new SymbolGuildChatEmoticonPickerSeparator();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
      }
      
      public function setNativeInstance(param1:SymbolGuildChatEmoticonPickerSeparator) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
      }
   }
}
