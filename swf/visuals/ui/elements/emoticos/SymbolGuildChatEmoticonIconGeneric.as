package visuals.ui.elements.emoticos
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolPlaceholderGeneric;
   
   public class SymbolGuildChatEmoticonIconGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolGuildChatEmoticonIcon = null;
      
      public var border:SymbolGuildChatEmoticonIconBorderGeneric = null;
      
      public var icon:SymbolPlaceholderGeneric = null;
      
      public function SymbolGuildChatEmoticonIconGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolGuildChatEmoticonIcon;
         }
         else
         {
            _nativeObject = new SymbolGuildChatEmoticonIcon();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         border = new SymbolGuildChatEmoticonIconBorderGeneric(_nativeObject.border);
         icon = new SymbolPlaceholderGeneric(_nativeObject.icon);
      }
      
      public function setNativeInstance(param1:SymbolGuildChatEmoticonIcon) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.border)
         {
            border.setNativeInstance(_nativeObject.border);
         }
         if(_nativeObject.icon)
         {
            icon.setNativeInstance(_nativeObject.icon);
         }
      }
   }
}
